#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

#' @name main_fn
#' @description Run the code.
#' @param train_flag.
#' @return predict_all .
main_fn <- function(train_flag = FALSE, predict_all = FALSE){
  #Taking command prompt arguments.
  if(length(args)>0){
    if(length(args)==1){
      train_flag <- eval(parse(args[1]))
    }else{
      train_flag <- eval(parse(args[1]))
      predict_all <- eval(parse(args[2]))
    }
  }
  
  .libPaths(c(.libPaths(),"/home/soli/R/x86_64-pc-linux-gnu-library/3.4"))
  library(devtools)
  library(stringr)
  library(rgdal)
  setwd('/home/soli/w205_final_project/code/R')
  source('get_shape_files.R')
  source('access_cloud_bucket.R')
  source('big_query_extract.R')
  source('tfmodels.R')
  start_time <- Sys.time()
  #Image to train on and build a reference raster image.
  img_path <- 'earthengine/VIIRS/india_32bit/20140101.avg_rad.tif'
  ref_raster <- viirs_to_raster(img_path)
  #Get shapefile
  shape_info <- get_shape()
  sp_obj <- shape_info[['sp_obj']]
  
  if(train_flag==T){
  latest_checkpoint <- train_model(img_path = img_path,
                                   model_loc = "./tf/dnn/tst4",
                                   save_loc = "./tf/dnn/model_tst4",
                                   no_epochs = 200000,no_steps = 1000)
  print(sprintf('Latest checkpoint: %s',latest_checkpoint))}
  
  #Get all the VIIRS images
  full_folder <- gcs_list_objects(detail = "summary", prefix = "earthengine/VIIRS/india_32bit")
  img_files <- full_folder[which(full_folder$contentType=="image/tiff"),
                           which(colnames(full_folder) %in% c('name','updated'))]
  fname_list <- img_files$name
  print('All images in VIIRS')
  print(fname_list)
  start_idx <- ifelse(predict_all==T,1,length(fname_list))
  
  for(i in seq(start_idx,length(fname_list))){
    mod_img_path <- fname_list[i]
    input_fname <- unlist(str_split(fname_list[i],'/'))[4] #Extract filename
    output_fname <- paste(str_split(input_fname,"\\.",simplify = T)[1],
                        "mpce","tif",sep = ".")
  #browser()
  tst_predict <- predict_mpce(img_path = mod_img_path, model_loc = "./tf/dnn/tst4")
  ee <- mpce_raster(tst_predict,sp_obj,ref_raster,fname=output_fname,
                    cloud_folder = 'earthengine/Transformed_assets',
                    bucket_name = 'soli_ee_data')
  print(sprintf('Raster stored for %s',output_fname))
  }
print('All rasters transformed')
print('Total time')
print(start_time - Sys.time())
}

#'@name train_model
#'@description Train the model based on the image path in Google Cloud Storage.
#'@param img_path Image path on Cloud Storage which is used as input.
#'@param model_loc Model Directory path for Tensorflow Model.
#'@param save_loc  Path where model is exported to.
#'@param no_epochs Number of epochs for Deep Neural Network.
#'@param no_steps Number of steps to be run. Default set very low.
#'@return Saves the model to the specific local path and returns latest checkpoint.
train_model <- function(img_path = 'earthengine/VIIRS/india_32bit/20140101.avg_rad.tif',
                        model_loc, save_loc,no_epochs = 200,no_steps = 10){
shape_info <- get_shape()
sp_obj <- shape_info[['sp_obj']]
mpce <- get_table()
dist_map <- get_map()
print('Shapefile & District map extracted')
res.list <- suppressWarnings(image_to_features(img_path = img_path))
x <- res.list[['res.df']]
rasterdata <- res.list[['rasterdata']]
print('Image converted to rasters & features')

#mod_x <- data.frame(x[,1],t(apply(x[,-1],1,function(x){x/max(x)*100})))
#colnames(mod_x) <- colnames(x)
shp_idx <- x$shp_idx
dist_code <- shapeid_to_district(shp_idx,dist_map)
idx <- match(dist_code, mpce$district)
y <- mpce$median_monthly_exp[idx]

#Set training data
data <- data.frame(y, x, stringsAsFactors = F)
colnames(data) <- c('median_mpce',colnames(x))
data <- data[,-which(colnames(data) %in% 'shp_idx')] #Exclude shape_idx
data <- data[-which(is.na(data$median_mpce)),] #Remove districts where no data matches (47 districts)
scale_data <- data.frame(apply(data,2,scale), stringsAsFactors = F)
res.model <- lm(median_mpce~.,data=scale_data)
summary(res.model)
print('Training data created and linear regression tested')
#Build Canned Tensorflow estimator
print('Tensorflow initiated for building Deep Neural Network Regressor')
tf.res <- build_regressor(data, response='median_mpce',
                          model_loc=model_loc,
                          save_loc=save_loc,
                          no_epochs=no_epochs,
                          no_steps=no_steps)
print('Training complete. Returing local path for latest checkpoint')
return(latest_checkpoint(model_loc))
}


#'@name predict_mpce
#'@description Predict MPCE for a given nighttime light image stored in GCP.
#'@param img_path Path where image is stored.
#'@param model_loc Model Directory path of chosen DNN model.
#'@return Vector of predicted MPCE (Rs.) for each district.
predict_mpce <- function(img_path,model_loc){
  shape_info <- get_shape()
  sp_obj <- shape_info[['sp_obj']]
  mpce <- get_table()
  dist_map <- get_map()
  print('Shapefile & District map extracted')
  res.list <- suppressWarnings(image_to_features(img_path = img_path))
  x <- res.list[['res.df']]
  rasterdata <- res.list[['rasterdata']]
  print('Image converted to rasters & features')
  
  #mod_x <- data.frame(x[,1],t(apply(x[,-1],1,function(x){x/max(x)*100})))
  #colnames(mod_x) <- colnames(x)
  shp_idx <- x$shp_idx
  dist_code <- shapeid_to_district(shp_idx,dist_map)
  idx <- match(dist_code, mpce$district)
  y <- mpce$median_monthly_exp[idx]
  
  #Set training data
  data <- data.frame(y, x, stringsAsFactors = F)
  colnames(data) <- c('median_mpce',colnames(x))
  data <- data[-which(is.na(data$median_mpce)),] #Remove districts where no data matches (47 districts)
  data <- data[,-which(colnames(data) %in% 'shp_idx')] #Exclude shape_idx
  
  scale_data <- data.frame(apply(data,2,scale), stringsAsFactors = F)
  res.model <- lm(median_mpce~.,data=scale_data)
  summary(res.model)
  print('Training data created and linear regression tested')
  
  #Predict using saved Tensorflow model
  newdata <- data[,-1]
  tst_predict<- tf_predict(newdata,model_loc = model_loc)
  print('Prediction complete')
  return(tst_predict)
}

main_fn(train_flag = T, predict_all = F)

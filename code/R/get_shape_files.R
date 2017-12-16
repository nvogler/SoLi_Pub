#'@name get_shape
#'@description Get shapefile from local folder
#'@param loc Local path where shape files are stored.
#'@import rgdal
#'@return List of SpatialPolygonsDataFrame and dataframe with district info.
get_shape <- function(shp_path = '/home/soli/w205_final_project/data/shapefiles/IND_adm_shp/Districts'){
  sp_obj <- readOGR(shp_path, layer = 'IND_adm2')
  district_info <- read.csv(file.path(shp_path,"IND_adm2.csv"), stringsAsFactors = FALSE)
  shape_info <- list(sp_obj, district_info)
  names(shape_info) <- c('sp_obj', 'district_info')
  return(shape_info)
}

#' @name get_poly_pixels
#' @description Extract pixels associated with the specific polygon
#' @param polyg
#' @param raster_data
#' @return pixel_data
get_poly_pixels <- function(polyg, rasterdata){
  wgs84 <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  projection(rasterdata) <- CRS(wgs84)
  #mod_raster <- spTransform(rasterdata, proj4string(polyg))
  cropped_poly <- crop(rasterdata,extent(polyg), snap = "out")
  masked_poly <- mask(cropped_poly, polyg) 
  return(unlist(extract(cropped_poly,polyg)))
}

aggregate_radiance <- function(polyg, raster_data, fun = median){
  data <- get_poly_pixels(polyg, raster_data)
  return(fun(data, na.rm = T))
}


get_crs <- function(){return(CRS("+init=epsg:4326"))}

#' @name image_to_features
#' @description Converting image stored in GCP to feature set.
#' @param image_path Location of image in GCP.
#' @return Dataframe and raster with summary statistics of average radiance.
image_to_features <- function(img_path='earthengine/VIIRS/india_32bit/20140101.avg_rad.tif'){
  shape_info <- get_shape()
  sp_obj <- shape_info[['sp_obj']]
  rasterdata <- viirs_to_raster(img_path)
  rasterdata <- setMinMax(rasterdata)
  min_val <- minValue(rasterdata); max_val <- maxValue(rasterdata)
  
  ########Initialize parallel setup###########################
  library(parallel)
  
  total_cores <- detectCores()
  cl <- makeCluster(mc <- getOption("cl.cores", total_cores))
  clusterEvalQ(cl, library(raster)) 
  clusterExport(cl=cl, varlist=c("sp_obj", "rasterdata",'get_poly_pixels'),
                envir=environment())
  ############################################################
  ################Build Inline function#######################
  create_poly_stats <- function(i,sp_obj,rasterdata){
    pixel_dist <- get_poly_pixels(sp_obj[i,], rasterdata)
    if(any(is.na(pixel_dist))){pixel_dist[is.na(pixel_dist)] <- 0}
    
    shp_idx <- as.integer(as.character(sp_obj@data$ID_2[i]))
    median_rad <- median(pixel_dist, na.rm = T)
    avg_rad <- mean(pixel_dist,na.rm = T)
    var_rad <- var(pixel_dist, na.rm = T)
    min_rad <- min(pixel_dist, na.rm = T)
    max_rad <- max(pixel_dist, na.rm = T)
    #Build and see distribution across 10 fractiles
    fracts <- 10
    fract_names <- paste0('fract',as.character(1:fracts))
    brk <- seq(min(pixel_dist), max(pixel_dist), length.out = (fracts + 1))
    tmp.histo <- hist(pixel_dist, breaks=brk, plot = FALSE)
    fract_dist <- tmp.histo$counts/sum(tmp.histo$counts)
    names(fract_dist) <- fract_names
    df <- data.frame(shp_idx,median_rad,avg_rad,var_rad,
                     min_rad, max_rad,t(fract_dist), stringsAsFactors=FALSE) 
    #print(sprintf('Features extracted for %d',df$shp_idx[i]))
    return(df)}
  time_val <- Sys.time()
  print(sprintf('Parallel processing initiated at %s', time_val))
  par.res <- parLapply(cl,seq_len(nrow(sp_obj)),
                       function(i)create_poly_stats(i, sp_obj, rasterdata))
  print(sprintf('Total time taken %s:', Sys.time() - time_val))
  #Reduced processing time by a factor of 7X.
  res.df <- NULL
  for(i in seq_len(length(par.res))){
    tmp.df <- par.res[[i]]
    res.df <- rbind(res.df,tmp.df)
  }
  
  stopCluster(cl)
  
  res.list <- list(res.df, rasterdata)
  names(res.list) <- c('res.df','rasterdata')
  return(res.list)
}

#' @name shapeid_to_district
#' @description Converts shape ID 2 into full district code
#' @param id shape id no.2
#' @param map dataframe derived from \link[soli]{get_map}
#' @return numeric or vector
shapeid_to_district <- function(id,map){
  tmp_idx <- match(id,map$shp_id_2)
  dist_code <- map$full_district_code[tmp_idx]
  return(dist_code)
}

#' @name mpce_raster
#' @description Build raster using MPCE data.
#' @param mpce Predicted MPCE to be visualized.
#' @param sp_obj Spatial Polygon Objects used to build rasters.
#' @param ref_raster Reference raster image.
#' @param fname Filename to be used.
#' @param cloud_folder Folder used to upload data.
#' @param bucket_name GCP bucket to work in.
mpce_raster <- function(mpce,
                        sp_obj,
                        ref_raster,
                        fname='mpce.tif',
                        cloud_folder = 'earthengine/Transformed_assets',
                        bucket_name = 'soli_ee_data'){
  dims <- dim(ref_raster)
  r <-  raster(nrow = floor(dims[1]/10), ncol = floor(dims[2])/10)
  print('Base raster built')
  extent(r) <- extent(sp_obj)
  print('Rasterize information')
  #norm_mpce <- median_monthly/max(median_monthly, na.rm = T)*255
  mpce_rasterdata <- rasterize(sp_obj,r,mpce)
  print('Transfer to Cloud')
  raster_to_storage(mpce_rasterdata,cloud_fname = fname,
                    cloud_folder = cloud_folder,bucket_name = bucket_name)
  print('Raster stored')
}


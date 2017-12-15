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
    shp_idx <- as.integer(as.character(sp_obj@data$ID_2[i]))
    median_rad <- median(pixel_dist, na.rm = T)
    avg_rad <- mean(pixel_dist,na.rm = T)
    var_rad <- var(pixel_dist, na.rm = T)
    df <- data.frame(shp_idx,median_rad,avg_rad,var_rad,stringsAsFactors=FALSE) 
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

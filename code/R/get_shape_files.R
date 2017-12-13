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
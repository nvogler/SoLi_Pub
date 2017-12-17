#' @name viirs_to_raster
#' @description Converting cloudstorage tiff to Raster files.
#' @param img_path Image path in Cloud Storage.
#' @param store_loc Store location on local
#' @param remove Should the tiff file be removed after conversion to raster?
#' @return Raster Layer based on the tiff downloaded.
viirs_to_raster <- function(img_path = 'earthengine/VIIRS/india_32bit/20140101.avg_rad.tif',
                      storeloc = 'tmp.tif', remove = F){
  library(raster)
  init_gcp_storage()
  gcs_get_object(object_name = img_path,saveToDisk = storeloc, overwrite = T)
  rasterdata <- raster(file.path(getwd(),storeloc),layer = 1)
  if(remove==T){file.remove(file.path(getwd(),storeloc))}
  return(rasterdata)
  }

#' @name init_gcp_storage
#' @description Initialize Google Cloud Platform Storage
#' @param bucket_name
#' @param auth_file
#' @return None.
#' @import googleCloudStorageR.
init_gcp_storage <- function(bucket_name = 'soli_ee_data',
                             auth_file = "/home/soli/soli_auth_key/soli_key.json"){
  Sys.setenv(GCS_AUTH_FILE = auth_file)
  library(googleCloudStorageR)
  gcs_auth() #Get Authorization
  gcs_global_bucket(bucket_name) #Get bucket from Google Cloud Storage
}

#' @name raster_to_storage
#' @description Transfer raster data to GCP Cloud Storage.
#' @param img_raster Raster data which needs to be transferred.
#' @param cloud_fname Name of raster file on cloud (i.e. GTiff file)
#' @param cloud_folder Folder in which file should be stored.
#' @param bucket_name Global Bucket to be set (i.e. default = soli-ee-data)
raster_to_storage <- function(img_raster,
                              cloud_fname = 'tmp_output.tif',
                              cloud_folder = 'sandbox',
                              bucket_name = 'soli_ee_data'){
  init_gcp_storage()
  writeRaster(img_raster,'tmp_file.tif','GTiff', overwrite = T)
  #gcs_global_bucket(bucket_name)
  gcs_upload(file='tmp_file.tif',type='image/tiff',
             name=paste(cloud_folder,cloud_fname,sep="/"),
             predefinedAcl = 'publicRead',
             upload_type = 'simple')
  print('Transfer complete')
}


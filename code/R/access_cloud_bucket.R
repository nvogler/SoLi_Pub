Sys.setenv(GCS_AUTH_FILE = "/home/soli/soli_auth_key/soli_key.json")
library(googleCloudStorageR)
#Get Authorization
gcs_auth()
## get bucket info
#proj_name <- 'peerless-robot-187203'
#buckets <- gcs_list_buckets(proj_name)

#Get bucket from Google Cloud Storage
gcs_global_bucket("soli_ee_data")
objects <- gcs_list_objects()
#parsed_download <- gcs_get_object(objects$name[[1]])
#img_raw <- gcs_get_object('sandbox/landsat.tif')
#img_raw <- gcs_get_object('sandbox/districtwise_median_nightlights.tiff')
img_raw <- gcs_get_object('landsat_8bit.tif')
#img.url.path <- gcs_download_url('landsat_8bit.tif')
#f <- download.file(img.url.path,'url_down.tif', method='libcurl',mode = 'wb')
library(tiff)
library(rgdal)
library(s2)
img_raster <- suppressWarnings(tiff::readTIFF(source = img_raw, convert = T)) 
plot(img_raster)

library(raster)

#sessionInfo()
#capabilities
writeRaster(raster_img,'outfile.tif','GTiff')
gcs_upload(file='outfile.tif',
           type='image/tiff',
           name='sandbox/tst_upload.tif',
           predefinedAcl = 'publicRead',
           upload_type = 'simple')

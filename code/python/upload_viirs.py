# Import the Earth Engine Python Package
import ee

# Initialize the Earth Engine object, using the authentication credentials.
ee.Initialize()

# Print the information for an image asset.
image = ee.Image('srtm90_v4')
print(image.getInfo())

landsat = ee.Image('LANDSAT/LC08/C01/T1_TOA/LC08_123032_20140515').select(['B4', 'B3', 'B2'])
geometry = ee.Geometry.Rectangle([116.2621, 39.8412, 116.4849, 40.01236])
geometry = geometry['coordinates'][0]
task = ee.batch.Export.image.toCloudStorage(image = landsat,description = 'imageToCloud',bucket = 'soli_test_bucket',fileNamePrefix = 'india_viirs',scale = 30,crs = 'EPSG:4326',region = geometry)
task.start()

def PullAllImages2():
    # All Image Files
    ## Create dates List
    dates = list(range(20140101, 20141301, 100)) + \
            list(range(20150101, 20151301, 100)) + \
            list(range(20160101, 20161301, 100)) + \
            list(range(20170101, 20171001, 100))
    ## Create images list for avg_rad, cf_avg
    image_list = {}
    for date in dates:
      ## Create tuple of avg_rad, cf_avg
      image_list[date] = ((
        ee.Image("NOAA/VIIRS/DNB/MONTHLY_V1/VCMCFG/" + str(date)).select('avg_rad'),
        ee.Image("NOAA/VIIRS/DNB/MONTHLY_V1/VCMCFG/" + str(date)).select('cf_avg')
      ))
    for date in image_list.keys():
      tmp_filename = 'soli_test_bucket/manual_upload_test/' + str(date) + '.avg_rad'
      geometry = ee.Geometry.Rectangle([68.18625, 6.754256, 97.41516, 35.50133])
      geometry = geometry['coordinates'][0]
      task = ee.batch.Export.image.toCloudStorage(image = image_list[date][0],description = 'imageToCloud',bucket = 'soli_ee_data',fileNamePrefix = tmp_filename,scale = 1024,crs = 'EPSG:4326',region = geometry)
      task.start()
      print "Image stored for" + str(date)

    # Import
    return None

PullAllImages2()

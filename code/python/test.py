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
task = ee.batch.Export.image.toCloudStorage(image = landsat,
                                            description = 'imageToCloud',
                                            bucket = 'soli_ee_data',
                                            fileNamePrefix = 'india_viirs',
                                            scale = 30,
                                            crs = 'EPSG:4326',
                                            region = geometry)
task.start()      

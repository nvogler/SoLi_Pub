import urllib
import zipfile
import sys, os
import time
import ee
import google.datalab.storage as storage
from sys import stdout
from PIL import Image, ImageMath
from datetime import date, timedelta

# Connect and authorize
try:
  ee.Initialize()
  print('The Earth Engine package initialized successfully!')
except ee.EEException as e:
  print('The Earth Engine package failed to initialize!\n Consult readme file.')
except:
    print("Unexpected error:", sys.exc_info()[0])
    raise

# Pull Images
def ImportTifImage(image_list):
    # Create range for request
    geometry = ee.Geometry.Rectangle([68.18625, 6.754256, 97.41516, 35.50133])
    
    # Get download paths for images
    for date in image_list.keys():
        # avg_rad
        img_name = image_list[date][0].getDownloadUrl({
            'scale': 1024,
            'region': geometry['coordinates'][0]
        })

        stdout.write("\nDownloading from... \n...\r%s" % img_name)

        # Download file
        t_filename = str(date) + "_tif_file"
        file_dwnldr = urllib.URLopener()
        file_dwnldr.retrieve(img_name, t_filename)
        
        # Storage for filenames to be transferred
        transfers = []
        
        # Unzip and transform
        with zipfile.ZipFile(t_filename, 'r') as zipped_img:
            stdout.write("\nTransforming...\r%s" % zipped_img.namelist()[1])
            stdout.flush()
            # Load tif file 
            img = Image.open(zipped_img.extract(zipped_img.namelist()[1]))
            # Gamma correction
            img = ImageMath.eval("a**(gamma)", a=img, gamma=10)
            # Save 32 bit int / pixel
            img.convert('I').save("32bit/" + str(zipped_img.namelist()[1]))
            # Save 8 bit int / pixel
            img.convert('L').save("8bit/" + str(zipped_img.namelist()[1]))
            # Remove zipped file
            os.remove(zipped_img.namelist()[1])
            # Store for transfer
            transfers.append(str(zipped_img.namelist()[1]))
        # Remove downloaded file
        os.remove(t_filename)
    stdout.write("\nComplete.\n")
    
    # Return transfers list
    return transfers

# Initial Pull (All images)
def PullAllImages():
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

    # Import
    return ImportTifImage(image_list)

# Update Pull (New image only)
def PullMostRecentImage():
    # Only most recent file (3 months ago due to earth engine delays)
    date_min = date.today() - timedelta(days=date.today().day + 1)
    date_min = date_min - timedelta(days=date_min.day + 1)
    date_min = date_min - timedelta(days=date_min.day + 1)
    date_min = date_min - timedelta(days=date_min.day - 1 )
    date_min = str(date_min).replace('-', '')

    ## Create tuple of avg_rad, cf_avg
    image_list = {}
    image_list[date_min] = ((
      ee.Image("NOAA/VIIRS/DNB/MONTHLY_V1/VCMCFG/" + str(date_min)).select('avg_rad'), 
      ee.Image("NOAA/VIIRS/DNB/MONTHLY_V1/VCMCFG/" + str(date_min)).select('cf_avg')
    ))

    # Import
    return ImportTifImage(image_list)

# Transfer Downloaded Image Files to GCP Bucket
def TransferLocalToGCP(transfers):
    for filename in transfers:
        stdout.write("\nTransferring files to GCP...\n")
        # Transfer 32bit
        tsf_32 = '32bit/' + filename
        !gsutil cp '$tsf_32' gs://soli_ee_data/earthengine/VIIRS/india_32bit
        # Transfer 8bit
        tsf_8 = '8bit/' + filename
        !gsutil cp '$tsf_8' gs://soli_ee_data/earthengine/VIIRS/india_8bit

    stdout.write("\nComplete.\n")
    stdout.flush()
    
# Upload all to Earth Engine  
def UploadAllToEarthEngine():
  # Pull filenames from bucket + path
  filenames = [o.key for o in storage.Bucket('soli_ee_data').objects()
    if o.key.startswith('earthengine/Transformed_assets/')]

  # Iterate files in bucket
  for filename in filenames:
    # Asset ID, Filename
    xfer_file = filename.split('/')[-1]
    asset_id = xfer_file.split('.')[0]
    # Verify not null
    if asset_id != "":
      print ("Asset ID: " + asset_id)
      print ("Filename: " + xfer_file)
      # Upload to Earth Engine
      try:
        !earthengine upload image --asset_id=users/nvogler/soli/'$asset_id' gs://soli_ee_data/earthengine/Transformed_assets/'$xfer_file'
      except(e):
        print ("Error uploading image to Earth Engine.\n" + str(e))

# Upload new to Earth Engine        
def UploadNewToEarthEngine():
  # Only most recent file (3 months ago due to earth engine delays)
  date_min = date.today() - timedelta(days=date.today().day + 1)
  date_min = date_min - timedelta(days=date_min.day + 1)
  date_min = date_min - timedelta(days=date_min.day + 1)
  date_min = date_min - timedelta(days=date_min.day - 1 )
  date_min = str(date_min).replace('-', '')
  
  # Pull filenames from bucket + path
  filenames = [o.key for o in storage.Bucket('soli_ee_data').objects()
    if o.key.startswith('earthengine/Transformed_assets/')]

  # Iterate files in bucket
  for filename in filenames:
    # Asset ID, Filename
    xfer_file = filename.split('/')[-1]
    asset_id = xfer_file.split('.')[0]
    # Verify correct file
    if date_min in asset_id:
      print ("Asset ID: " + asset_id)
      print ("Filename: " + xfer_file)
      # Upload to Earth Engine
      try:
        !earthengine upload image --asset_id=users/nvogler/soli/'$asset_id' gs://soli_ee_data/earthengine/Transformed_assets/'$xfer_file'
      except(e):
        print ("Error uploading image to Earth Engine.\n" + str(e))

UploadAllToEarthEngine()
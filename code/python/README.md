# Earth Engine API interfacing using Python
The scripts in the folder will help extract raster geotiff files from the Earth Engine API.
It also helps convert survey data extracted from BigQuery to raster images (stored in survey raster).  
  
Follow the steps outlined below to completed the process. Steps 1, 2, and 4 apply to both the intitialization path and teh update path. Steps 3 and 5 are split between the paths. Follow X.i for project initialization and X.u for project updating.

## Connecting to the datalab, opening iPython notebook  
  -- From the Google Cloud Platform Shell, run the following to create a connection to the datalab:  
  datalab connect datalab-ee-vm-vogler-nvogler  --no-user-checking   
  -- Browse to /datalab/  
  -- Open VIIRS+Query.ipynb  
  
## Initialize, authorize connection to the Earth Engine  
 --(1) Run cell.  
 --(Failure) On authorization failure, completed steps outlined in the authorize_notebook_server.ipynb notebook  
  
## Import required packages and define functions  
  --(2) Run cell.  
  -- Imports packages needed to communicate with the Earth Engine API and to process the images.   
  
## Pull Image Collection    
### Initial Pull (All images)  
  --(3.i) Run this cell on initialization of the project only  
  -- Downloads all available images from the dataset and prepares them for transformation  
  
### Update Pull (New image only)  
  -- (3.u) Run this cell to pull the most recent image  
  -- Downloads the most recent image from the dataset and prepares it for transformation 
  
## Transfer downloaded image(s) to GCP bucket for transformation  
  --(4) Run cell.  
  -- Transfers image(s) from the directory local to the script to a GCP bucket accessible by the transformation application
  
# AFTER files have been transformed and uploaded to GCP  
## Upload to Earth Engine  
### All images in GCP bucket (project intialization only)  
  --(5.i) Run this cell on initialization of the project only   
  -- Uploads all images in the folder to the Earth Engine  
  
### New imges in GCP bucket (project update) 
  --(5.u) Run this cell to upload only on project updates  
  -- Uploads only the most recent image to the Earth Engine, instead of all files in the folder  
  

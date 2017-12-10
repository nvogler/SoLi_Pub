library(foreign)
library(rgdal)
library(s2)
library(gdas2utils)
library(ggmap)
library(stringdist)
fpath <- 'C:\\NSS_survey_microdata\\household_characteristics_block3.dbf'
df <- read.dbf(fpath, as.is = T)
dist <- read.csv('C:\\NSS_survey_microdata\\dist_list.csv', stringsAsFactors = FALSE)
shp_path <- 'C:\\Users\\saifrais\\Documents\\EasyDay\\SoMo\\IND_adm_shp\\Districts'
sp_obj <- readOGR(shp_path, layer = 'IND_adm2')
plot(sp_obj)
district_info <- read.csv(file.path(shp_path,"IND_adm2.csv"), stringsAsFactors = FALSE)
#Get geocoordinates for Shape File.
district_name <- paste(district_info$NAME_0, district_info$NAME_1, district_info$NAME_2, sep = " ")
tmp_geo <- NULL
shape_coords <- NULL
for(i in seq_len(length(district_name))){
  tmp_geo <- geocode(district_name[i], output = "latlon")
  tmp_res <- data.frame(district_info$NAME_0[i], district_info$NAME_1[i],
                        district_info$NAME_2[i],tmp_geo, stringsAsFactors = FALSE)
  colnames(tmp_res) <- c('NAME_0','NAME_1','NAME_2','lon','lat')
  shape_coords <- rbind(shape_coords, tmp_res)
  
}
#geocode_districts <- sapply(district_name,function(x){geocode(x, output = "all")})

#saveRDS(geocode_districts, 'C:\\NSS_survey_microdata\\geocode_districts.Rds')
saveRDS(sp_obj, 'C:\\NSS_survey_microdata\\spatial_objects.Rds')

#Compare District Names
str_compare_idx <- apply(stringdistmatrix(dist$dist,district_info$NAME_2,"lv"),1,which.min)
df_map <- data.frame(dist$dist, district_info$NAME_2[str_compare_idx], str_compare_idx, stringsAsFactors = F)
colnames(df_map) <- c('survey.district','shape.district','shape_idx')
lv.score <- apply(df_map,1,function(x)stringdist(x['survey.district'],x['shape.district']))
df_map <- cbind(df_map, lv.score)


mpce <- read.csv('C:\\NSS_survey_microdata\\districtwise_expenditure.csv', stringsAsFactors = FALSE)
india_spatial <- fortify(sp_obj, region = 'NAME_2')
dist_idx <- match(mpce$district,district_map$full_district_code)
mpce$dist_names <- district_map$shp_district_name[dist_idx]

gg <- ggplot()
gg <- gg + geom_map(data=mpce,aes(map_id=dist_names,fill=median_monthly_exp),map=india_spatial)
gg <- gg + expand_limits(x=india_spatial$long, y = india_spatial$lat)
gg <- gg + scale_fill_gradient2(low=muted("grey"),high=muted("red"))

distcenters <- ddply(india_s, .(id), summarize, clat = mean(lat), clong = mean(long))
gg <- gg + geom_text()
plot(gg)

#Pulling a raster file
library(raster)
library(sp)
library(rgdal)
fpath_img <- 'C:\\NSS_survey_microdata\\world_map_2016_3km.tif'
night_lights <- raster(fpath_img)
plot(night_lights)
night_lights@extent
image(night_lights, zlim = c(200,255))
image(night_lights, zlim = c(0,200), col = "grey")

idx.map <- match(df_map$survey.district,mpce$dist_names)

median_monthly <- mpce$median_monthly_exp[idx.map]
normalized_median_monthly <- median_monthly/max(median_monthly, na.rm = T)*255

avg_monthly <- mpce$avg_monthly_exp[idx.map]
normalized_avg_monthly <- avg_monthly/max(median_monthly, na.rm = T)*255


r <- raster(ncol=1000,nrow=1800)
extent(r) <- extent(sp_obj)
median_monthly_raster <- rasterize(sp_obj,r,normalized_median_monthly)

raster_aggte <- rasterize(sp_obj,night_lights, fun = 'mean', mask = T)

aggregate_radiance <- function(polyg, raster, fun = median){
  wgs84 <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  projection(raster) <- CRS(wgs84)
  cropped_poly <- crop(raster,extent(polyg))
  masked_poly <- mask(cropped_poly, polyg) 
  return(fun(unlist(extract(cropped_poly,polyg)), na.rm = T))
}
median_rad <- NULL
for(i in seq_len(nrow(sp_obj))){median_rad[i] <- aggregate_radiance(sp_obj[i,], night_light_mod)}

avg_rad <- NULL
for(i in seq_len(nrow(sp_obj))){avg_rad[i] <- aggregate_radiance(sp_obj[i,], night_light_mod, mean)}

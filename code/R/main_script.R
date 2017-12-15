#library(devtools)
setwd('/home/soli/w205_final_project/code/R')
source('get_shape_files.R')
source('access_cloud_bucket.R')
source('big_query_extract.R')
source('tfmodels.R')
shape_info <- get_shape()
#sp_obj <- shape_info[['sp_obj']]
mpce <- get_table()
dist_map <- get_map()
res.list <- suppressWarnings(image_to_features())
x <- res.list[['res.df']]
#mod_x <- data.frame(x[,1],t(apply(x[,-1],1,function(x){x/max(x)*100})))
#colnames(mod_x) <- colnames(x)

tmp_idx <- match(x$shp_idx,dist_map$shp_id_2)
dist_code <- dist_map$full_district_code[tmp_idx]
idx <- match(dist_code, mpce$district)
y <- mpce$median_monthly_exp[idx]

#Set training data
data <- data.frame(y, x, stringsAsFactors = F)
colnames(data) <- c('median_mpce',colnames(x))
data <- data[,-which(colnames(data) %in% 'shp_idx')] #Exclude shape_idx
data <- data[-which(is.na(data$median_mpce)),] #Remove districts where no data matches (47 districts)
scale_data <- data.frame(apply(data,2,scale), stringsAsFactors = F)
res.model <- lm(median_mpce~median_rad,data=scale_data)

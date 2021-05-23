library(raster)
library(ncdf4)
setwd("C:/ponderful/")
cl <- colorRampPalette(c('red','orange','yellow'))(100)

region <- raster("c_gls_SWI1km_202105211200_CEURO_SCATSAR_V1.0.1.nc")
plot(region)
ext <- c(13.7073,13.7099,52.4939,52.4954)  # xmin xmax ymin ymax
pond_23 <- crop(region, ext)
fire_austr_jun_2020 <- reclassify(fire_austr_jun_2020, cbind(253:255, NA))
plot(pond_23, col=cl)

regionbis <- raster("c_gls_SWI1km_QL_202105211200_CEURO_SCATSAR_V1.0.1.tiff")
plot(regionbis)
ext <- c(13.7073,13.7099,52.4939,52.4954)  # xmin xmax ymin ymax
pond_23 <- crop(regionbis, ext)
plot(pond_23)

ext <- c(13.707,13.709,52.493,52.495)  # xmin xmax ymin ymax
pond_23 <- crop(regionbis, ext)
plot(pond_23)

ext <- c(13.70,13.71,52.49,52.50)  # xmin xmax ymin ymax
pond_23 <- crop(regionbis, ext)
plot(pond_23)

cl <- colorRampPalette(c('brown4','red3','red','orange2','orange','yellow2','yellow'))(100) 
ext <- c(13,14,52,53)  # xmin xmax ymin ymax
pond_23 <- crop(regionbis, ext)
plot(pond_23, col=cl)

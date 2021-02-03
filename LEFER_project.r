library(raster)
libary(ncdf4)
setwd("C:/lab/")
cl <- colorRampPalette(c('red','orange','yellow'))(100)

fire_beg_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808100000_OCEA_PROBAV_V1.5.tiff")
plot(fire_beg_aug_2018)

fire_mid_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808200000_OCEA_PROBAV_V1.5.tiff")
plot(fire_mid_aug_2018)

fire_end_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808310000_OCEA_PROBAV_V1.5.tiff")
plot(fire_end_aug_2018)

fire_end_aug_2018_lay <- brick("g2_BIOPAR_BA_QL_201808310000_OCEA_PROBAV_V1.5.tiff")
plot(fire_end_aug_2018_lay)

global_fire_2020 <- raster("c_gls_BA300_202006200000_GLOBE_PROBAV_V1.1.1.nc")
plot(global_fire_2020)


par(mfrow=c(3,1))
plot(fire_beg_aug_2018)
plot(fire_mid_aug_2018)
plot(fire_end_aug_2018)

fire_aug <- stack(fire_beg_aug_2018,fire_mid_aug_2018,fire_end_aug_2018)
plot(fire_aug)

dif <- fire_end_aug_2018 - fire_beg_aug_2018
plot(dif)

fire_end_aug_2018 <- reclassify(fire_end_aug_2018, cbind(253:255, NA))

library(raster)
library(ncdf4)
setwd("C:/lab/")
cl <- colorRampPalette(c('red','orange','yellow'))(100)

############################ FIRES THAT OCCURED IN AUSTRALIA DURING AUGUST 2018
fire_beg_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808100000_OCEA_PROBAV_V1.5.tiff")
plot(fire_beg_aug_2018)

fire_mid_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808200000_OCEA_PROBAV_V1.5.tiff")
plot(fire_mid_aug_2018)

fire_end_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808310000_OCEA_PROBAV_V1.5.tiff")
plot(fire_end_aug_2018)

fire_end_aug_2018_lay <- brick("g2_BIOPAR_BA_QL_201808310000_OCEA_PROBAV_V1.5.tiff")
plot(fire_end_aug_2018_lay)

############################# FIRES THAT OCCURED IN AUSTRALIA FROM JUNE TO DECEMBER 2020
global_fire_jun_2020 <- raster("c_gls_BA300_202006300000_GLOBE_PROBAV_V1.1.1.nc")
#plot(global_fire_jun_2020)
ext <- c(110,157,-45,-10)  # xmin xmax ymin ymax
fire_austr_jun_2020 <- crop(global_fire_jun_2020, ext)
fire_austr_jun_2020 <- reclassify(fire_austr_jun_2020, cbind(253:255, NA))
plot(fire_austr_jun_2020, col=cl)

fire_austr_jun_2020_points <- crop(global_fire_jun_2020, ext)
plot(fire_austr_jun_2020_points)

par(mfrow=c(2,1))
plot(fire_austr_jun_2020, col=cl)
plot(fire_austr_jun_2020_points)

global_fire_jul_2020 <- raster("c_gls_BA300_202007310000_GLOBE_PROBAV_V1.1.1.nc")
#plot(global_fire_jul_2020)
fire_austr_jul_2020 <- crop(global_fire_jul_2020, ext)
plot(fire_austr_jul_2020)

global_fire_aug_2020 <- raster("c_gls_BA300_202008310000_GLOBE_PROBAV_V1.1.1.nc")
#plot(global_fire_aug_2020)
fire_austr_aug_2020 <- crop(global_fire_aug_2020, ext)
plot(fire_austr_aug_2020)

global_fire_sept_2020 <- raster("c_gls_BA300_202009300000_GLOBE_PROBAV_V1.1.1.nc")
#plot(global_fire_sept_2020)
fire_austr_sept_2020 <- crop(global_fire_sept_2020, ext)
plot(fire_austr_sept_2020)

global_fire_oct_2020 <- raster("c_gls_BA300_202010310000_GLOBE_PROBAV_V1.1.1.nc")
#plot(global_fire_oct_2020)
fire_austr_oct_2020 <- crop(global_fire_oct_2020, ext)
plot(fire_austr_oct_2020)

global_fire_nov_2020 <- raster("c_gls_BA300_202011300000_GLOBE_PROBAV_V1.1.1.nc")
#plot(global_fire_nov_2020)
fire_austr_nov_2020 <- crop(global_fire_nov_2020, ext)
plot(fire_austr_nov_2020)

global_fire_dec_2020 <- raster("c_gls_BA300_202012310000_GLOBE_PROBAV_V1.1.1.nc")
#plot(global_fire_dec_2020)
fire_austr_dec_2020 <- crop(global_fire_dec_2020, ext)
plot(fire_austr_dec_2020)

par(mfrow=c(7,1))
plot(fire_austr_jun_2020)
plot(fire_austr_jul_2020)
plot(fire_austr_aug_2020)
plot(fire_austr_sept_2020)
plot(fire_austr_oct_2020)
plot(fire_austr_nov_2020)
plot(fire_austr_dec_2020)

dif <- fire_austr_jul_2020 - fire_austr_dec_2020
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(dif, col=cldif)
#################################################
fire_aug <- stack(fire_beg_aug_2018,fire_mid_aug_2018,fire_end_aug_2018)
plot(fire_aug)


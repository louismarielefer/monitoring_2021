library(raster)
setwd("C:/lab/")

fire_mid_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808200000_OCEA_PROBAV_V1.5.tiff")
plot(fire_mid_aug_2018)

fire_end_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808310000_OCEA_PROBAV_V1.5.tiff")
plot(fire_end_aug_2018)

fire_beg_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808100000_OCEA_PROBAV_V1.5.tiff")
plot(fire_beg_aug_2018)

par(mfrow=c(3,1))
plot(fire_beg_aug_2018)
plot(fire_mid_aug_2018)
plot(fire_end_aug_2018)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

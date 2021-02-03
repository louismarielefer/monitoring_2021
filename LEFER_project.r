library(raster)
setwd("C:/lab/")

fire_end_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808310000_OCEA_PROBAV_V1.5.tiff")
plot(fire_end_aug_2018)

fire_mid_aug_2018 <- raster("g2_BIOPAR_BA_QL_201808200000_OCEA_PROBAV_V1.5.tiff")
plot(fire_mid_aug_2018)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

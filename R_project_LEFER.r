library(spatstat)
setwd("C:/lab/")

################################### FIRES IN AUSTRALIA IN 2019
fire_austr_2019 <- read.table("modis_2019_Australia.csv", header=TRUE, sep=",")
fire_austr_2019
head(fire_austr_2019)
names(fire_austr_2019)
summary(fire_austr_2019) #to determine min and max longitude and latitude and then using them for plotting the density map
attach(fire_austr_2019)


fire_austr_2019_planar <- ppp(longitude,latitude,c(113,154),c(-43,-9)) #ppp planar point pattern, expalin to R that our data are spatial data
#c() is the range of x(longitude in this case) and range of y(latitude in this case)

fire_density_map_2019 <- density(fire_austr_2019_planar)

#putting countries boundaries on top of the map
library(rgdal)

coastlines <- readOGR("ne_10m_coastline.shp")

cl <- colorRampPalette(c('brown4','red3','red','orange2','orange','yellow2','yellow'))(100) 

plot(fire_density_map_2019, col=cl)
points(fire_austr_2019_planar,col="purple", pch=20, cex=0.5)
plot(coastlines, add=TRUE)

###################################### FIRES IN AUSTRALIA IN 2000

fire_austr_2000 <- read.table("modis_2000_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2000)
attach(fire_austr_2000)

fire_austr_2000_planar <- ppp(longitude,latitude,c(113,154),c(-43,-9))
fire_density_map_2000 <- density(fire_austr_2000_planar)
plot(fire_density_map_2000, col=cl)
points(fire_austr_2000_planar,col="purple", pch=20, cex=0.5)


library(spatstat)
setwd("C:/lab/")

################################### FIRES IN AUSTRALIA IN 2019
fire_austr_2019 <- read.table("modis_2019_Australia.csv", header=TRUE, sep=",")
fire_austr_2019
head(fire_austr_2019)
names(fire_austr_2019)
summary(fire_austr_2019) #to determine min and max longitude and latitude and then using them for plotting the density map
attach(fire_austr_2019)


fire_austr_2019_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8)) #ppp planar point pattern, expalin to R that our data are spatial data
#c() is the range of x(longitude in this case) and range of y(latitude in this case)

fire_density_map_2019 <- density(fire_austr_2019_planar)

#putting countries boundaries on top of the map
library(rgdal)

coastlines <- readOGR("ne_10m_coastline.shp")
ext <- c(112,155,-44,-8)
austr_coastlines <- crop(coastlines, ext)

cl <- colorRampPalette(c('brown4','red3','red','orange2','orange','yellow2','yellow'))(100) 

plot(fire_density_map_2019, col=cl)
points(fire_austr_2019_planar,col="darkblue", pch=20, cex=0.5)
plot(coastlines, add=TRUE)

###################################### FIRES IN AUSTRALIA IN 2000

fire_austr_2000 <- read.table("modis_2000_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2000)
attach(fire_austr_2000)

fire_austr_2000_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2000 <- density(fire_austr_2000_planar)
plot(fire_density_map_2000, col=cl)
points(fire_austr_2000_planar,col="darkblue", pch=20, cex=0.5)
plot(coastlines, add=TRUE)

#################################### 2000 VS 2019
par(mfrow=c(2,1)) 
plot(fire_density_map_2000, col=cl)
points(fire_austr_2000_planar,col="darkblue", pch=20, cex=0.5)
plot(coastlines, add=TRUE)
plot(fire_density_map_2019, col=cl)
points(fire_austr_2019_planar,col="darkblue", pch=20, cex=0.5)
plot(coastlines, add=TRUE)

dif_map <- fire_density_map_2019 - fire_density_map_2000
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(dif_map, col=cldif)
plot(coastlines, add=TRUE)

cl <- colorRampPalette(c('maroon','red3','tomato1','lightsalmon','lightpink2','yellow2','yellow'))(100)

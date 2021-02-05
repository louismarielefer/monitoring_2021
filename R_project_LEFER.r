library(sp)
library(spatstat)
setwd("C:/lab/")

fire_austr_2019 <- read.table("modis_2019_Australia.csv", header=TRUE, sep=",")
fire_austr_2019
head(fire_austr_2019)
names(fire_austr_2019)
summary(fire_austr_2019)
attach(fire_austr_2019)


fire_austr_2019_planar <- ppp(longitude,latitude,c(113,154),c(-43,-9)) #ppp planar point pattern, expalin to R that our data are spatial data
#c() is the range of x(lon in this case) and range of y(lat in this case)

density_map <- density(fire_austr_planar)

plot(density_map) 

points(fire_austr_2019_planar) #make appear points of countries

#putting countries boundaries on top of the map
library(rgdal)

coastlines <- readOGR("ne_10m_coastline.shp")

plot(density_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)

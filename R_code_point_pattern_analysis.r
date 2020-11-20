#point pattern analysis

install.packages("spatstat") #example: we made some samples ramdomly in a field but we can't make samples everywhere
#but how to predict data in an area where we didn't make any sample
#ie passer du discontinu au continu to create a map
#solution: thanks to spatstat package

library(spatstat)

setwd("C:/lab/")
read.table("covid_agg.csv", header=TRUE)
covid

#let's see the covid data density
#let's make a planar point pattern

attach(covid)
covid_planar <- ppp(lon,lat,c(-180,180),c(-90,90)) #c() is the range of x(lon in this case) and range of y(lat in this case)
#here we put the maximum range to have the entire worldmap

density_map <- density(covid_planar)

plot(density_map) #faire apparaître la map

points(covid_planar) #make appear points of countries

cl <- colorRampPalette(c('yellow','orange','red'))(100) #how to change the dégradé de couleurs, 100 is the number of colours between the two extreme colors
plot(density_map, col=cl)
points(covid_planar)

#putting countries boundaries on top of the map

install.packages("rgdal")

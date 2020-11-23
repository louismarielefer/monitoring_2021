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
covid_planar <- ppp(lon,lat,c(-180,180),c(-90,90)) #ppp planar point pattern, expalin to R that our data are spatial data
#c() is the range of x(lon in this case) and range of y(lat in this case)
#here we put the maximum range to have the entire worldmap

density_map <- density(covid_planar)

plot(density_map) #faire apparaître la map

points(covid_planar) #make appear points of countries

cl <- colorRampPalette(c('yellow','orange','red'))(100) #how to change the dégradé de couleurs, 100 is the number of colours between the two extreme colors
plot(density_map, col=cl)
points(covid_planar)

#putting countries boundaries on top of the map

install.packages("rgdal")
# when we see a + it means that we haven't finished to tipe the function yet and it asks us to finish it
library(rgdal)

coastlines <- readOGR("ne_10m_coastline.shp")

plot(density_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE) #add=TRUE to put countries on the density map, if not another graph appears with only a worldmap

#dev.off() pour fermer la fenêtre de graph

# how to save this graph 

png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#the png and pdf files are in the lab folder
# Europe is the part of the world where covid density is the highest, it means that every european country has at least one case

############################# INTERPOLATE CASES DATA, what are countries with the highest number of cases
png("figure2.png")
pdf("figure2.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100)
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar) #what are the values where we did not sample
plot(cases_map, col = cl)
plot(coastlines, add = T)
points(covid_planar)

#China is the country where there is the highest number of cases

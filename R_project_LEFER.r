################################### 

#FIRES IN AUSTRALIA IN 2019

library(spatstat)
setwd("C:/lab/")

fire_austr_2019 <- read.table("modis_2019_Australia.csv", header=TRUE, sep=",")
fire_austr_2019
head(fire_austr_2019)
names(fire_austr_2019)
summary(fire_austr_2019) #to determine min and max longitude and latitude and then using them for plotting the density map
attach(fire_austr_2019)


fire_austr_2019_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8)) #ppp planar point pattern, expalin to R that our data are spatial data
#c() is the range of x(longitude in this case) and range of y(latitude in this case)

fire_density_map_2019 <- density(fire_austr_2019_planar)

#putting australian boundaries on top of the map
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")

library(raster)
ext <- c(112,155,-44,-8)
austr_coastlines <- crop(coastlines, ext)

cl <- colorRampPalette(c('brown4','red3','red','orange2','orange','yellow2','yellow'))(100) 

plot(fire_density_map_2019, col=cl, main="Density map of burnt areas in Australia (2019)")
points(fire_austr_2019_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

# FIRES IN AUSTRALIA IN 2000

fire_austr_2000 <- read.table("modis_2000_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2000)
attach(fire_austr_2000)

fire_austr_2000_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2000 <- density(fire_austr_2000_planar)
plot(fire_density_map_2000, col=cl, main="Density map of burnt areas in Australia (2000)")
points(fire_austr_2000_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

#FIRES IN AUSTRALIA IN 2005
fire_austr_2005 <- read.table("modis_2005_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2005)
attach(fire_austr_2005)

fire_austr_2005_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2005 <- density(fire_austr_2005_planar)
plot(fire_density_map_2005, col=cl, main="Density map of burnt areas in Australia (2005)")
points(fire_austr_2005_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

# FIRES IN AUSTRALIA IN 2010
fire_austr_2010 <- read.table("modis_2010_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2010)
attach(fire_austr_2010)

fire_austr_2010_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2010 <- density(fire_austr_2010_planar)µ
plot(fire_density_map_2010, col=cl, main="Density map of burnt areas in Australia (2010)")
points(fire_austr_2010_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

# FIRES IN AUSTRALIA IN 2015
fire_austr_2015 <- read.table("modis_2015_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2015)
attach(fire_austr_2015)

fire_austr_2015_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2015 <- density(fire_austr_2015_planar)
plot(fire_density_map_2015, col=cl, main="Density map of burnt areas in Australia (2015)")
points(fire_austr_2015_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

# COMPARING THE YEARS
png("Evolution_burnt_areas_2000_2019")
par(mfrow=c(2,3)) 

plot(fire_density_map_2000, col=cl, main="2000")
points(fire_austr_2000_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

plot(fire_density_map_2005, col=cl, main="2005")
points(fire_austr_2005_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

plot(fire_density_map_2010, col=cl, main="2010")
points(fire_austr_2010_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

plot(fire_density_map_2015, col=cl, main="2015")
points(fire_austr_2015_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

plot(fire_density_map_2019, col=cl, main="2019")
points(fire_austr_2019_planar,col="darkblue", pch=20, cex=0.5)
plot(austr_coastlines, add=TRUE)

dev.off()

#we observe a shift from West to North and then from North to East

# HOW MANY NEW BURNT AREAS FROM ONE YEAR TO ANOTHER ?
dif_map_2005_2000 <- fire_density_map_2005 - fire_density_map_2000
cldif <- colorRampPalette(c('blue','lightblue','white','red1','red3'))(100) 
plot(dif_map_2005_2000, col=cldif)
plot(austr_coastlines, add=TRUE)

dif_map_2010_2005 <- fire_density_map_2010 - fire_density_map_2005
plot(dif_map_2010_2005, col=cldif)
plot(austr_coastlines, add=TRUE)

dif_map_2015_2010 <- fire_density_map_2015 - fire_density_map_2010
plot(dif_map_2015_2010, col=cldif)
plot(austr_coastlines, add=TRUE)

dif_map_2019_2015 <- fire_density_map_2019 - fire_density_map_2015
plot(dif_map_2019_2015, col=cldif)
plot(austr_coastlines, add=TRUE)

dif_map_2019_2000 <- fire_density_map_2019 - fire_density_map_2000
plot(dif_map_2019_2000, col=cldif)
plot(austr_coastlines, add=TRUE)


png("dif_map_comp")
par(mfrow=c(2,2))

plot(dif_map_2005_2000, col=cldif)
plot(austr_coastlines, add=TRUE)

plot(dif_map_2010_2005, col=cldif)
plot(austr_coastlines, add=TRUE)

plot(dif_map_2015_2010, col=cldif)
plot(austr_coastlines, add=TRUE)

plot(dif_map_2019_2015, col=cldif)
plot(austr_coastlines, add=TRUE)

plot(dif_map_2019_2000, col=cldif)
plot(austr_coastlines, add=TRUE)

dev.off()

################################################
library(raster)


before_fire <- brick("before_fire.jpg") #brick function to read raster images
before_fire
plot(before_fire)
# B1: blue
# B2: green
# B3: red
# B4: NIR
#with the min and max values for each color
cl <- colorRampPalette(c('black','grey','light grey'))(100) 
plot(p224r63_2011, col=cl)

par(mfrow=c(2,2)) #pannel with 4 images, 2 lines, 2 columns

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) #first image blue
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) #second image green
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) #3rd image red
plot(p224r63_2011$B3_sre, col=clr)

# Exercise: plot the final band, namely the NIR, band number 4
# red, orange, yellow

clnir <- colorRampPalette(c('red','orange','yellow'))(100) #4rd image infrared
plot(p224r63_2011$B4_sre, col=clnir)

#these bands are all over each others

#how would a human eye see this landscape: RGB system, superposition of the red, green, blue bands
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

#let's add infrared band
#but the pb is that ith RGB we can only use 3 bands
# so let's shift by one
# so let's mount NIR (infrared) ontop the G of RGB
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") #enables us to see details we wouldn't be able to see otherwise
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

pdf("monitor_amazonia.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()


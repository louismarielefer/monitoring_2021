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

################################################ CONSEQUENCES
# FIRST CONSEQUENCE: VEGETATION LOSS

library(raster)
library(RStoolbox)

NP_during_fire <- brick("National_Park_during_fire.jpg") #brick function to read raster images
NP_during_fire
plot(NP_during_fire)
plotRGB(NP_during_fire, r=8, g=4, b=3, stretch="Lin")

NP_after_fire <- brick("National_Park_after_fire.jpg")
NP_after_fire
plot(NP_after_fire)
plotRGB(NP_during_fire, r=1, g=2, b=3, stretch="Lin")

png("National_Park_during_after_fire")
par(mfrow=c(2,1))
plotRGB(NP_during_fire, r=1, g=2, b=3, stretch="Lin")
plotRGB(NP_after_fire, r=1, g=2, b=3, stretch="Lin")
dev.off()

#################


dvi1 <- NP_during_fire$National_Park_during_fire.1 - NP_during_fire$National_Park_during_fire.2 #defor1$defor1_.1 is the infrared band of the 1st image, defor1_.2 is the red band
dev.off()
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi1, col=cl)

#DVI for the 2nd period
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)


par(mfrow=c(2,1))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

#difference in DVI before and after cut
difdvi <- dvi1 -dvi2 #the higher is the difference, the higher the deforestation is, perfect image to show the biomass loss
dev.off()
plot(difdvi)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of biomass (and energy) lost!")

hist(difdvi, col="red") #histrogram
#all the positive values show loss of biomass
#and we notice that we have a slight number of negative values (vegeatation win)
#and a huge, huge amount of positive values which show deforestation

#FINAL PAR
#image1
#image2
#dvi 1st period
#dvi 2nd period
#dvi difference

pdf("Amazonia_deforestation.pdf")
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of biomass (so energy) lost!")
hist(difdvi, col="red")
dev.off()


#THE AUSTRALIAN BUSHFIRE SEASON OF 2019-2020

#THIS PROJECT AIMS TO :
#ASSESS THE SEVERITY OF THE AUSTRALIAN BUSHFIRE SEASON OF 2019-2020
#UNDERSTAND ITS CAUSES
#UNDERSTAND ITS CONSEQUENCES ON VEGETATION AND HUMAN HEALTH

################################### FIRST STEP:ASSESS THE SEVERITY OF THE AUSTRALIAN BUSHFIRE SEASON OF 2019-2020
#download data of fire occurences from FIRMs (Fire Information for Resource Management System) from NASA
#download data of 2000, 2005, 2010, 2015, 2019
#goal: plot a density map of fire occurences for each year in order to compare them

#BUSHFIRES IN AUSTRALIA IN 2019

library(spatstat) #required for plotting density map
setwd("C:/lab/") #setting the working directory

fire_austr_2019 <- read.table("modis_2019_Australia.csv", header=TRUE, sep=",") #read the FIRMS csv file where locations of fire occurences of 2019 are contained (long and lat)
fire_austr_2019
head(fire_austr_2019)
names(fire_austr_2019) #see the names of the variables
summary(fire_austr_2019) #to have an idea of min and max longitude and latitude and then using them for plotting the density map
attach(fire_austr_2019) #to use longitude and latitude after


fire_austr_2019_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8)) #ppp planar point pattern, expalin to R that our data are spatial data
#c(112,155),c(-44,-8)) is the range of longitude and latitude in which Auxtralia is located

fire_density_map_2019 <- density(fire_austr_2019_planar) #create a density map of fire occurences

library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp") #read the shapefile of global coastlines

library(raster)
ext <- c(112,155,-44,-8) #we create an extension corresponding to the boundaries of Australia
austr_coastlines <- crop(coastlines, ext) #we only select the coastlines of Australia among the global coastlines

cl <- colorRampPalette(c('brown4','red3','red','orange2','orange','yellow2','yellow'))(100) 

png("fire_density_map_2019.png") #to save the density map as a png image
plot(fire_density_map_2019, col=cl, main="Density map of fire occurences in Australia (2019)") #plot the density map with a title
points(fire_austr_2019_planar,col="darkblue", pch=20, cex=0.1) #add fire occurences on top in darkblue
plot(austr_coastlines, add=TRUE) #add Australian coastlines on top
dev.off()

#We do exactly the same for the years 2000, 2005, 2010, 2015

# FIRES IN AUSTRALIA IN 2000

fire_austr_2000 <- read.table("modis_2000_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2000)
attach(fire_austr_2000)

fire_austr_2000_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2000 <- density(fire_austr_2000_planar)

png("fire_density_map_2000.png")
plot(fire_density_map_2000, col=cl, main="Density map of burnt areas in Australia (2000)")
points(fire_austr_2000_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)
dev.off()

#FIRES IN AUSTRALIA IN 2005
fire_austr_2005 <- read.table("modis_2005_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2005)
attach(fire_austr_2005)

fire_austr_2005_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2005 <- density(fire_austr_2005_planar)
plot(fire_density_map_2005, col=cl, main="Density map of burnt areas in Australia (2005)")
points(fire_austr_2005_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

# FIRES IN AUSTRALIA IN 2010
fire_austr_2010 <- read.table("modis_2010_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2010)
attach(fire_austr_2010)

fire_austr_2010_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2010 <- density(fire_austr_2010_planar)
plot(fire_density_map_2010, col=cl, main="Density map of burnt areas in Australia (2010)")
points(fire_austr_2010_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

# FIRES IN AUSTRALIA IN 2015
fire_austr_2015 <- read.table("modis_2015_Australia.csv", header=TRUE, sep=",")
summary(fire_austr_2015)
attach(fire_austr_2015)

fire_austr_2015_planar <- ppp(longitude,latitude,c(112,155),c(-44,-8))
fire_density_map_2015 <- density(fire_austr_2015_planar)
plot(fire_density_map_2015, col=cl, main="Density map of burnt areas in Australia (2015)")
points(fire_austr_2015_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

# COMPARING THE DIFFERENT DENSITY MAPS
png("Evolution_fire_occurences_2000_2019.png") #to save the panel we are going to create as a png image
par(mfrow=c(2,3)) #we create a row of 2 lines and 3 columns
#let's plot the different density maps in the chronological order

#we plot the density map of fire occurences of 2000
plot(fire_density_map_2000, col=cl, main="2000")
points(fire_austr_2000_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

#we plot the density map of fire occurences of 2005
plot(fire_density_map_2005, col=cl, main="2005")
points(fire_austr_2005_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

#we plot the density map of fire occurences of 2010
plot(fire_density_map_2010, col=cl, main="2010")
points(fire_austr_2010_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

#we plot the density map of fire occurences of 2015
plot(fire_density_map_2015, col=cl, main="2015")
points(fire_austr_2015_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

#we plot the density map of fire occurences of 2019
plot(fire_density_map_2019, col=cl, main="2019")
points(fire_austr_2019_planar,col="darkblue", pch=20, cex=0.1)
plot(austr_coastlines, add=TRUE)

dev.off()

#Conclusion: we observe a shift of fire occurences from West to North and then from North to East

# HOW MANY NEW FIRES OCCURENCES FROM ONE YEAR TO ANOTHER ?
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


png("dif_map_comp.png")
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

################################################ SECOND STEP: UNDERSTAND THE CAUSES OF SUCH SEVERE BUSHFIRES IN 2019-2020
# FIRST CAUSE: EXTREME WARM TEMPERATURE RECORDED IN AUSTRALIA IN 2019

setwd("C:/lab/")
library(ggplot2)

temp_austr <- read.table("Temp_Australia_2000_2019.csv", header=TRUE, sep=",")
temp_austr
head(temp_austr)
names(temp_austr)
summary(temp_austr)
attach(temp_austr)

png("barplot_T.png")
ggplot(temp_austr, aes(x = year, y = devmeanT)) + geom_col(col="red", fill="red", width=0.7) +
labs(x = "year", y = "Deviation from mean T(°C)", title = "Bar plot showing the difference with the average temperature in Australia for each year from 2000 to 2019")
dev.off()
#Conclusion: 2019 was the warmest year in the history of Australia

#SECOND CAUSE: EXTREME DECREASE IN RAINFALLS IN 2019

rainfall_austr <- read.table("rainfall_Australia_2000_2019.csv", header=TRUE, sep=",")
rainfall_austr
head(rainfall_austr)
names(rainfall_austr)
summary(rainfall_austr)
attach(rainfall_austr)

png("barplot_rainfall.png")
ggplot(rainfall_austr, aes(x = year, y = devmeanrainfall)) + geom_col(col="red", fill="red", width=0.7) +
labs(x = "year", y = "Deviation from average rainfall (mm)", title = "Bar plot showing the difference with the average rainfall in Australia for each year from 2000 to 2019")
dev.off()
#Conclusion: 2019 was the driest year in the history of Australia

################################################ THIRD STEP: UNDERSTAND THE CONSEQUENCES OF THE BUSHFIRES OF 2019-2020
# FIRST CONSEQUENCE: BIOMASS LOSS

library(raster)
library(RStoolbox) #library specific to remote sensing

NP_during_fire <- brick("National_Park_during_fire.jpg") #brick function to read raster images with several layers
NP_during_fire
plot(NP_during_fire)
plotRGB(NP_during_fire, r=1, g=2, b=3, stretch="Lin", main="During fire")

NP_after_fire <- brick("National_Park_after_fire.jpg")
NP_after_fire
plot(NP_after_fire)
plotRGB(NP_after_fire, r=1, g=2, b=3, stretch="Lin", main="After fire")

png("National_Park_during_after_fire.png")
par(mfrow=c(2,1))
plotRGB(NP_during_fire, r=1, g=2, b=3, stretch="Lin", main="During fire (December 1st 2019)")
plotRGB(NP_after_fire, r=1, g=2, b=3, stretch="Lin", main="After fire (January 1st 2020)")
dev.off()

# COMPARING DVI: DURING VS AFTER FIRE

# DVI DURING FIRE
dvi_during <- NP_during_fire$National_Park_during_fire.1 - NP_during_fire$National_Park_during_fire.2 #defor1$defor1_.1 is the infrared band of the 1st image, defor1_.2 is the red band
plot(dvi_during)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi_during, col=cl)

#DVI AFTER FIRE
dvi_after <- NP_after_fire$National_Park_after_fire.1 - NP_after_fire$National_Park_after_fire.2
#NP_after_fire$National_Park_after_fire.1 is the infrared band of the 1st image, 
#NP_after_fire$National_Park_after_fire.2 is the red band
plot(dvi_after, col=cl)


par(mfrow=c(2,1))
plot(dvi_during, col=cl, main="DVI during fire")
plot(dvi_after, col=cl, main="DVI after fire")

#DVI DIFFERENCE DURING AND AFTER FIRE
difdvi <- dvi_during -dvi_after #the higher the difference, the higher the biomass loss is, perfect image to show the biomass loss
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)

png("National_Park_vegetation_loss.png")
par(mfrow=c(3,2))
plotRGB(NP_during_fire, r=1, g=2, b=3, stretch="Lin")
plotRGB(NP_after_fire, r=1, g=2, b=3, stretch="Lin")
plot(dvi_during, col=cl, main="biomass during fire")
plot(dvi_after, col=cl, main="biomass after fire")
plot(difdvi, col=cldif, main="amount of biomass lost due to bushfire")
dev.off()

#SECOND CONSEQUENCE: IMPACT ON HUMAN HEALTH
library(ggplot2)
setwd("C:/lab")

particles <- read.table("PM10.csv", header=TRUE, sep=",")
particles
names(particles)
attach(particles)

png("fine_particles.png")
ggplot(particles, aes(x = date)) +
geom_point(aes(y = Canberra), col="darkred", pch=16, size=2) +
geom_point(aes(y = New.Delhi), col="darkblue", pch=16, size=2) +
geom_line(aes(y = Canberra, group=1, color = "Canberra"), size=1.2) + 
geom_line(aes(y = New.Delhi, group=1, color = "New Delhi"),size=1.2, linetype="twodash") +
scale_color_manual(values = c("red", "steelblue")) +
labs(x = "date", y = "Concentration of PM10 (ug/m3)", title = "Concentration of PM10 fine particles during Australian bushfire season of 2019-2020") +
geom_hline(yintercept=50, linetype="dashed", color="seagreen4", size=1.2)
dev.off()


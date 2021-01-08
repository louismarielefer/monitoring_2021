#R code for remote sensing data analysis to monitor ecosystem changes in space and time
#most data could be taken in the field
#however working in the field is hard stuff because you should work quite a lot to get all your data from the field
#even harder when you have to resample data in time, resample each year for example
#how to solve it ? -> thanks to remote sensing
#sensing our plane from distance thanks to satelite images
#the smaller is the pixel the higher is the resolution
#landset program by NASA: lauch of lot of satelites to monitor earth over the years, it started in the 70's
#we have 1 image every 14 days
#Amazonia deforestation was taken with this program
#2 big actors in this field: NASA and ESA (European Space Agency)
#Copernicus program developped by ESA
#Let's chose a square in a landscape
#This square is divided in pixels
#each pixel has a color which is given by a number, this number is actually the value of the reflectance (basically how much light is reflected by the object)
#under the color there are numbers
#a satellite image is a matrix of numbers
#light is composed of wavelengths ranging from blue, green, red
#wavelength is the distance between two peaks
#blue(low length,high frequency), green (medium), red(high length, low frequency)
#the higher the wavelength, the lower the frequency
#satellite image is composed of different layers
#use of remote sensing to monitor vegetation health
#leaves reaction to light: healthy leaves reflect more the infrared rays thanks to the specific tissues of the mesophyll, but we can't see infrared with human eyes
#foliar reflectance is higher with healthy vegetation
#stressed leaves reflect more green
#dead leaves reflect less
########################DATA
#data were taken by landsat (NASA program to monitor earth changes)
#this satellite is following a path like a meridian all around the earth until it covers it enirely
#data were sampled in the middle of Amazonia
#path 224 road 63
#we are going to compared the state of amazonia in 1988 and 2011
################################################################
install.packages(c("raster","RStoolbox")) #RStoolbox more specific to remote sensing whereas raster deals with pictures, pixels
library(raster)
library(RStoolbox)
setwd("C:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd") #brick function to read raster images
p224r63_2011
plot(p224r63_2011)
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

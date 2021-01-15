#2 more important functions in a an ecosystem: energy flow and chemical cycle
#1st part: energy flow
#plants reflect a lot NIR(near infrared red) and not a lot of red (because red lenghts are absorbed for photosynthesis)
#DVI(difference vegetation indice)(indice of biomass)= NIR-RED
#for each zone, a DIV is given
#for each line,lattitude, mean of values
#make of a worldmap with graph on the side which shows where the indice of biomass is the higher
#second part:chemical cycle
#comparison amount of NO2 in europe between january and march (lockdown)
#ADVICE FOR FINAL PROJECT
#either: on a slide, put code on the left and output on the right
#or change slide for output
####################################################
library(rasterdiv)
library(raster)
data(copNDVI)
plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))#to remove blue
# in 8 bit, 256 values of DVI (from 0 to 256), 253,254,255 are assigned to blue which is water so it doesn't interest us
plot(copNDVI)
#the map we obtain is actually made of 19 maps over the last 19 years
#for one map of one year, each pixel has a value
#our final map is composed of pixels and each pixel is a mean of the values of the last 19 years
install.packages("rasterVis")
library(rasterVis)
levelplot(copNDVI)

#experience: lying with colors
#yellow is the color which is the most caught by human eyes
#not advice to use yellow as a min
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymin)

clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #wrong map
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #good map
plot(copNDVI, col=clymax)

#let's zoom on Italy, how to crop ? VERY IMPORTANT FOR OUR PROJECT IF WE WANT TO WORK ON A PRECISE REGION
ext <- c(0,20,35,55)  # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)

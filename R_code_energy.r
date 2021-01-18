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

#############################################33
#DEFORESTATION EXAMPLE

library(raster)
library(RStoolbox)
setwd("C:/lab/")

#for importing data
#if you have only one layer, function raster is used
#otherwise (if more than 2, ex: vegetation and infrared), function brick is used

defor1 <- brick("defor1_.png")
defor1
#image in 8 bits, it means that it has 2^8=256 colors (from 0 to 255)
#rule: 2^number of bits

plotRGB(defor1, 1, 2, 3, stretch="Lin") #plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
#infrared in first chanel so we will see it red
#RGB 3 colors in this order red chanel, green chanel, blue chanel
#then we have numbers corresponding to colors and we can actually choose the number, the color we want to put into each chanel
#1:INR
#2:green
#3:red
#4:blue

plotRGB(defor1, 2, 1, 3, stretch="Lin") #green in first chanel #plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

plotRGB(defor1, 1, 2, 3, stretch="Lin") #infrared in first chanel so we will see it red

defor2 <- brick("defor2_.png")
defor2
plotRGB(defor2, 1, 2, 3, stretch="Lin")

par(mfrow=c(2,1)) #2 lines, 1 column
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#water color is different between the 2 images
#water doesn't have a big reflectance
#and at some times of the year, water is carrying more or less sediments and it's actually impacting the reflectance

#calcul of DVI for comparing the 2 years
#the higher the value is, the more vegetation there is
#DVI=NIR-RED
#NIR is reflected while RED is not very reflected
#so when there is a lot of vegetation, NIR value is high and RED is low so n total DVI is high
#when less, no vegetation, it is the opposite

#DVI for the 1st period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2 #defor1$defor1_.1 is the infrared band of the 1st image, defor1_.2 is the red band
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

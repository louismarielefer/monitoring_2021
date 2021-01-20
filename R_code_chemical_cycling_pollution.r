#CODE TO COMPARE THE NO2 POLLUTION BEFORE AND WHILE THE LOCKDOWN

setwd("C:/lab/")
library(raster)

EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# Otherwise:
# rlist <- list.files(pattern="EN")
# rlist 
# list_rast=lapply(rlist, raster) #we apply the function raster to the rlist containing the images
# ENstack <- stack(list_rast)

cl <- colorRampPalette(c('red','orange','yellow'))(100) #we want to enhance, highlight high NO2 values, so using yellow for that can be a good idea

#comparing january and march 2020: before and while the lockdown
par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)
#images are in 8 bit (256 colors, 255 values)
#we are going to make the difference between january and march image
#it means that we're making the difference for each pixel to obtain the image of the difference

difno2 <- EN01 - EN13 #the higher the value of the dif is, the more the emission of NO2 has decreased
cldif <- colorRampPalette(c('blue','black','yellow'))(100) #yellow parts to see the places where the emissions have dropped a lot
plot(difno2, col=cldif)

#how to create a video where you can progresively see the changes through time
# https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/
#plot(EN01, col=cl)
#plot(EN02, col=cl)
#plot(EN03, col=cl)
#plot(EN04, col=cl)
#plot(EN05, col=cl)
#plot(EN06, col=cl)
#plot(EN07, col=cl)
#plot(EN08, col=cl)
#plot(EN09, col=cl)
#plot(EN10, col=cl)
#plot(EN11, col=cl)
#plot(EN12, col=cl)
#plot(EN13, col=cl)

par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

#how to make a stack of all the images (pour remplacer mfrow, simpler but not squarred shape, as 13 is an odd number)
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN,col=cl)

dev.off()

plotRGB(EN, red=EN13, green=EN07, blue=EN01, strech="lin") #red=march, green=february, blue=january
#output is one image
#white parts are where NO2 emissions remain high even if there's a lockdown
dev.off()

boxplot(EN,horizontal=T,axes=T,outline=F)
#globally, NO2 emissions are decreasing from january
#because max values are getting lower and lower
boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period") #lab stands for label(titre des axes)

pdf("NO2_emissions.pdf")
par(mfrow=c(2,2))
plot(EN01, col=cl)
plot(EN13, col=cl)
plot(difno2, col=cldif)
plotRGB(EN, red=EN13, green=EN07, blue=EN01, strech="lin")
dev.off()


#EXAMPLE OF CODE FOR THE EXAM
#one image of land surface temperature every ten days or every month
install.packages("ncdf4")
library(ncdf4) #we need a library to read nc data
setwd("C:/lab/")
#contrary to the last time, we are using only one layer gives the temperature for each pixel
library(raster)

#land surface temperature in January 2021
tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1(1).nc")
cltjan <- colorRampPalette(c("yellow","orange","red","red4"))(100) 
plot(tjan, col=cltjan)

#land surface temperature in October 2020
toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1(1).nc")
plot(toct, col=cltjan)

#comparison: how has the temperature evolved between oct and jan
#if dif<0, it means that the temperature was higher in oct so the temperature dropped, it went colder, so blue color
# if dif>0, it means that the temperature was lower in oct so the temp increased, it went warmer, so red color
#if dif=0, temperature has barely changed
dift <- tjan - toct
cldif <- colorRampPalette(c('white','blue','red'))(100) 
plot(dift, col=cldif)

###########################FEW WORDS ABOUT THE EXAM
#10 min of presentation
#5 min of questions
#either we put the code on the right and the output on the left of the same slide
#or we can make one slide for the code then another one for the output
#the check of our code on github
#duccio will check our code on github during and after our presentation
#the questions can be:
#what to expect
#what is the ecological point
#why using this function
#the results are not the most important, sometimes it is not very visible because we are working on quite a short timeline
#the most important is the method
#and above all, the most most important is HAVING FUN !

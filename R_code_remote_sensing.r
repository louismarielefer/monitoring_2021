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
#light is composed of wavelengths ranging from blue, green, red
#wavelength is the distance between two peaks
#blue(high frequency), green (medium), red(low)
#the higher the wavelength, the lower the frequency

################################################################
install.packages(c("raster","RStoolbox")) #RStoolbox more specific to remote sensing whereas raster deals with pictures, pixels

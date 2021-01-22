#SPECIES DISTRIBUTION MODEL (SDM)
#we are looking if the occurences are matching with environmental layers such as temp and elevation
#1 for a presence
#0 for an absence
#the hardest part is when you're dealing with an absence because it's not sure
#today we are going to use a linear model (the simplest one)
#at the end the model gives you probability of finding the species at a given place
#the model can be used for prediction ie know if the species is likely to be present or not at a given place
#and also for better understanding the link between environmental parameters and species distribution
#occurence=presence OR absence
##################################################CODE
library(sdm)
library(raster)
library(rgdal)

#importing the species data (directly in R)
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)
species
plot(species,pch=17) #here are all the points, both presences and absences
#how can we separate presences and absences

species$Occurrence

#let's plot the presences, we want to select all the points having the value 1
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17) #points function to add the absences to the previous graph 

path <- system.file("external", package="sdm")
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

preds <- stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl) #plot predictors: temp, vegetation, precipitation, elevation

#now let's add the presences on top of each predictor map
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=17)

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

#now let's create tthe sdm ie with all the envt layers and the occurences 
datasdm <- sdmData(train=species, predictors=preds)
datasdm

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl) #this is the final sdm: we obtain the map of probabilities, O=the species is not expected, 1=the species is highly expected
points(species[species$Occurrence == 1,], pch=17)

#let's put all the different predictors and the final model on one page
s1 <- stack(preds,p1)
plot(s1, col=cl)
#since we're ploting a stack it's harder to add the occurences on it
#in that case it would be easier to use a par
#the place is in 30 UTM and that corresponds to Spain
#the species might be a frog

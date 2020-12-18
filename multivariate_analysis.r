# we can see in 3D
#maybe in 3D we can see things which don't seem related to each other but maybe they are in 4D
#multivariate analyses is used to reduce the dimensionality and see things we wouldn't be able to see otherwise
#how ? by squizzing dimensions
#one example of squizzing is Principle Component (PC1 and PC2): from 2 dimensions to one new axis which explains almost all the repartition of the data
#################################################
install.packages("vegan")
library(vegan)
setwd("C:/lab/")
load("biomes_multivar.RData")
ls()#list all the objects that you have in your file
head(biomes) #plot per species matrix
#show the 6 first plots, we can figure out what are these biomes according to the kind of species they are hosting

multivar <- decorana(biomes)
multivar
plot(multivar)

head(biomes_types)
biomes_types
attach(biomes_types)

ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)

pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()

#nextlesson: remote sensing for area where it is hard to sampleq
#copernicus

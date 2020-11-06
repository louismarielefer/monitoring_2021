# Again, it is very important to write comments

# R code for plotting the relationship between ecological variables

# R packages with statistical tools included

# today we are going to use a package called sp
#you can import packages made by other users
# when packages outside R use guillemets

install.packages("sp")
library(sp)

#data is used to recall datasets
data(meuse)
#look inside the set but not clear at all
meuse

# nicer presentation
View(meuse)

# we don't want to see all the datasets, just the first lines

head(meuse)

#Exercise: mean of all the variables
summary (meuse)

#Exercise: let's creating plots, zinc(y) against cadium (x)

#plot(cadmium, zinc) error because we have to explain that cadmium and zinc are inside the dataset

plot(meuse$cadmium,meuse$zinc)

#rather than using the dollar we are using attach

attach(meuse)
plot(cadmium,zinc, col="red",pch=14, main="relationship between cadmium and zinc")

plot(cadmium, lead)

#how to create plots of all the different realtionships possible

pairs(meuse)

#question
#pairing only the elements part of the dataset: how do to that
#only with cadmium, copper, lead, zinc

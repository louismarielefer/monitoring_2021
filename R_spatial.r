#today we are going to see these data in space
# we are going to use x and y data

intstall.packages("sp")
library(sp)

data(meuse)

head(meuse)

coordinates(meuse)= ~x+y
plot(meuse)

#spplot is used to plot plot an element like zinc and see where it is higher, lower on a map

spplot(meuse, "zinc", main="concentration of zinc)

#exercise: do the same with copper
spplot(meuse, "copper", main="concentration of copper")

#exercise: see copper and zinc at the same time
spplot(meuse,c("copper","zinc"))
spplot(meuse,c("copper","zinc","lead","cadmium"))
#river is carrying poison

#rather than using colors, let's use bubbles, the higher the concentration is, the bigger the bubble is
bubble(meuse,"zinc")

#do the same for lead and change color
bubble(meuse,"lead", col="red")

############ new course
#install the ggplot2 package
install.packages("ggplot2")
library(ggplot2)

#ecological data frame
#biofuels
biofuels <- c(120,200, 350, 570, 750) #array of values
biofuels
#oxydative enzymes
oxydative <- c(1200, 1300, 21000,34000,50000)
oxydative

#dataframe
d <- data.frame(biofuels, oxydative)
d

ggplot(d, aes(x=biofuels, y=oxydative)) + geom_point() #precise x and y
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_point(col="red", size=2)
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_line() #pour relier les points entre eux
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_point(col="red", size=2) + geom_line() #points and lines at the same time, here we have 3 elements added together

#polygons
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_polygon() #pratique pour comparer avec une régression linéaire, if the area is bigger, the relationship is not linear

########################################### LET'S IMPORT DATA !

#for Windows
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", head=T)
covid

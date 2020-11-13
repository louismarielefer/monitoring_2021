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



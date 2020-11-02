# important to comment the code so that the others can understand

# this is an array
primates <- c(3, 5, 9, 15, 40)

# new set
crabs <- c(100, 70, 30, 10, 5)

# first plot in R
plot(primates, crabs)

plot(primates, crabs, col="red")

plot(primates, crabs, col="red", pch=19)

plot(primates, crabs, col="red", pch=19, cex=2)

plot(primates, crabs, col="red", pch=19, cex=6)

plot(primates, crabs, col="red", pch=19, cex=6, main="My first ecological graph in R")

# how to create a data frame
 ecoset <- data.frame(primates, crabs)
 
# ecological numbers
# average number of primates and crabs
(3+5+9+15+40)/5

summary(ecoset) #function that gives all the statistics numbers

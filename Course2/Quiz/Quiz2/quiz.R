library(datasets)
data(iris)
?iris

tapply(iris$Sepal.Length,iris$Species,mean)

apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
?mtcars

with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)
tapply(mtcars$mpg, mtcars$cyl, mean)

hp_means<-tapply(mtcars$hp,mtcars$cyl,mean)
hp_means[3]-hp_means[1]
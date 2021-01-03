View(mtcars)
boxplot(mtcars$mpg)
boxplot(mtcars$mpg ~ mtcars$am)
boxplot(mtcars$mpg ~ mtcars$am, names=c("auto", "manual"))
boxplot(mtcars$mpg ~ mtcars$am, names=c("auto", "manual"), las=1)
boxplot(mtcars$mpg ~ mtcars$am, names=c("auto", "manual"), las=1,
        main="miles per gallon by transmission type", ylab="miles per gallon",
        col=c("tan1", "blue"), horizontal=F, boxwex=.5)
colors()

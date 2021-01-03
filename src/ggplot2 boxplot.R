library(ggplot2)
View(mpg)
?mpg
boxplot(mpg$cty)
ggplot(mpg, aes(factor("all"), cty)) + geom_boxplot()

boxplot(mpg$cty ~ mpg$drv)
ggplot(mpg, aes(drv, cty)) + geom_boxplot()
ggplot(mpg, aes(drv, cty)) + geom_boxplot() + coord_flip() + ylab("city mpg.")

ggplot(mpg, aes(drv, cty, fill=drv)) + geom_boxplot() +
  scale_x_discrete(breaks=c("4","f","r"), labels=c("4-wheel","front","rear"))

ggplot(mpg, aes(class, cty, fill=drv)) + geom_boxplot()
ggplot(mpg, aes(class, cty, fill=drv)) + geom_boxplot() + facet_grid(.~drv)
ggplot(mpg, aes(class, cty, fill=drv)) + geom_boxplot() + facet_grid(drv~.) + coord_flip()

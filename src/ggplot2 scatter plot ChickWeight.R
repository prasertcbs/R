# install.packages(ggplot2)
library(ggplot2)
ggplot(ChickWeight, aes(x=Time, y=weight)) + geom_point()
ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_point()
ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_point() + geom_smooth()
# loess

ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_point() + geom_smooth(method="lm")

ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_point() + geom_smooth(method="lm", se=F)

ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_smooth(method="lm", se=F)

ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_point() + geom_smooth(method="lm", se=F) + facet_grid(.~Diet)

ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_point() + geom_smooth(method="lm", se=F) + facet_grid(Diet~.)
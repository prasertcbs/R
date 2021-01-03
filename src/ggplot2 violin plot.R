### density plot
# install.packages("ggplot2")
library(ggplot2)

View(mpg)
# simple boxplot
ggplot(mpg, aes(x=drv, y=cty, color=drv)) +
    geom_boxplot()

# simple violin plot
ggplot(mpg, aes(x=drv, y=cty, color=drv)) +
    geom_violin()

# horizontal violin
ggplot(mpg, aes(x=drv, y=cty, color=drv)) +
    geom_violin() +
    coord_flip()

# compare to geom_density
ggplot(mpg, aes(x=cty, color=drv, fill=drv, linetype=drv)) +
    geom_density(alpha=.3) +
    facet_grid(drv~.)

# boxplot + violin
ggplot(mpg, aes(x=drv, y=cty)) +
    geom_violin(aes(fill=drv, color=drv), alpha=.5) +
    geom_boxplot(alpha=.4)

# horizontal
ggplot(mpg, aes(x=drv, y=cty)) +
    geom_violin(aes(fill=drv, color=drv), alpha=.5) +
    geom_boxplot(alpha=.4) +
    coord_flip()

# transmission type [auto, manual]
mpg$transAM <- ifelse(substr(mpg$trans,1,1) == "a", "auto", "manual")
View(mpg)

# use transmission type as facet
ggplot(mpg, aes(x=drv, y=cty)) +
    geom_violin(aes(fill=drv, color=drv), alpha=.5) +
    geom_boxplot(alpha=.4) +
    facet_wrap(~transAM, nrow=1) +
    coord_flip()


### use factor("all")
ggplot(mpg, aes(factor("all"), cty)) + geom_boxplot()
ggplot(mpg, aes(factor("all"), cty)) + geom_violin()


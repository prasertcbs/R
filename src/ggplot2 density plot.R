### density plot
# install.packages("ggplot2")
library(ggplot2)

View(mpg)

# simple histogram
ggplot(mpg, aes(x=cty)) +
    geom_histogram()

# plain density plot
ggplot(mpg, aes(x=cty)) +
    geom_density()

# density plot + filled color
ggplot(mpg, aes(x=cty)) +
    geom_density(fill="orange", alpha=.5)

### histogram + density
ggplot(mpg, aes(x=cty)) +
    geom_histogram(aes(y=..density..), alpha=.5, fill="grey50") +
    geom_density(color="orange") +
    theme_bw()

### compare density by drv
ggplot(mpg, aes(x=cty, color=drv)) +
    geom_density()

# with fill, linetype and alpha
ggplot(mpg, aes(x=cty, color=drv, fill=drv, linetype=drv)) +
    geom_density(alpha=.3)

### ANOVA
model <- aov(cty ~ drv, data=mpg)
summary(model)
posthoc <- TukeyHSD(model)
posthoc

# plot a built-in and custom functions
# install.packages("ggplot2")
library(ggplot2)

# plot built-in function "dnorm"
d <- data.frame(x = c(-4, 4))
?dnorm
ggplot(d, aes(x=x)) + stat_function(fun = dnorm)

ggplot(d, aes(x=x)) +
    stat_function(fun = dnorm, color="pink") +
    theme_bw()

ggplot(d, aes(x=x)) +
    stat_function(fun = dnorm, color="pink") +
    geom_vline(xintercept = 0, linetype="dotted", color="green") +
    theme_bw()

# pass parameters to a function using args=list()
d <- data.frame(x = c(-10, 15))
ggplot(d, aes(x=x)) +
    stat_function(fun = dnorm, args=list(mean=2, sd=3))

ggplot(d, aes(x=x)) +
    stat_function(fun = dnorm, color="orange") +
    stat_function(fun = dnorm, args=list(mean=0, sd=3), color="pink") +
    stat_function(fun = dnorm, args=list(mean=3, sd=3), color="green") +
    theme_bw()

### sin, cos
d <- data.frame(x = c(0, 2*pi))
ggplot(d, aes(x=x)) +
    stat_function(fun = sin, color="pink") +
    stat_function(fun = cos, color="green")

### custom function with only parameter "x"
myFn <- function(x) {
    x * x - 4
}
myFn(10)

d <- data.frame(x = c(-4, 4))
ggplot(d, aes(x=x)) + stat_function(fun = myFn)

### custom function with multiple parameters
quadratic <- function(x, a, b, c) {
    a * x^2 + b * x + c
}

d <- data.frame(x = c(-5, 2))
ggplot(d, aes(x=x)) +
    stat_function(fun = quadratic, args=list(a=2, b=7, c=3), color="pink") +
    geom_vline(xintercept = 0, color="grey50", linetype="dashed") +
    geom_hline(yintercept = 0, color="grey50", linetype="dashed") +
    theme_bw()

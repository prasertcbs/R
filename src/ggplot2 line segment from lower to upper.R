### line segment chart with geom_segment

install.packages("ggplot2", "scales")
library(ggplot2)
library(scales)
d <- data.frame(occupation=c("alpha", "beta", "delta", "epsilon", "sigma"),
                lower=c(12000, 17000, 20000, 25000, 37000),
                upper=c(15000, 21000, 28000, 35000, 50000))
View(d)

### plot a plain line segment for each occupation
ggplot(d) +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation),
                 size = 2,
                 color="skyblue")

### change x-axis title and format x-label with comma
ggplot(d) +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation),
                 size = 2,
                 color="skyblue") +
    xlab("salary") +
    theme_bw() +
    scale_x_continuous(labels = comma)

### add geom_points
ggplot(d) +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation),
                 size = 2,
                 color="skyblue") +
    xlab("salary") +
    theme_bw() +
    scale_x_continuous(labels = comma) +
    geom_point(aes(x = lower, y = occupation), size = 3) +
    geom_point(aes(x = upper, y = occupation), size = 3)

### move aes(y = occupation) from geom_point to ggplot
ggplot(d, aes(y = occupation)) +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation),
                 size = 2,
                 color="skyblue") +
    xlab("salary") +
    theme_bw() +
    scale_x_continuous(labels = comma) +
    geom_point(aes(x = lower), size = 3) +
    geom_point(aes(x = upper), size = 3)

### place color in geom_segment under aes() to create different line segment color
ggplot(d, aes(y = occupation)) +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation,
                     color=occupation),
                 size = 2) +
    xlab("salary") +
    theme_bw() +
    scale_x_continuous(labels = comma) +
    geom_point(aes(x = lower), size = 3) +
    geom_point(aes(x = upper), size = 3) +
    theme(legend.position="none")

### customize geom_point properties (size, shape, alpha, color)
ggplot(d, aes(y = occupation)) +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation),
                 size = 2,
                 color="skyblue") +
    xlab("salary") +
    theme_bw() +
    scale_x_continuous(labels = comma) +
    geom_point(aes(x = lower), size = 4, shape=15, alpha=.8, color="pink") +
    geom_point(aes(x = upper), size = 4, shape=16, color="orange")

### send geom_point to the bottom layer
ggplot(d, aes(y = occupation)) +
    geom_point(aes(x = lower), size = 4, shape=15, alpha=.8, color="pink") +
    geom_point(aes(x = upper), size = 4, shape=16, color="orange") +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation),
                 size = 2,
                 color="skyblue") +
    xlab("salary") +
    theme_bw() +
    scale_x_continuous(labels = comma)

### play with coord_flip
ggplot(d, aes(y = occupation)) +
    geom_segment(aes(x = lower,
                     y = occupation,
                     xend = upper,
                     yend = occupation),
                 size = 2,
                 color="skyblue") +
    geom_point(aes(x = lower), size = 4, shape=15, alpha=.8, color="pink") +
    geom_point(aes(x = upper), size = 4, shape=16, color="orange") +
    xlab("salary") +
    theme_bw() +
    scale_x_continuous(labels = comma) +
    coord_flip()

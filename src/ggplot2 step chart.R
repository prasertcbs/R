# ggplot2: step chart ----
library(ggplot2)
library(scales)

set.seed(1)
d <-
    data.frame(year = 2006:2016,
               rate = sample(5:40, 11, replace = T) / 1000)
View(d)

ggplot(d, aes(year, rate)) + geom_step(col = "orange")
ggplot(d, aes(year, rate)) + geom_line(col = "orange")

g <-
    ggplot(d, aes(year, rate)) +
    scale_y_continuous(labels = percent) +
    theme_minimal()
summary(g)

g + geom_step(col = "orange") + geom_point()
g + geom_line(col = "orange") + geom_point()

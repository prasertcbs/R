## ggplot2: create ribbon band
library(ggplot2)

# Bangkok: Annual Weather Averages (as of 2016-03-07)
browseURL("http://www.holiday-weather.com/bangkok/averages/")

m <- factor(month.abb, levels = month.abb)
m

d <-
    data.frame(
        month = m,
        avg = c(27, 28, 30, 31, 30, 30, 30, 30, 29, 29, 28, 26),
        hi  = c(32, 33, 34, 35, 34, 33, 33, 33, 32, 32, 31, 31),
        lo  = c(21, 23, 25, 26, 26, 26, 26, 26, 25, 25, 24, 21)
    )
View(d)

# create ggplot object ----
ggplot(d, aes(month, avg)) + geom_line()
ggplot(d, aes(month, avg, group = 1)) + geom_line()

ggplot(d, aes(month, avg, group = 1)) +
    ylim(0, max(d$avg)) +
    geom_line()

# create basic ggplot object
g <- ggplot(d, aes(month, avg, group = 1)) +
    ylim(0, max(d$hi))
summary(g)

# layer concept: geom_ribbon before geom_line ----
g + geom_ribbon(aes(ymin = lo, ymax = hi)) + geom_line()
g + geom_line() + geom_ribbon(aes(ymin = lo, ymax = hi))

# set ribbon band color and alpha level ----
g + geom_ribbon(aes(ymin = lo, ymax = hi), alpha = .3, fill = "yellow") +
    geom_line(color = "blue")

# decorate: add labels, data label, points (size|color|fill) ----
g + geom_ribbon(aes(ymin = lo, ymax = hi), alpha = .3, fill = "lightblue") +
    geom_line() + geom_point(
        shape = 22,
        fill = "green",
        color = "green",
        size = 4
    ) +
    geom_text(aes(label = avg), vjust = -1) +
    labs(title = "Bangkok Average Temperature (in Celsius)",
         x = "", y = "temperature (Celsius)") +
    theme_bw()

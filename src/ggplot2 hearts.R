library(ggplot2)

# 2 hearts
# ref: http://mathworld.wolfram.com/HeartCurve.html
t <- seq(from = 0,to = 2 * pi,length.out = 2000)
a <- 16
b <- 13
x1 <- a * sin(t) ^ 3
y1 <- b * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)
plot(x1,y1,type = "l", asp = 1, col = "pink") # aspect ratio of y/x = 1

x2 <- (a - 0) * sin(t) ^ 3 + 10
y2 <- (b - 0) * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)

# plot(x1,y1,type="l", asp=1, col="pink") # aspect ratio of y/x = 1
lines(x2,y2,col = "deepskyblue")

# create data frames for ggplot2
d1 <- data.frame(x1, y1)
d2 <- data.frame(x2, y2)

# see the differences in geom objects [point, line, path]
ggplot(d1, aes(x1, y1)) + geom_point() # black
ggplot(d1, aes(x1, y1)) + geom_line() # black
ggplot(d1, aes(x1, y1)) + geom_line(color = "red")
ggplot(d1, aes(x1, y1)) + geom_path(color = "red")

# 2 series of XY
ggplot(d1, aes(x1, y1)) + geom_path(color = "pink") +
  geom_path(data = d2, aes(x2, y2), color = "deepskyblue")


# clean two hearts (no borders, grids, etc...)
ggplot(d1, aes(x1, y1)) + geom_path(color = "pink") +
  geom_path(data = d2, aes(x2, y2), color = "deepskyblue") +
  coord_fixed() + # fixed x/y ratio to 1
  theme_bw() +
  theme(
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none",
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    plot.background = element_blank()
  )

x3 <- (a * sin(t) ^ 3) * .6 + 5
y3 <- (b * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)) * .6
d3 <- data.frame(x3,y3)

ggplot(d1, aes(x1, y1)) + geom_path(color = "pink") +
  geom_path(data = d2, aes(x2, y2), color = "deepskyblue") +
  geom_line(data = d3, aes(x3, y3), color = "red") +
  coord_fixed() + # fixed x/y ratio to 1
  theme_bw() +
  theme(
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none",
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    plot.background = element_blank()
  )

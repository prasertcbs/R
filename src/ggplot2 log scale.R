library(ggplot2)
d <- read.csv("https://www.quandl.com/api/v3/datasets/WIKI/AAPL.csv")
d$Date <- as.Date(d$Date)
View(d)
g <- ggplot(d,aes(Date,Adj..Close)) + geom_line()
g
range(d$Adj..Close)
max(d$Adj..Close)/min(d$Adj..Close)
g + scale_y_log10()

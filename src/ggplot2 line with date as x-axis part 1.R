### ggplot2 line chart (x-axis is a date/time)
# install.packages("ggplot2")
library(ggplot2)

### date/time as x-axis
t <- seq(as.Date("2010-1-1"), by = "month", length.out=12)
sales <- as.integer(rnorm(12,mean=50,sd=8))
d <- data.frame(t, sales)
View(d)

# no need to specify group = 1
ggplot(d, aes(x=t,y=sales)) + geom_line()
ggplot(d, aes(t,sales)) + geom_line(color="blue")
g <- ggplot(d, aes(t,sales)) + geom_line(color="blue") + geom_point(shape = 0, size = 3, color="orange")
g
g1 <- g + ylim(0, max(sales))
g1
mean(d$sales)
# add average line
g1 + geom_hline(aes(yintercept=mean(d$sales)), color="green", linetype="dashed") + theme_bw()

# add vertical line
g1 + geom_vline(aes(xintercept=as.numeric(as.Date("2010-7-1"))), color="red", linetype="dotted") + theme_bw()

# add multiple vertical lines
vl <- seq(as.Date("2010-1-1"), as.Date("2010-12-31"), by = "quarter")
vl
dvl <- data.frame(vl)
dvl

g2 <- g1 + geom_vline(aes(xintercept = as.numeric(vl)), data = dvl, color="green", linetype="dashed") +
    theme_bw() +
    xlab("") +
    ggtitle("Beverage Sales")
g2
summary(g2)
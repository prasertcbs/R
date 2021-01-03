library(ggplot2)
t <- seq(from=as.Date("2016-1-1"), to=as.Date("2016-1-31"), by = 1)
lily <- rnorm(length(t),mean=100, sd=5)
s <- data.frame(t,lily)
View(s)
ggplot(s, aes(t,lily)) + geom_line() + geom_hline(yintercept = mean(lily), color="green", linetype="dashed")
mean(s$lily)

ggplot(s, aes(t,lily)) + geom_line() +
  geom_hline(yintercept = mean(lily), color="green", linetype="dashed") +
  geom_hline(yintercept = mean(lily) + sd(lily), color="blue", linetype="dashed") +
  geom_hline(yintercept = mean(lily) - sd(lily), color="red", linetype="dashed") +
  geom_hline(yintercept = 110, color="pink", linetype="dashed", size=3)

food <- factor(c("bird","cat","fish","dog"))
sales <- c(15,40,35,50)
d <- data.frame(food, sales)
View(d)
ggplot(d, aes(food, sales)) + geom_bar(stat="identity")
ggplot(d, aes(food, sales)) + geom_bar(stat="identity") +
  geom_hline(yintercept = mean(sales), color="green", linetype="dashed",size=2)

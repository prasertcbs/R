# cut
spending <- as.integer(rnorm(100,mean=150,sd=30))
hist(spending)
bracket <- cut(spending, 4)
bracket
d <- data.frame(spending, bracket)
View(d)
table(bracket)
q <- cut(spending, quantile(spending))
q1 <- cut(spending, quantile(spending), include.lowest = T)
table(q)
table(q1)

q3 <- cut(spending, quantile(spending, c(0,.33,.67,1)), include.lowest = T, labels=c("low","med","high"))
table(q3)
q3.1 <- cut(spending, quantile(spending, seq(0, 1, length.out = 11)), include.lowest = T)
table(q3.1)
barplot(table(q3))

barplot(c(10,5,15,8))
barplot(c(10,5,15,8), names.arg = c("espresso","mocha","black","latte"))
d <- data.frame(menu=c("espresso","mocha","black","latte"), sales=c(10,5,15,8))
d
barplot(d$sales, names.arg = d$menu,col="blue")
barplot(d$sales, names.arg = d$menu,col="blue", main="Jan 2016")
barplot(d$sales, names.arg = d$menu,col="blue", main="Jan 2016", horiz=T)
barplot(d$sales, names.arg = d$menu,col="blue", main="Jan 2016", horiz=F)
barplot(d$sales, names.arg = d$menu,col="blue", main="Jan 2016", horiz=F,las=1)
m <- c("espresso","mocha","black","latte")
s <- sample(m,50,prob=c(.13,.40,.17,.30),replace = T)
s
table(s)
barplot(table(s))
t <- table(s)
barplot(t, col="green")
barplot(t, col=1:4)
barplot(rev(sort(t)), col=1:4)
barplot(rev(sort(t)), col=1:4, las=1,ylab="orders '000")
barplot(rev(sort(t)), col=c("green", "gray", "gray", "gray"), las=1,ylab="orders '000")
s
s1 <- factor(s)
plot(s1)
s1

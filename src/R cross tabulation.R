# contingency table

View(mtcars)
?mtcars

t <- with(mtcars, table(am))
t <- table(mtcars$am)
t

x1 <- xtabs(~ am, data=mtcars)
x1

mtcars$am <- factor(mtcars$am, labels=c("auto","manual"))
View(mtcars)

t <- with(mtcars, table(am))
t

pt <- prop.table(t) # each cell as % of total
pt
pt*100

barplot(t, beside=T,col=c("green", "purple"))

t2 <- with(mtcars, table(am, cyl))
t2
barplot(t2, beside=T,col=c("green", "purple"), xlab="cylinders", las=1)
rownames(t2)
legend("bottom",
       legend = rownames(t2),
       fill = c("green", "purple"))

xt <- xtabs(~ am + cyl, data=mtcars)
xt

xpt1 <- prop.table(xt, 1) # % of total (row-wise)
xpt1

addmargins(xpt1, 1)
addmargins(xpt1, 2)

xpt2 <- prop.table(xt,2) # % of each column total
xpt2
addmargins(xpt2, 1)

mtcars$mpg.f <- cut(mtcars$mpg, breaks=seq(10,35,by=5))
mtcars$mpg.f
ft <- with(mtcars, table(mpg.f, am))
ft

### n-way contingency table (use xtabs and ftable)
nt <- xtabs(~ mpg.f + am + cyl, data=mtcars)
nt
ftable(nt) # flatten table

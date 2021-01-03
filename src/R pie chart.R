# pie chart

View(mtcars)
?mtcars

# 1: frequency table as data source
t <- table(mtcars$am)
t
pie(t)

mtcars$trans <- factor(mtcars$am, labels = c("auto","manual"))
View(mtcars)
t <- table(mtcars$trans)
t
pie(t, main = "Transmission type")

# add labels
rownames(t)
lab <- sprintf("%s (%.2f%%)", rownames(t), t / sum(t) * 100)
lab

pie(t, main = "Transmission type", labels=lab)
pie(t, main = "Transmission type", labels=lab, cex=.8) # label font size to 80%
pie(t, main = "Transmission type",
    labels=sprintf("%s (%.2f%%)", rownames(t), t / sum(t) * 100),
    col=c("darkgreen", "purple"))

mtcars$mpg.f <- cut(mtcars$mpg, breaks=c(0,15,20,25,30,35))
t <- table(mtcars$mpg.f)
t
pie(t, main="Miles per gallon", clockwise = T)
pie(t, main="Miles per gallon")


### value as data source
d <-
  data.frame(menu = c("coffee","tea","water","coke"),
             sales = c(40,20,60,25))
d
pie(d$sales)
pie(d$sales, labels = d$menu)
pie(d$sales, labels = d$menu, clockwise = T)

# sort by sales from largest to smallest
d <- d[order(d$sales, decreasing = T),]
d

#prop.table(d$sales)
d$sales / sum(d$sales) * 100
d$data.label <-
  sprintf("%s (%.2f%%)", d$menu, d$sales / sum(d$sales) * 100)
View(d)
pie(d$sales, labels = d$data.label)
pie(d$sales, labels = d$data.label, clockwise = T, cex=.9)
pie(d$sales, labels = d$data.label, clockwise = T, cex=.9, col=c("white","brown","tan","green"))
# pie(d$sales, labels = sapply(d$sales, function(x) x / sum(d$sales) * 100))

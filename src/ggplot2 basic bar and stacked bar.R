library(ggplot2)
d <- data.frame(fruit=c(rep("apple", 3), rep("banana", 2), rep("coconut",5)))
d
table(d)
barplot(table(d))
ggplot(d, aes(fruit)) + geom_bar()

d2 <- data.frame(
  item=c("apple", "banana", "coconut"),
  sales=c(3,2,5)
)
d2
ggplot(d2, aes(x=item,y=sales)) + geom_bar(stat="identity")

d3 <- data.frame(
  fruit=c(rep("apple", 3), rep("banana", 2), rep("coconut",5)),
  kiosk=sample(rep(c("A","B"),5))
  )
d3
table(d3)
ggplot(d3, aes(fruit, fill=kiosk)) + geom_bar()
ggplot(d3, aes(fruit, fill=kiosk)) + geom_bar() + guides(fill = guide_legend(reverse=T))
ggplot(d3, aes(fruit, fill=kiosk)) + geom_bar() + coord_flip()
ggplot(d3, aes(fruit, fill=kiosk)) + geom_bar(position="dodge")
ggplot(d3, aes(fruit, fill=kiosk)) + geom_bar(position="dodge") + coord_flip()

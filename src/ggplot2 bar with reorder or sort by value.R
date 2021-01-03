### reorder/sort each bar by value
install.packages("ggplot2")
library(ggplot2)
# basic bar chart with x-axis as a categorical variable
d <- data.frame(region = c("North", "South", "East", "West"),
                sales = c(10,30,20,40))
View(d)
ggplot(d, aes(region, sales)) +
    geom_bar(stat="identity")

# set factor level in order to sort x-axis value
d2 <- data.frame(region = factor(c("North", "South", "East", "West"),
                                 levels=c("North", "South", "East", "West")),
                 sales = c(10,30,20,40))
View(d2)
ggplot(d2, aes(region, sales)) +
    geom_bar(stat="identity")

### flip to horizontal bar
ggplot(d2, aes(region, sales)) +
    geom_bar(stat="identity") +
    coord_flip()

### x-axis as character
set.seed(99)
d <- data.frame(month = month.abb,
                customer = as.integer(runif(12, min=10, max=100)))
View(d)

ggplot(d, aes(month, customer)) + geom_bar(stat="identity")

### set x-axis as factor levels (order)
set.seed(99)
d2 <- data.frame(month = factor(month.abb, levels=month.abb),
                customer = as.integer(runif(12, min=10, max=100)))
View(d2)

ggplot(d2, aes(month, customer)) +
    geom_bar(stat="identity")

### how to sort by y-value
d <- data.frame(food = c("dog", "fish", "cat", "bird"),
                sales = c(10,30,20,40))
View(d)

ggplot(d, aes(food, sales)) + geom_bar(stat="identity")

### ascending y-value
ggplot(d, aes(x=reorder(food, sales), y=sales)) +
    geom_bar(stat="identity", fill="steelblue") +
    theme_bw()

### set x-label
ggplot(d, aes(reorder(food, sales), sales)) +
    geom_bar(stat="identity", fill="steelblue") +
    theme_bw() +
    xlab("food")

### descending y-value
ggplot(d, aes(reorder(food, -sales), sales)) +
    geom_bar(stat="identity", fill="pink") +
    theme_bw() +
    xlab("")

ggplot(d, aes(reorder(food, -sales), sales)) +
    geom_bar(stat="identity", fill="pink") +
    theme_bw() +
    xlab("") +
    coord_flip()


### x-axis as continuous variable
set.seed(11)
d <- data.frame(year=2011:2015,
                sales=as.integer(runif(5, min=10,max=70)))
View(d)

ggplot(d, aes(year, sales)) +
    geom_bar(stat="identity", fill="skyblue") +
    theme_bw()

# create horizontal bar by flipping coordinate
ggplot(d, aes(year, sales)) +
    geom_bar(stat="identity", fill="skyblue") +
    theme_bw() +
    coord_flip()

# reverse scale x
ggplot(d, aes(year, sales)) +
    geom_bar(stat="identity", fill="skyblue") +
    theme_bw() +
    coord_flip() +
    scale_x_reverse()
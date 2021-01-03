### set bar color based on sign

install.packages("ggplot2")
library(ggplot2)

set.seed(1)
d <- data.frame(year=1981:2000,
                growth=sample(-30:40,20,replace=T))

View(d)

# plain bar chart
ggplot(d, aes(x=year, y=growth)) +
    geom_bar(stat="identity")

# create group column storing either "+" or "-"
d$group <- cut(d$growth, c(-Inf,0,Inf), labels=c("-","+"))
View(d)

# add fill group
ggplot(d, aes(year, growth, fill=group)) +
    geom_bar(stat="identity")

# custom color
ggplot(d, aes(year, growth, fill=group)) +
    geom_bar(stat="identity") +
    scale_fill_manual(values = c("red", "limegreen")) +
    theme(legend.position="none")

# more explicit in custom color
ggplot(d, aes(year, growth, fill=group)) +
    geom_bar(stat="identity") +
    scale_fill_manual(values = c("-" = "red", "+" = "limegreen")) +
    theme_bw() +
    theme(legend.position="none") +
    xlab("") +
    ggtitle("growth from 1981-2000")

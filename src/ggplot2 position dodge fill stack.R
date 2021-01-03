# position dodge|fill|stack ----
library(ggplot2)
library(scales)

set.seed(1)
d <-
    data.frame(
        year = rep(2011:2014, 3),
        menu = rep(c("coffee", "tea", "water"), each = 4),
        sales = sample(10:50, 12, replace = T)
    )
View(d)

# bar ----
ggplot(d, aes(year, sales)) + geom_bar(stat = "identity")

g <- ggplot(d, aes(year, sales, fill = menu)) # + coord_flip()

g + geom_bar(position = "stack", stat = "identity")

g + geom_bar(position = "fill", stat = "identity")
g + geom_bar(position = "fill", stat = "identity") +
    scale_y_continuous(labels = percent)

g + geom_bar(position = "dodge", stat = "identity")

# area ----
# in geom_area, the default of position="stack" ----
g + geom_area(stat = "identity")
g + geom_area(position = "stack", stat = "identity")

g + geom_area(position = "fill", stat = "identity")
g + geom_area(position = "fill", stat = "identity") +
    scale_y_continuous(labels = percent)

g + geom_area(position = "dodge", stat = "identity")
g + geom_area(position = "dodge",
              stat = "identity",
              alpha = .7)

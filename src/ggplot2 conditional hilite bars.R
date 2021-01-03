### highlight a specific bar/point
install.packages("ggplot2")
library(ggplot2)
library(dplyr)

### set x-axis as factor levels (order)
set.seed(22)
d <- data.frame(month = factor(month.abb, levels=month.abb),
                customer = as.integer(runif(12, min=10, max=50)))
View(d)

ggplot(d, aes(month, customer)) +
    geom_bar(stat="identity")

### create hilite column
d$hilite <- with(d, ifelse(customer == max(customer), T, F))

### use dplyr to create hilite column
d <-
    d %>%
    mutate(hilite = ifelse(customer == max(customer), T, F))
View(d)

ggplot(d, aes(month, customer, fill=hilite)) +
    geom_bar(stat="identity")

# remove legend
ggplot(d, aes(month, customer, fill=hilite)) +
    geom_bar(stat="identity") +
    theme_bw() +
    theme(legend.position="none")


# remove x gridline
# custom fill color
ggplot(d, aes(month, customer, fill=hilite)) +
    geom_bar(stat="identity") +
    theme_bw() +
    theme(legend.position="none") +
    theme(panel.grid.minor.x=element_blank(),
          panel.grid.major.x=element_blank()) +
    scale_fill_manual(values=c("grey90", "skyblue"))

### hilite above average value
d$hilite <- with(d, ifelse(customer >= mean(customer), T, F))
View(d)

ggplot(d, aes(month, customer, fill=hilite)) +
    geom_bar(stat="identity") +
    geom_hline(yintercept=mean(d$customer), color = "orange") +
    theme_bw() +
    theme(legend.position="none") +
    theme(panel.grid.minor.x=element_blank(),
          panel.grid.major.x=element_blank()) +
    scale_fill_manual(values=c("grey90", "skyblue"))


### hilite above mean + sd
d$hilite <- with(d, ifelse(customer >= mean(customer) + sd(customer), T, F))

d <-
    d %>%
    mutate(hilite = ifelse(customer >= mean(customer) + sd(customer), T, F))
View(d)

ggplot(d, aes(month, customer, fill=hilite)) +
    geom_bar(stat="identity") +
    geom_hline(yintercept=mean(d$customer) + sd(d$customer), color = "orange") +
    theme_bw() +
    theme(legend.position="none") +
    theme(panel.grid.minor.x=element_blank(),
          panel.grid.major.x=element_blank()) +
    scale_fill_manual(values=c("grey90", "skyblue"))
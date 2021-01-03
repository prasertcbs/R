# cumulative sum in dplyr
# install.packages("dplyr")
# install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# note: set year as factor (turn year from continuous var to factor)
# in order to use it as a grouping variable in ggplot2
d <- data.frame(year = as.factor(rep(c(2015, 2016), each = 12)),
                month = factor(rep(month.abb, 2), levels=month.abb),
                sales = c(seq(from = 5, by = 5, length.out = 12),
                          seq(from = 10, by = 10, length.out = 12)))

View(d)

# running total by year (group/window by year)
d <-
    d %>%
    arrange(year, month) %>%
    group_by(year) %>%
    mutate(runningTotal = cumsum(sales))
View(d)

### chart section
library(ggplot2)
ggplot(d, aes(x=month, y=sales, group=year, color=year)) +
    geom_line() + geom_point()

ggplot(d, aes(x=month, group=year, color=year)) +
    geom_line(aes(y=sales))

ggplot(d, aes(x=month, group=year, color=year)) +
    geom_line(aes(y=runningTotal))

ggplot(d, aes(x=month, group=year, color=year)) +
    geom_line(aes(y=sales)) +
    geom_line(aes(y=runningTotal), linetype="dashed")

### mixed line and bar charts
d %>%
    filter(year == 2015) %>%
    ggplot(aes(x=month, group=year)) +
    geom_bar(aes(y=sales), stat="identity") +
    geom_line(aes(y=runningTotal), linetype="dashed", color="orange") +
    xlab("") +
    theme_bw()

### add target line (geom_hline) at y = 300
d %>%
    filter(year == 2015) %>%
    ggplot(aes(x=month, group=year)) +
    geom_bar(aes(y=sales), stat="identity") +
    geom_line(aes(y=runningTotal), linetype="dashed", color="orange") +
    geom_hline(yintercept = 300, color="green", linetype="solid") +
    xlab("") +
    theme_bw()

# panel plot
d %>%
    ggplot(aes(x=month, group=year)) +
    geom_bar(aes(y=sales), stat="identity") +
    geom_line(aes(y=runningTotal), linetype="dashed", color="orange") +
    geom_hline(yintercept = 300, color="green", linetype="solid") +
    xlab("") +
    facet_grid(year~.) +
    theme_bw()

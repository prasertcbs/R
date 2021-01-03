# cumulative sum in dplyr
# install.packages("dplyr", "tidyr")
library(dplyr)
library(tidyr)

### Example 1:
# note: set year as factor (turn year from continuous var to factor)
# in order to use it as a grouping variable in ggplot2
d <- data.frame(year = as.factor(rep(c(2015, 2016), each = 12)),
                month = factor(rep(month.abb, 2), levels=month.abb),
                sales = c(seq(from = 5, by = 5, length.out = 12),
                          seq(from = 10, by = 10, length.out = 12)))

View(d)

# single window (no group by)
d2 <-
    d %>%
    arrange(year, month) %>%
    mutate(runningTotal = cumsum(sales))
View(d2)

# running total by year (group/window by year)
d3 <-
    d %>%
    arrange(year, month) %>%
    group_by(year) %>%
    mutate(runningTotal = cumsum(sales))
View(d3)

### Example 2:
dw <- data.frame(
    date=seq(from=as.Date("2014-1-1"), by="month", length.out = 36),
    bangkok=as.integer(runif(36, min=50, max=100)),
    hadyai=as.integer(runif(36, min=10, max=60)),
    pattaya=as.integer(runif(36, min=30, max=70))
    )
View(dw)

# use tidyr::gather to unpivot from wide to long format
d <-
    dw %>% gather(key = branch, value = customers, bangkok:pattaya)
View(d)

d2 <-
    d %>%
    arrange(branch, date) %>%
    group_by(branch) %>%
    mutate(runningTotal = cumsum(customers))
View(d2)

d3 <-
    d %>%
    arrange(branch, date) %>%
    group_by(branch, year=format(date, "%Y")) %>%
    mutate(runningTotal = cumsum(customers))
View(d3)

library(ggplot2)
ggplot(d2, aes(date, runningTotal, color=branch)) +
    geom_line() +
    facet_grid(.~branch)

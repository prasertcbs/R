# dplyr mutate, transmute ----
install.packages("dplyr")
library(dplyr)

## Example 1: mutate vs transmute ----
d <-
    data.frame(
        month = factor(month.abb, levels = month.abb),
        hi  = c(32, 33, 34, 35, 34, 33, 33, 33, 32, 32, 31, 31),
        lo  = c(21, 23, 25, 26, 26, 26, 26, 26, 25, 25, 24, 21)
    )
View(d)


d$avg <- (d$hi + d$lo) / 2
d$avg <- NULL

# mutuate: compute and APPEND one or more new columns ----
d %>% mutate(avg = (hi + lo) / 2)

d %>% mutate(avg = (hi + lo) / 2,
             avgF = 9 / 5 * avg + 32)

# transmute: compute one or more new columns then DROP original columns ----
d %>% transmute(avg = (hi + lo) / 2,
                avgF = 9 / 5 * avg + 32)

# create new data frame ----
d1 <- d %>% mutate(avg = (hi + lo) / 2,
                   avgF = 9 / 5 * avg + 32)

d2 <- d %>% transmute(avg = (hi + lo) / 2,
                      avgF = 9 / 5 * avg + 32)


# chain to ggplot2 ----
library(ggplot2)
d %>% mutate(avg = (hi + lo) / 2) %>%
    ggplot(aes(month, avg, group = 1)) + geom_line() + geom_point()


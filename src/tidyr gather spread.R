# basic tidyr tutorial ----
install.packages("tidyr")
library(tidyr)
library(ggplot2)

## Example 1: simple wide to long format ----
# wide format data frame
set.seed(1)
d <- data.frame(
    student = c("Peter", "Ann", "Kate", "Mike"),
    sci  = sample(1:10, 4, replace = T),
    math = sample(1:10, 4, replace = T),
    eng  = sample(1:10, 4, replace = T)
)
d

# gather: reshape wide to long format ----
d %>% gather(key = subject, value = score, sci:eng) # key, value

d0 <- d %>% gather(key = subject, value = score, sci:eng) # key, value
d1 <- d %>% gather(subject, score, sci:eng) # key, value
d2 <- d %>% gather(subject, score, -student)

# ggplot required long format ----
ggplot(d0, aes(student, score, fill = subject)) +
    geom_bar(stat = "identity") +
    facet_grid(subject ~ .)

d %>% gather(key = subject, value = score, sci:eng) %>%
    ggplot(aes(student, score, fill = subject)) +
    geom_bar(stat = "identity") +
    facet_grid(subject ~ .)

# spread: long to wide format ----
w <- d0 %>% spread(subject, score)

## Example 2:
e <- data.frame(
    student = c("Peter", "Ann", "Kate", "Mike"),
    gender = c("M", "F", "F", "M"),
    sci  = sample(3:10, 4, replace = T),
    math = sample(3:10, 4, replace = T),
    eng  = sample(3:10, 4, replace = T)
)


e1 <- e %>% gather(subject, score, -c(student, gender))
e1

w1 <- e1 %>% spread(subject, score)

## end ::gather(), spread() ----
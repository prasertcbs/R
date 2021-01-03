### simple facet
install.packages("ggplot2")
library(ggplot2)

# 200 pet lovers
gender <- c(rep("F", 80), rep("M", 120)) # owner gender
income <- as.integer(rnorm(200, mean = 400, sd = 100)) * 100 # owner monthly income
hasKid <- sample(c("Y","N"), 200, prob = c(30, 70), replace=T)
pet <- sample(c("dog", "cat", "bird", "fish", "hampster"), 200, prob = c(45, 25, 15, 10, 5), replace = T)
count <- sample(1:5, 200, prob = c(30, 45, 10, 9, 6), replace = T) # number of pets

d <- data.frame(gender,
                income,
                hasKid,
                pet,
                count)
View(d)

### Example 1: boxplot
ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot()

ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    xlab("")

### facet_grid
ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    xlab("") +
    facet_grid(.~pet)

ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    xlab("") +
    facet_grid(pet~.)

ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    facet_grid(count~pet)

ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    facet_grid(hasKid~pet)

### facet_wrap
ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    facet_wrap(~count)

ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    facet_wrap(~count, nrow=3)

ggplot(d, aes(x=gender, y=income, fill=gender)) +
    geom_boxplot() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    theme_bw() +
    theme(legend.position="none") +
    facet_wrap(~count, ncol=3)

### Example 2: histogram
ggplot(d, aes(x=income)) +
    geom_histogram()

ggplot(d, aes(x=income, fill=gender)) +
    geom_histogram() +
    facet_wrap(~gender)

ggplot(d, aes(x=income, fill=gender)) +
    geom_histogram() +
    scale_fill_manual(values=c("F"="pink", "M"="skyblue")) +
    facet_grid(gender~hasKid)


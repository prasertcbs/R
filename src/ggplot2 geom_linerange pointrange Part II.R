### geom_linerange and geom_pointrange with stat_summary
install.packages("ggplot2", "dplyr")
library(ggplot2)
library(dplyr)

### use stat_summary to aggregate data
View(mpg)

a.min <- aggregate(cty~class, data=mpg, min)
a.min

a.max <- aggregate(cty~class, data=mpg, max)
a.max

d <- merge(a.min, a.max, by="class")
colnames(d) <- c("class", "min", "max")
View(d)

### use dplyr instead of aggregate()
d2 <- mpg %>%
    group_by(class) %>%
    summarize(min=min(cty), max=max(cty))
View(d2)

ggplot() +
    geom_linerange(data=d, aes(x=class, ymin=min, ymax=max)) +
    geom_point(data=d, aes(x=class, y=(min+max)/2))

# use stat_summary
ggplot(mpg, aes(x = class, y = cty)) +
    geom_linerange(stat = "summary",
                   fun.ymin = min,
                   fun.ymax = max,
                   color="purple")

ggplot() +
    geom_linerange(data=mpg, aes(x = class, y = cty),
                   stat = "summary",
                   fun.ymin = min,
                   fun.ymax = max,
                   color="green")

ggplot(mpg, aes(x = class, y = cty)) +
    stat_summary(geom="linerange",
                 fun.ymin = min,
                 fun.ymax = max,
                 color="skyblue")

ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(
        stat = "summary",
        fun.y = mean,
        fun.ymin = min,
        fun.ymax = max,
        shape=15,
        color="red"
    )

ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(
        stat = "summary",
        fun.y = mean,
        fun.ymin = min,
        fun.ymax = max,
        shape=25,
        fill="orange",
        color="skyblue"
    ) +
    xlab("") +
    theme_bw() +
    coord_flip()

# reorder by cty
ggplot(mpg, aes(x = reorder(class, cty), y = cty)) +
    geom_pointrange(
        stat = "summary",
        fun.y = mean,
        fun.ymin = min,
        fun.ymax = max,
        shape=25,
        fill="orange",
        color="skyblue"
    ) +
    xlab("") +
    theme_bw() +
    coord_flip()

# ERROR: custom formula
ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(
        stat = "summary",
        fun.y = mean,
        fun.ymin = mean - sd,
        fun.ymax = mean + sd
    )

# use anonymous function
ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(
        stat = "summary",
        fun.y = mean,
        fun.ymin = function(y) mean(y) - sd(y),
        fun.ymax = function(y) mean(y) + sd(y)
    )

# user-defined function mean +- 1 standard deviation
mean_1sd <- function(x) {
    c(y=mean(x), ymin=mean(x)-sd(x), ymax=mean(x)+sd(x))
}

mean_1sd(mpg$cty)

ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(
        stat = "summary",
        fun.data = mean_1sd,
        color = "skyblue",
        size = 1.2
    )

ggplot(mpg, aes(x = reorder(class, cty), y = cty)) +
    stat_summary(fun.data = mean_1sd,
                 color = "orange",
                 size = 1.2) +
    coord_flip()









# ------------------------------------------------------------------------
ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(stat = "summary",
                    fun.data = mean_se)

ggplot(mpg, aes(x = class, y = cty)) +
    geom_linerange(
        stat = "summary",
        fun.data = mean_se,
        color = "skyblue",
        size = 1.5
    ) +
    geom_point(
        stat = "summary",
        fun.y = mean,
        size = 3,
        color = "orange"
    )


### UDF: mean, low, hi
mean_hl <- function(x) {
    c(y = mean(x),
      ymin = min(x),
      ymax = max(x))
}

### UDF: median, low, hi
median_hl <- function(x) {
    c(y = median(x),
      ymin = min(x),
      ymax = max(x))
}


mean_hl(mpg$cty)

mean_hl(mpg$cty)[1]
mean_hl(mpg$cty)[2]

p <- mean_hl(mpg$cty)
p[1]
str(p)

### use anonymous function
ggplot(mpg, aes(class, cty)) +
    stat_summary(
        fun.y = median,
        fun.ymin = min,
        fun.ymax = max,
        color = "limegreen",
        size = 1
    ) +
    theme_bw()

ggplot(mpg, aes(class, cty)) +
    stat_summary(
        fun.y = mean,
        fun.ymin = function(x)
            mean(x) - sd(x),
        fun.ymax = function(x)
            mean(x) + sd(x)
    )


ggplot(mpg, aes(class, cty)) +
    stat_summary(fun.data = mean_se,
                 colour = "red",
                 size = 1) +
    theme_bw() +
    coord_flip()

ggplot(mpg, aes(class, cty)) +
    stat_summary(fun.data = "mean_hl",
                 colour = "red",
                 size = 1) +
    theme_bw() +
    coord_flip()

ggplot(mpg, aes(x = class, y = cty)) +
    geom_linerange(stat = "summary",
                   fun.data = mean_hl)

ggplot(mpg, aes(x = class, y = cty)) +
    geom_linerange(stat = "summary",
                   fun.data = median_hl)

ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(stat = "summary",
                    fun.data = median_hl)

ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(stat = "summary",
                    fun.data = median_hl,
                    color = "skyblue") +
    theme_bw() +
    coord_flip()

ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(stat = "summary", fun.data = "mean_hl")

ggplot(mpg, aes(x = class, y = cty)) +
    geom_pointrange(
        stat = "summary",
        fun.y = mean,
        fun.ymin = min,
        fun.ymax = max,
        color = "skyblue",
        size = 1
    ) +
    theme_bw()
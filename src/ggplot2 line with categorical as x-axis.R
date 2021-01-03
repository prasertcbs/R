### ggplot2 line chart (x-axis is a categorical variable)
install.packages("ggplot2")
library(ggplot2)

### 1) single group --------
d <- data.frame(test=factor(c("pretest", "posttest"),
                            levels = c("pretest", "posttest")),
                score=c(3, 5))
View(d)

# Basic line plot with points
# common pitfall (no group aesthetic)
ggplot(d, aes(test, score)) +
    geom_line() +
    geom_point()

# with group aesthetic set to 1
ggplot(d, aes(test, score, group=1)) +
    geom_line() +
    geom_point()

# line and point
# linetype ("blank", "solid", "dashed", "dotted", "dotdash", "longdash", "twodash")
ggplot(d, aes(test, score, group=1)) +
    geom_line(color="blue", linetype="dashed") +
    geom_point(color="orange", size = 3, shape=2)

# add y-axis limit/(from -> to)
ggplot(d, aes(test, score, group=1)) +
    geom_line(color="blue", linetype="dashed") +
    geom_point(color="orange", size = 3) +
    ylim(0, max(d$score))

### 2) two groups --------
d <- data.frame(school=rep(c("Alpha", "Beta"), each = 2),
                test=factor(c("pretest", "posttest"),
                            levels = c("pretest", "posttest")),
                score=c(3, 5, 3.5, 4))
View(d)
# group = school
ggplot(d, aes(test, score, group=school)) +
    geom_line() +
    geom_point()

ggplot(d, aes(test, score, group=school, color=school)) +
    geom_line() +
    geom_point()

# line color, line type, point/marker shape
ggplot(d, aes(test, score, group=school, color=school, linetype=school, shape=school)) +
    geom_line() +
    geom_point()

# add ylim and facet
ggplot(d, aes(test, score, group=school, color=school, linetype=school, shape=school)) +
    geom_line() +
    geom_point() +
    ylim(0, max(d$score)) +
    xlab("") +
    facet_grid(.~school)

# set linetype and point shape
ggplot(d, aes(test, score, group=school, color=school, linetype=school, shape=school)) +
    geom_line() +
    geom_point(size=3) +
    ylim(0, max(d$score)) +
    ggtitle("Alpha vs Beta") + xlab("") +
    theme_bw()

# custom linetype
ggplot(d, aes(test, score, group=school, color=school, linetype=school, shape=school)) +
    geom_line() +
    geom_point(size=3) +
    ylim(0, max(d$score)) +
    ggtitle("Alpha vs Beta") + xlab("") +
    scale_linetype_manual(values=c("dashed", "dotted")) +
    theme_bw()

# custom line color and legend position
browseURL("https://color.adobe.com/explore/newest/")

ggplot(d, aes(test, score, group=school, color=school, linetype=school, shape=school)) +
    geom_line() +
    geom_point(size=3) +
    ylim(0, max(d$score)) +
    scale_linetype_manual(values=c("dashed", "solid")) +
    scale_color_manual(values=c("#F919FF", "#44B200")) +
    ggtitle("Alpha vs Beta") + xlab("") +
    theme_bw() +
    theme(legend.position="bottom") # top, left, right, bottom, none
### ggplot2 line chart (x-axis is a date/time)
# install.packages("ggplot2")
library(ggplot2)

### 2 groups/series
t <- seq(as.Date("2016-1-1"), by = "month", length.out=12)
menu <- rep(c("Coffee", "Tea"), each = 12)
d2 <- data.frame(date=rep(t, 2),
                 menu=as.factor(menu),
                 sales = as.integer(runif(24, 5, 50)))
View(d2)

# grouped by menu(Coffee, Tea)
ggplot(d2, aes(x=date, y=sales, group=menu, color=menu)) +
    geom_line()

# set y-scale limit (lower, upper) + add point/marker
ggplot(d2, aes(date, sales, group=menu, color=menu)) +
    geom_line() +
    geom_point() +
    ylim(0, max(d2$sales)) +
    ggtitle("Coffee vs Tea") + xlab("") +
    theme_bw()

# add facet
ggplot(d2, aes(date, sales, group=menu, color=menu)) +
    geom_line() +
    geom_point() +
    ylim(0, max(d2$sales)) +
    ggtitle("Coffee vs Tea") + xlab("") +
    facet_grid(menu~.) +
    theme_bw()

ggplot(d2, aes(date, sales, group=menu, color=menu)) +
    geom_line() +
    geom_point() +
    ylim(0, max(d2$sales)) +
    ggtitle("Coffee vs Tea") + xlab("") +
    facet_grid(.~menu) +
    theme_bw()

# custom line types and colors
# linetype ("blank", "solid", "dashed", "dotted", "dotdash", "longdash", "twodash")
ggplot(d2, aes(date, sales, group=menu, color=menu)) +
    geom_line(aes(linetype=menu)) +
    geom_point() +
    ylim(0, max(d2$sales)) +
    ggtitle("Coffee vs Tea") + xlab("") +
    theme_bw() +
    scale_linetype_manual(values=c("dashed", "solid")) +
    scale_color_manual(values=c("#105B63", "#DB9E36")) +
    theme(legend.position="bottom") # top, left, right, bottom, none

# add average lines
al <- aggregate(sales~menu, d2, FUN=mean, na.rm=T) # al <- with(d2, aggregate(sales, by=list(menu), FUN=mean, na.rm=T))
View(al)

ggplot(d2, aes(date, sales, group=menu, color=menu)) +
    geom_line(aes(linetype=menu)) +
    geom_point() +
    ylim(0, max(d2$sales)) +
    ggtitle("Coffee vs Tea") + xlab("") +
    theme_bw() +
    scale_linetype_manual(values=c("solid", "solid")) +
    scale_color_manual(values=c("#529cf6", "#ffb855")) +
    geom_hline(aes(yintercept=as.numeric(sales)), data=al, color=c("#529cf6", "#ffb855"), linetype="dashed") +
    theme(legend.position="bottom") # top, left, right, bottom, none

### ggplot2 heatmap

# install.packages("ggplot2")
# install.packages("tidyr")
library(ggplot2)
library(tidyr)

### wide format
dw <- data.frame(month = rep(factor(month.abb, levels=month.abb)),
                 coffee = as.integer(rnorm(12, mean=80, sd=20)),
                 tea = as.integer(rnorm(12, mean=80, sd=20)),
                 cake = as.integer(rnorm(12, mean=80, sd=20)),
                 smoothie = as.integer(rnorm(12, mean=80, sd=20)))
View(dw)

### use tidyr::gather to unpivot dw to a long format
d <-
    dw %>% gather(key = menu, value = orders, coffee:smoothie)
View(d)


### plain heatmap with geom_tile()
ggplot(d, aes(x=month, y=menu, fill=orders)) +
    geom_tile()

### compare to line chart
ggplot(d, aes(month, orders, color=menu, group=menu)) +
    geom_line()

### customize tile gradient
ggplot(d, aes(month, menu, fill=orders)) +
    geom_tile() +
    scale_fill_gradient(low="white", high="limegreen")

### remove background, ticks, legend, axis labels
ggplot(d, aes(month, menu, fill=orders)) +
    geom_tile() +
    scale_fill_gradient(low="white", high="limegreen") +
    xlab("") +
    ylab("") +
    theme_bw() +
    theme(axis.line = element_blank(),
          axis.ticks = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          legend.position="none")

### add text value to each tile with geom_text()
ggplot(d, aes(month, menu, fill=orders)) +
    geom_tile() +
    geom_text(aes(month, menu, label=orders), color = "purple", size = 4) +
    scale_fill_gradient(low="white", high="limegreen") +
    xlab("") +
    ylab("") +
    theme_bw() +
    theme(axis.line = element_blank(),
          axis.ticks = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          legend.position="none")

### long format
d <- data.frame(month = rep(factor(month.abb, levels=month.abb), 4),
                menu = rep(c("Coffee", "Tea", "Cake", "Smoothie"), each=12),
                orders = as.integer(rnorm(48, mean=80, sd=20)))
View(d)

### long format with three dimensions (branch, month, menu)
d <- data.frame(branch = rep(c("Bangkok", "Phuket"), each=48),
                month = rep(factor(month.abb, levels=month.abb), 8),
                menu = rep(c("Coffee", "Tea", "Cake", "Smoothie"), each=12),
                orders = as.integer(rnorm(96, mean=80, sd=20)))
View(d)
ggplot(d, aes(month, menu, fill=orders)) +
    geom_tile() +
    geom_text(aes(month, menu, label=orders), color = "grey40", size = 3) +
    scale_fill_gradient(low="white", high="limegreen") +
    xlab("") +
    ylab("") +
    theme_bw() +
    theme(axis.line = element_blank(),
          axis.ticks = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          legend.position="none") +
    facet_grid(branch~.)
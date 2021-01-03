### separate mean segment

# install.packages("ggplot2", "dplyr")
library(ggplot2)
library(dplyr)

set.seed(22)
d <- data.frame(t = seq(as.Date("2011-1-1"), by = "month", length.out = 48),
                v = as.integer(rnorm(48, mean=50, sd=10)))

### plain line chart
ggplot(d, aes(x=t, y=v)) +
    geom_line()

### add average line
ggplot(d, aes(x=t, y=v)) +
    geom_line() +
    geom_hline(yintercept = mean(d$v), color="limegreen") +
    theme_bw()

### create mean by year
d2 <-
    d %>%
    group_by(year=format(t,'%Y')) %>%
    summarise(avg=mean(v), minT=min(t), maxT=max(t))

### draw only avg lines for each year with geom_segment
ggplot() +
    geom_segment(data=d2,
                 aes(x = minT,
                     y = avg,
                     xend = maxT,
                     yend = avg))

# add color=year to aes().
# Note: year is a character not numeric (continuous variable)
ggplot() +
    geom_segment(data=d2,
                 aes(x = minT,
                     y = avg,
                     xend = maxT,
                     yend = avg, color=year)) +
    ylim(min(d$v), max(d$v))

### use geom_segment to draw separate avg line segment for each year
# data sources came from 2 data frames: one for geom_line, another for geom_segment
ggplot(d, aes(x=t, y=v)) +
    geom_line(color="grey") +
    geom_segment(data=d2,
                 aes(x = minT,
                     y = avg,
                     xend = maxT,
                     yend = avg, color=year),
                 size = 1,
                 linetype="solid") +
    theme_bw() +
    theme(legend.position="none") +
    xlab("") + ylab("")
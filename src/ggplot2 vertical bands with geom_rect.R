### using geom_rect() to add vertical bands to graph

install.packages("WDI", "ggplot2", "scales")

library(WDI)
library(ggplot2)
library(scales)

kpi <-
    WDI(
        country = c("TH", "VN", "MY"),
        indicator = c("ST.INT.ARVL"),
        start = 1995,
        end = 2014,
        extra = F
    )

View(kpi)

g <-
    ggplot(kpi, aes(year, ST.INT.ARVL, color=country, shape=country)) +
        geom_line() +
        geom_point() +
        scale_y_continuous(labels = comma) +
        ggtitle("International tourism, number of arrivals") +
        xlab("") +
        ylab("")
g

theme <-
    theme_bw() +
    theme(legend.position="bottom",
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          legend.key = element_blank(), # remove legend border
          legend.title=element_blank()) # remove legend title

g + theme

# add single geom_rect
### format y-axis label (in millions)
ggplot(kpi, aes(year, ST.INT.ARVL / 1000000, color=country, shape=country)) +
    geom_rect(xmin=1996, xmax=2000, ymin=-Inf, ymax=Inf, fill="grey95", color=NA) +
    geom_line() +
    geom_point() +
    scale_y_continuous(labels = comma) +
    ggtitle("International tourism, number of arrivals") +
    xlab("") +
    ylab("(in millions)") +
    theme

# add 3 geom_rects
ggplot(kpi, aes(year, ST.INT.ARVL / 1000000, color=country, shape=country)) +
    geom_rect(xmin=1996, xmax=2000, ymin=-Inf, ymax=Inf, fill="grey95", color=NA) +
    geom_rect(xmin=2003, xmax=2006, ymin=-Inf, ymax=Inf, fill="honeydew", color=NA) +
    geom_rect(xmin=2008, xmax=2010, ymin=-Inf, ymax=Inf, fill="seashell", color=NA) +
    geom_line() +
    geom_point() +
    scale_y_continuous(labels = comma) +
    ggtitle("International tourism, number of arrivals") +
    xlab("") +
    ylab("(in millions)") +
    theme

### store geom_rect aes in data.frame
band <- data.frame(from.year=c(1996, 2003, 2008),
                   to.year  =c(2000, 2006, 2010))

ggplot(kpi) +
    geom_rect(data=band,
              aes(xmin=from.year, xmax=to.year, ymin=-Inf, ymax=Inf),
              fill="grey95", alpha=.3) +
    geom_line(aes(x=year, y=ST.INT.ARVL / 1000000, color=country)) +
    geom_point(aes(x=year, y=ST.INT.ARVL / 1000000, color=country, shape=country)) +
    theme_bw() +
    ggtitle("International tourism, number of arrivals") +
    xlab("") +
    ylab("(in millions)") +
    theme +
    facet_grid(.~country) +
    theme(legend.position="none")

### end -------------








# Total population SP.POP.TOTL
kpi <-
    WDI(
        country = c("TH", "KR", "VN"),
        indicator = c("SP.POP.TOTL"),
        start = 1960,
        end = 2014,
        extra = F
    )

View(kpi)

ggplot(kpi, aes(year, SP.POP.TOTL / 1000000, color = country, shape=country)) +
    geom_rect(data=NULL,
              xmin=1960, xmax=1970, ymin=-Inf, ymax=Inf, fill="grey95", color=NA) +
    geom_rect(data=NULL,
              xmin=1980, xmax=1990, ymin=-Inf, ymax=Inf, fill="honeydew", color=NA) +
    geom_rect(data=NULL,
              xmin=2000, xmax=2010, ymin=-Inf, ymax=Inf, fill="seashell", color=NA) +
    geom_line() +
    # geom_point() +
    scale_y_continuous(labels = comma) +
    ggtitle("Total population") +
    xlab("") +
    ylab("(in millions)") +
    theme

### Government expenditure on education as % of GDP (%)
kpi <-
    WDI(
        country = c("TH", "JP", "KR", "SG"),
        indicator = c("SE.XPD.TOTL.GD.ZS"),
        start = 1970,
        end = 2014,
        extra = F
    )

View(kpi)

band <- data.frame(from.year=c(1970, 1990, 2010),
                   to.year  =c(1980, 2000, 2016))

ggplot(kpi) +
    geom_rect(data=band,
              aes(xmin=from.year, xmax=to.year, ymin=-Inf, ymax=Inf),
              fill="grey95", alpha=.3) +
    geom_line(aes(x=year, y=SE.XPD.TOTL.GD.ZS, color=country)) +
    geom_point(aes(x=year, y=SE.XPD.TOTL.GD.ZS, color=country, shape=country)) +
    theme_bw() +
    ggtitle("Government expenditure on education as % of GDP") +
    xlab("") +
    ylab("%") +
    facet_grid(country~.) +
    theme(legend.position="none")
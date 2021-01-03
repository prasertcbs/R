# get data from World Bank (World Development Indicators) ----

install.packages("WDI")
library(WDI)
library(ggplot2)
library(scales)

browseURL("http://data.worldbank.org/indicator/ST.INT.ARVL")

q <- WDIsearch(string = "gdp per capita")
q <- WDIsearch(string = "gdp per capita", short = F)
q <- WDIsearch(string = "gdp per capita|internet|tourism", short = F)

View(q)

kpi <-
    WDI(
        country = c("TH", "SG", "MY"),
        indicator = c("ST.INT.ARVL", "NY.GDP.MKTP.KD.ZG", "ST.INT.DPRT"),
        start = 2000,
        end = 2015,
        extra = T
    )

View(kpi)

ggplot(kpi, aes(year, ST.INT.ARVL, color = country)) +
    geom_line() +
    labs(title = "International tourism, number of arrivals") +
    geom_point() + scale_y_continuous(labels = comma)

ggplot(kpi, aes(year, ST.INT.ARVL / 1000000, color = country)) +
    geom_line() +
    labs(title = "International tourism, number of arrivals") +
    geom_point() + scale_y_continuous(labels = comma)

## end ----









ggplot(kpi, aes(year, ST.INT.ARVL / 1000000, color = country)) +
    geom_line() +
    labs(title = "International tourism, number of arrivals") +
    geom_point() + scale_y_continuous(labels = comma) +
    facet_grid(country ~ .) + ylim(0, 20)
#facet_grid(. ~ country) + ylim(0, 20)

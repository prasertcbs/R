### lag analysis
library(dplyr)

# Thailand Max Electricity demand
# source: http://www.egat.co.th/index.php?option=com_content&view=article&layout=edit&id=353&Itemid=200

d <- read.csv("ElectricityDemand.csv")
View(d)

d <-
    d %>%
    mutate(prev = lag(MegaWatt, order_by = Year))
View(d)

d <- read.csv("ElectricityDemand.csv")
d <-
    d %>%
    mutate(prev = lag(MegaWatt, order_by = Year)) %>%
    mutate(delta = MegaWatt/prev - 1)
View(d)

d <- read.csv("ElectricityDemand.csv")
d2 <-
    d %>%
    mutate(delta = MegaWatt/lag(MegaWatt, order_by = Year) - 1)
View(d2)

### Visualize it!
library(ggplot2)
library(scales)
ggplot(d2, aes(x=Year, y=MegaWatt)) +
    geom_line()

ggplot(d2, aes(x=Year, y=delta)) +
    geom_line(color="pink") +
    theme_bw()

ggplot(d2, aes(x=Year, y=delta)) +
    geom_line(color="pink") +
    scale_y_continuous(labels=percent) +
    theme_bw()
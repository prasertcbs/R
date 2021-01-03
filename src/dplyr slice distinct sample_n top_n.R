library(dplyr)
packageVersion("dplyr")

library(ggplot2) # use "mpg" data set

View(mpg)
?mpg

# slice ----
d <- mpg %>% slice(2:5)
d <- mpg %>% slice(c(5,20,30))
d <- mpg %>% slice(sample(1:nrow(mpg),5))

# distinct ----
d <- mpg %>% distinct(manufacturer)
d <- mpg %>%
        distinct(manufacturer) %>%
        select(manufacturer)

d <- mpg %>%
        distinct(manufacturer, model) %>%
        select(manufacturer, model)

# sample_n, sample_frac ----
d <- mpg %>% sample_n(10)
d <- mpg %>% sample_frac(.10)

d <- mpg %>%
        filter(manufacturer %in% c("honda", "toyota")) %>%
        sample_n(5)

# top_n ----
d <- mpg %>% top_n(10, wt=hwy) # top 10 fuel efficiency
d <- mpg %>% top_n(10, wt=desc(hwy)) # bottom 10 fuel efficiency

d <- mpg %>%
        filter(displ < 2) %>%
        top_n(10, wt=hwy) # bottom 10 fuel efficiency

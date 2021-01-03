library(dplyr)
packageVersion("dplyr")

library(ggplot2) # use "mpg" data set

View(mpg)
?mpg

# cheat sheet
browseURL("https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf")

filter(mpg, hwy > 30)
d <- filter(mpg, hwy > 30)

d <- mpg %>% filter(hwy > 30) # chaining or piping

d <- mpg %>%
    filter(hwy > 30)

d <- mpg %>%
    filter(hwy > 30, class == "compact")

d <- mpg %>%
    filter(hwy > 30, class != "compact")

d <- mpg %>%
    filter(hwy > 30, class == "compact" | displ > 2)

d <- mpg %>%
    filter(hwy >= 25, cty >= 20, class %in% c("compact", "midsize", "suv"))

# dplyr: window function ----
install.packages("dplyr", "ggplot2")
library(dplyr)
library(ggplot2) # mpg data

View(mpg)
# subsetting mpg
d <-
    mpg %>%
    filter(year == 2008, manufacturer %in% c("audi", "honda", "toyota")) %>%
    select(manufacturer:displ, trans, hwy) %>%
    arrange(manufacturer, desc(hwy))
View(d)

q <-
    d %>%
    mutate(row_num = row_number(hwy)) %>%
    arrange(row_num)

q2 <-
    d %>%
    mutate(row_num = row_number(-hwy)) %>%
    arrange(row_num)

q3 <-
    d %>%
    mutate(row_num = row_number(desc(hwy))) %>%
    arrange(row_num)

m <-
    d %>%
    group_by(manufacturer) %>%
    mutate(row_num = row_number(desc(hwy))) %>%
    arrange(manufacturer, row_num)

m <-
    d %>%
    group_by(manufacturer) %>%
    mutate(row_num = row_number(desc(hwy))) %>%
    filter(row_num == 1) %>%
    arrange(manufacturer, row_num)

m2 <-
    d %>%
    group_by(manufacturer) %>%
    mutate(
        row_num = row_number(desc(hwy)),
        hwy_min_rank = min_rank(-hwy),
        hwy_dense_rank = dense_rank(-hwy)
    ) %>%
    arrange(manufacturer, row_num)

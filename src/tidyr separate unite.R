# basic tidyr tutorial => ::separate() and ::unite() ----
install.packages("tidyr")
library(tidyr)
library(dplyr)
library(ggplot2)
library(scales)

## Example: separate and unite ----
f <- data.frame(
    location = LETTERS[1:4],
    area = c("1-3-20", "4-1-25", "0-2-0", "10-3-80"),
    bought = as.Date(c(
        "2010-07-02", "1980-10-11", "1995-10-25", "2015-11-30"
    ))
)

# separate one column to serveral columns ----
f %>% separate(area, into = c("rai", "ngan", "wa"), sep = "-")
f

s <- f %>% separate(area, into = c("rai", "ngan", "wa"), sep = "-")
s
str(s)

s1 <-
    f %>% separate(
        area,
        into = c("rai", "ngan", "wa"),
        remove = F,
        convert = T
    )
s1
str(s1)

f %>%
    separate(
        area,
        into = c("rai", "ngan", "wa"),
        remove = F,
        convert = T
    ) %>%
    mutate(sqWa = rai * 400 + ngan * 100 + wa) %>%
    ggplot(aes(location, sqWa)) +
        geom_bar(stat = "identity") +
        scale_y_continuous(labels = comma) +
        theme_minimal()

# separate date column ----
t <- f %>% separate(bought, into = c("year", "month", "day"), remove = F, convert = T)
t

# use "x" as a separator ----
g <- data.frame(
    model = LETTERS[1:4],
    resolution = c("800x600", "1280x720", "1920x1080", "4000x2000")
)
g

g1 <-
    g %>%
    separate(
        resolution,
        into = c("height", "width"),
        sep = "x",
        remove = F,
        convert = T
    ) %>%
    mutate(megaPixel = round(height * width / 1000000, 2))
str(g1)
g1

## use character position as a separator ----
d <- data.frame(
    student = c("Peter", "Ann", "Kate", "Mike"),
    grp = c("M1", "F2", "F1", "M4"),
    id = c("56412345AC", "57293579EG", "58123478PC", "59759323EG"),
    sci  = sample(1:10, 4, replace = T),
    math = sample(1:10, 4, replace = T),
    eng  = sample(1:10, 4, replace = T)
)

p <-
    d %>% separate(
        grp,
        into = c("gender", "group"),
        sep = 1,
        remove = F,
        convert = T
    )
p

p1 <-
    p %>% separate(
        id,
        into = c("yy", "number", "dept"),
        sep = c(2, 8),
        remove = F
    )
p1

# use negative number in sep ----
d <-
    data.frame(w = c("10kg", "160kg", "6kg", "17kg", "9kg", "3kg", "23kg", "12kg"))

k <-
    d %>% separate(
        w,
        into = c("weight", "unit"),
        sep = -3,
        remove = F,
        convert = T
    )
k

# unite ----
k %>% unite(w2, c(weight, unit), remove = F) # default sep = "_"
k %>% unite(w2, c(weight, unit), sep = "", remove = F)

# ggplot2: bubble chart ----
install.packages("ggplot2", "dplyr")

library(ggplot2)
library(dplyr)

View(mtcars)
?mtcars

# change rownames to "model" column
mtcars <- add_rownames(mtcars, var = "model")

mtcars$am <- factor(mtcars$am, labels = c("auto", "manual"))

# convert from cu.in to cc
mtcars$disp.cc <- as.integer(mtcars$disp * 16.3871)

# convert mpg to kilometre per litre
mtcars$kpl <- round(mtcars$mpg * 0.425144, digits = 2)

ggplot(mtcars, aes(x = disp.cc, y = kpl)) +
    geom_point(color = "orange", alpha = .5)

ggplot(mtcars, aes(x = disp.cc, y = kpl)) +
    geom_point(color = "orange", alpha = .5) +
    geom_text(aes(label = model), size = 3, vjust = -1) +
    theme_bw()

# adjust point size
ggplot(mtcars, aes(x = disp.cc, y = kpl)) +
    geom_point(color = "orange", size=3, alpha = .5) +
    geom_text(aes(label = model), size = 3, vjust = -1) +
    theme_bw()

ggplot(mtcars[mtcars$kpl > 8 & mtcars$disp.cc < 3000,],
       aes(x = disp.cc, y = kpl)) +
    geom_point(color = "orange", size=3, alpha = .5) +
    geom_text(aes(label = model), size = 3, vjust = -1) +
    theme_bw() +
    facet_wrap(~am)

# use dplyr to filter data
mtcars %>%
    filter(kpl > 8, disp.cc < 3000) %>%
    ggplot(aes(x = disp.cc, y = kpl)) +
        geom_point(color = "orange", size=3, alpha = .5) +
        geom_text(aes(label = model), size = 3, vjust = -1) +
        theme_bw() +
        facet_wrap(~am)

# color by cyl
# size by wt (weight)
# convert cyl (continuous var) to factor
mtcars$cyl = factor(mtcars$cyl)

# convert wt (weights (1000 lbs)) to kg (1000 kg)
mtcars$wt.kg = mtcars$wt * 0.453592

mtcars %>%
    filter(kpl > 8, disp.cc < 3000) %>%
    ggplot(aes(x = disp.cc, y = kpl)) +
        geom_point(aes(size=wt.kg, color=cyl), alpha = .5) +
        scale_size_area(max_size = 8) +
        geom_text(aes(label = model), size = 3, vjust = -1) +
        theme_bw() +
        facet_wrap(~am)
# create scatterplot matrices with psych::pairs.panels -----
install.packages("psych")
library(psych)

View(mtcars)

?pairs.panels

pairs.panels(mtcars)

pairs.panels(mtcars[1:3])
pairs(mtcars[1:3])
pairs.panels(mtcars[1:3], cex.cor=.4)

pairs.panels(mtcars[c(1, 3, 4, 6)], cex.cor=.4)
pairs.panels(mtcars[c("mpg", "disp", "hp", "wt")],
             main = "Miles per gallon",
             cex.cor=.4)

d <- mtcars[c("mpg", "disp", "hp", "wt")]
pairs.panels(d,
             main = "Miles per gallon",
             lm = T,
             # use lm instead of LOESS
             hist.col = "pink",
             cex.cor = .4)

pairs.panels(
    d,
    main = "Miles per gallon",
    lm = T, # use lm instead of LOESS
    ellipses = F, # disable correlation matrix ellipses
    hist.col = "pink",
    # color of histogram bar
    cex.cor = .4 # cex.cor controls the font size of correlation values in the upper panel. Value of .4 means 40% of the default size.
)


# color grouping by transmission type (auto/manual) ----
mtcars$am <- factor(mtcars$am, labels = c("auto", "manual"))

pairs.panels(
    d,
    bg = c("green", "purple")[mtcars$am],
    pch = 21 + as.numeric(mtcars$am), # 21+ filled color symbol
    main = "Miles per gallon",
    lm = T, # use lm instead of LOESS
    col = "orange", # set regression line color
    ellipses = F,
    hist.col = "pink", # color of histogram bar
    cex.cor = .4 # cex.cor controls the font size of correlation values in the upper panel. Value of .4 means 40% of the default size.
)

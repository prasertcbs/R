# scatterplot matrices ----
View(mtcars)

pairs(mtcars)
pairs(mtcars[1:3])
pairs(mtcars[c(1,3,4)])
pairs(mtcars[c("mpg", "disp", "hp")])
pairs(mtcars[c("mpg", "disp", "hp")], lower.panel = NULL)
pairs(mtcars[c("mpg", "disp", "hp")], upper.panel = NULL)

# use formula style ----
pairs(
    ~ mpg + disp + hp,
    data = mtcars,
    main = "Miles per gallon",
    upper.panel = NULL
)

# subset data ----
mtcars$am <- factor(mtcars$am, labels = c("auto", "manual"))

pairs(
    ~ mpg + disp + hp,
    data = mtcars,
    subset = c(am == "auto"),
    main = "mpg (auto transmission)",
    upper.panel = NULL
)

pairs(
    ~ mpg + disp + hp,
    data = mtcars,
    subset = c(am == "manual" | gear == 4),
    main = "mpg (manual transmission)",
    upper.panel = NULL
)

# ---- end ----









# Scatterplot Matrices from the car Package ----
library(car)
scatterplotMatrix( ~ mpg + disp + hp, data = mtcars,
                    main = "mpg")
scatterplotMatrix( ~ mpg + disp + hp, data = mtcars,
                    main = "mpg", diagonal=c("none"))
scatterplotMatrix( ~ mpg + disp + hp | am, data = mtcars,
                    main = "mpg by transmission type")

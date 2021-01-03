# ggplot2: Cleveland's dot plot ----

library(ggplot2)

View(mtcars)

# create a new column from row names ----
d <- cbind(model = rownames(mtcars), mtcars)
d
rownames(d) <- NULL
View(d)

# simple bar plot to show fuel efficienty ----
ggplot(d, aes(x = model, y = mpg)) +
    geom_bar(stat = "identity")

# horizontal bar ----
ggplot(d, aes(x = model, y = mpg)) +
    geom_bar(stat = "identity") +
    coord_flip()

# sort by mpg ----
# reorder(model, mpg) will turn model into a factor and sorts it by mpg
# try reorder(model, desc(mpg))
ggplot(d, aes(x = reorder(model, mpg), y = mpg)) +
    geom_bar(stat = "identity") +
    coord_flip()

# use point instead of bar ----
ggplot(d, aes(x = reorder(model, mpg), y = mpg)) +
    geom_point(size = 3)

ggplot(d, aes(x = reorder(model, desc(mpg)), y = mpg)) +
    geom_point(size = 3) +
    coord_flip()


ggplot(d, aes(x = reorder(model, mpg), y = mpg)) +
    geom_point(
        shape = 21,
        fill = "red",
        color = "red",
        size = 2
    ) +
    labs(title = "Fuel efficiency", x = "") +
    coord_flip() +
    theme_bw() +
    theme(
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed")
    )

# add verticle lines ----
ggplot(d, aes(x = reorder(model, mpg), y = mpg)) +
    geom_point(
        shape = 21,
        fill = "red",
        color = "red",
        size = 2
    ) +
    labs(title = "Fuel efficiency", x = "") +
    geom_hline(yintercept = quantile(d$mpg),
               color = "green",
               linetype = "dashed") +
    coord_flip() +
    theme_bw() +
    theme(
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed")
    )

# swap x and y axis = coord_flip()
ggplot(d, aes(x = mpg, y = reorder(model, mpg))) +
    geom_point(size = 3)

## end ---------





# facet by transmission type ----
d$am <- factor(d$am, labels = c("auto", "manual"))
ggplot(d, aes(x = reorder(model, mpg), y = mpg)) +
    geom_point(shape = 21, size = 2, aes(color = am, fill = am)) +
    coord_flip() +
    theme_bw() +
    theme(
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed")
    ) + facet_grid(am ~ .)

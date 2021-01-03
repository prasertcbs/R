### geom_linerange and geom_pointrange
install.packages("ggplot2", "scales")
library(ggplot2)
library(scales) # format axis labels

# Example 1: ราคาประเมินที่ดิน(บาท/ตารางวา) 2559-2562
browseURL("http://www.treasury.go.th/download/PDF_Price_assessment/prakhanong_New_06.pdf")

d <- data.frame(
    area = c("Nana", "Ekamai", "Rama IV", "Rama III"),
    lower = c(320000, 280000, 360000, 200000),
    upper = c(380000, 350000, 400000, 280000)
)
View(d)

ggplot() +
    geom_linerange(
        data = d,
        aes(x = area, ymin = lower, ymax = upper),
        size = 1,
        color = "purple"
    )

# reorder by upper value
ggplot() +
    geom_linerange(
        data = d,
        aes(x = reorder(area, upper), ymin = lower, ymax = upper),
        size = 1,
        color = "purple"
    )

# add geom_point showing mean
ggplot() +
    geom_linerange(
        data = d,
        aes(x = reorder(area, upper), ymin = lower, ymax = upper),
        size = 1,
        color = "purple"
    ) +
    geom_point(
        data = d,
        aes(x = area, y = (lower + upper) / 2),
        size = 4,
        shape = 25,
        color = "limegreen", fill = "limegreen"
    ) +
    theme_bw() +
    xlab("") + ylab("") +
    scale_y_continuous(labels = comma) +
    coord_flip()

# compare with geom_pointrange
ggplot() +
    geom_pointrange(
        data = d,
        aes(x = area, y = (lower + upper) / 2, ymin = lower, ymax = upper)
    )

# reorder
ggplot() +
    geom_pointrange(
        data = d,
        aes(x = reorder(area, upper), y = (lower + upper) / 2, ymin = lower, ymax = upper)
    )

# change point shape and fill color
ggplot() +
    geom_pointrange(
        data = d,
        aes(x = reorder(area, upper), y = (lower + upper) / 2, ymin = lower, ymax = upper),
        shape=22,
        fill="limegreen",
        color="purple"
    )



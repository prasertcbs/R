# perceptual map with ggplot2

install.packages("ggplot2")
library(ggplot2)

## perceptual map ----
n <- 10
set.seed(70)
d <- data.frame(
    brand   = LETTERS[1:n],
    price   = sample(-10:10, n, replace = T),
    quality = sample(-10:10, n, replace = T),
    outlet  = sample(5:20, n, replace = T)
)
View(d)

# plain scatter plot
ggplot(d, aes(x = price, y = quality)) +
    geom_point()

ggplot(d, aes(x = price, y = quality)) +
    geom_point() +
    geom_text(aes(label = brand), size=2.5, vjust=-2)

ggplot(d, aes(x = price, y = quality)) +
    geom_point(size=5, color="orange") +
    geom_text(aes(label = brand), size=2.5, vjust=-2) +
    xlim(-10, 10) +
    ylim(-10, 10) +
    geom_vline(xintercept = 0, color = "tan", linetype = "dashed") +
    geom_hline(yintercept = 0, color = "tan", linetype = "dashed") +
    ggtitle("Brand positioning") +
    theme_bw() +
    theme(
        panel.grid=element_blank(),
        axis.text =element_blank(),
        axis.ticks=element_blank()
    )


# add point size and text label
ggplot(d, aes(x = price, y = quality)) +
    geom_point(aes(size = outlet, color = brand), alpha = .5) +
    geom_text(aes(label = brand), size=2.5)

# set scale_size_area of each point with max_size = 10
ggplot(d, aes(x = price, y = quality)) +
    geom_point(aes(size = outlet, color = brand), alpha = .5) +
    scale_size_area(max_size=15) +
    geom_text(aes(label = brand), size=2.5)

# customize label = sprintf("%s-%d", brand, outlet)
ggplot(d, aes(x = price, y = quality)) +
    geom_point(aes(size = outlet, color = brand), alpha = .5) +
    scale_size_area(max_size=15) +
    # geom_text(aes(label = brand), size=2.5) +
    # try label = sprintf("%s-%d", brand, outlet) in geom_text
    geom_text(aes(label = sprintf("%s-%d", brand, outlet)), size=2.5)

# set xlim and ylim, draw vline and hline, customize theme
ggplot(d, aes(x = price, y = quality)) +
    geom_point(aes(size = outlet, color = brand), alpha = .5) +
    scale_size_area(max_size=15) +
    geom_text(aes(label = brand), size=2.5) +
    # try label = sprintf("%s-%d", brand, outlet) in geom_text
    #geom_text(aes(label = sprintf("%s-%d", brand, outlet)), size=2.5) +
    xlim(-10, 10) +
    ylim(-10, 10) +
    geom_vline(xintercept = 0, color = "tan", linetype = "dashed") +
    geom_hline(yintercept = 0, color = "tan", linetype = "dashed") +
    ggtitle("Brand positioning") +
    theme_bw() +
    theme(
        panel.grid=element_blank(),
        axis.text =element_blank(),
        axis.ticks=element_blank()
    ) +
    theme(legend.position="none")

# geom_rect (azure, seashell, honeydew, ivory)
ggplot(d, aes(x = price, y = quality)) +
    geom_rect(xmin=0, xmax=Inf,
              ymin=0,
              ymax=Inf,
              fill="ivory") +
    geom_rect(xmin=0, xmax=-Inf,
              ymin=0,
              ymax=-Inf,
              fill="honeydew") +
    geom_point(aes(size = outlet, color = brand), alpha = .5) +
    scale_size_area(max_size=15) +
    geom_text(aes(label = brand), size=2.5) +
    # try label = sprintf("%s-%d", brand, outlet) in geom_text
    #geom_text(aes(label = sprintf("%s-%d", brand, outlet)), size=2.5) +
    xlim(-10, 10) +
    ylim(-10, 10) +
    geom_vline(xintercept = 0, color = "tan", linetype = "dashed") +
    geom_hline(yintercept = 0, color = "tan", linetype = "dashed") +
    ggtitle("Brand positioning") +
    theme_bw() +
    theme(
        panel.grid=element_blank(),
        axis.text =element_blank(),
        axis.ticks=element_blank()
    ) +
    theme(legend.position="none")

ggplot(d, aes(x = price, y = quality)) +
    geom_rect(xmin=-10, xmax=-5,
              ymin=-2.5,
              ymax=7.5,
              fill="honeydew") +
    geom_point(aes(size = outlet, color = brand), alpha = .5) +
    scale_size_area(max_size=15) +
    geom_text(aes(label = brand), size=2.5) +
    # try label = sprintf("%s-%d", brand, outlet) in geom_text
    #geom_text(aes(label = sprintf("%s-%d", brand, outlet)), size=2.5) +
    xlim(-10, 10) +
    ylim(-10, 10) +
    geom_vline(xintercept = 0, color = "tan", linetype = "dashed") +
    geom_hline(yintercept = 0, color = "tan", linetype = "dashed") +
    ggtitle("Brand positioning") +
    theme_bw() +
    theme(
        panel.grid=element_blank(),
        axis.text =element_blank(),
        axis.ticks=element_blank()
    ) +
    theme(legend.position="none")
### Quality control chart
install.packages("ggplot2")
library(ggplot2)

case <- seq(1,100)
v <- rnorm(100, mean=10,sd=2.5)
d <- data.frame(case, v)
View(d)

ggplot(d, aes(x=case, y=v)) + geom_line()

xsd <- 2 * sd(d$v)
lcl <- mean(d$v) - xsd
ucl <- mean(d$v) + xsd

# add 3 horizontal lines (ucl, mean, lcl)
ggplot(d, aes(case, v)) +
    geom_line(color="grey30") +
    geom_hline(yintercept = mean(d$v), color="green", linetype="solid") +
    geom_hline(yintercept = ucl, color="blue", linetype="dashed") +
    geom_hline(yintercept = lcl, color="red", linetype="dashed") +
    theme_bw()

# add geom_point
ggplot(d, aes(case, v)) +
    geom_line(color="grey30") +
    geom_point(color="orange") +
    geom_hline(yintercept = mean(d$v), color="green", linetype="solid") +
    geom_hline(yintercept = ucl, color="blue", linetype="dashed") +
    geom_hline(yintercept = lcl, color="red", linetype="dashed") +
    theme_bw()

# add ribbon/band (lowest layer)
ggplot(d, aes(case, v)) +
    geom_ribbon(aes(ymin=lcl, ymax=ucl), fill = "grey97") +
    geom_line(color="grey30") +
    geom_point(color="grey30") +
    geom_hline(yintercept = mean(d$v), color="green", linetype="solid") +
    geom_hline(yintercept = ucl, color="blue", linetype="dashed") +
    geom_hline(yintercept = lcl, color="red", linetype="dashed") +
    theme_bw()

ggplot(d, aes(case, v)) +
    geom_line(color="grey30") +
    geom_point(color="grey30") +
    geom_hline(yintercept = mean(d$v), color="green", linetype="solid") +
    geom_hline(yintercept = ucl, color="blue", linetype="dashed") +
    geom_hline(yintercept = lcl, color="red", linetype="dashed") +
    geom_ribbon(aes(ymin=lcl, ymax=ucl), fill = "grey97", alpha=.4) +
    theme_bw()

# use geom_point instead of geom_line
ggplot(d, aes(case, v)) +
    geom_ribbon(aes(ymin=lcl, ymax=ucl), fill = "grey97") +
    geom_point(color="grey30") +
    geom_hline(yintercept = mean(d$v), color="green", linetype="solid") +
    geom_hline(yintercept = ucl, color="blue", linetype="dashed") +
    geom_hline(yintercept = lcl, color="red", linetype="dashed") +
    theme_bw()

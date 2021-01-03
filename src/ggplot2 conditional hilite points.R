### conditional hilite points

# install.packages("ggplot2")
library(ggplot2)

set.seed(46)
d <- data.frame(obs=1:100,
                score=as.integer(rnorm(100,mean=70,sd=10)))

ggplot(d, aes(obs, score)) +
    geom_point()

### create color group
d$hilite <- with(d, ifelse(score > mean(score) + 2 * sd(score), T, F))

ggplot(d, aes(obs, score, color=hilite)) +
    geom_point()

### remove legend
ggplot(d, aes(obs, score, color=hilite)) +
    geom_point() +
    theme_bw() +
    theme(legend.position="none")

### use cut() to separate score into multiple groups
d$grade <- cut(d$score, c(0, 50, 60, 75, 85, Inf))

ggplot(d, aes(obs, score, color=grade)) +
    geom_point()

d$grade <- cut(d$score, c(-Inf,
                          mean(d$score) - 2 * sd(d$score),
                          mean(d$score) - .7 * sd(d$score),
                          mean(d$score) + .7 * sd(d$score),
                          mean(d$score) + 2 * sd(d$score),
                          Inf))
ggplot(d, aes(obs, score, color=grade)) +
    geom_point()

### use cut() with labels=F
d$grade2 <- cut(d$score, c(-Inf,
                          mean(d$score) - 2 * sd(d$score),
                          mean(d$score) - .7 * sd(d$score),
                          mean(d$score) + .7 * sd(d$score),
                          mean(d$score) + 2 * sd(d$score),
                          Inf), labels=F)
View(d)
ggplot(d, aes(obs, score, color=grade2)) +
    geom_point()

### use cut() with custom labels
d$grade3 <- cut(d$score, c(-Inf,
                          mean(d$score) - 2 * sd(d$score),
                          mean(d$score) - .7 * sd(d$score),
                          mean(d$score) + .7 * sd(d$score),
                          mean(d$score) + 2 * sd(d$score),
                          Inf),
                       labels=c("F","D","C","B","A"))
View(d)

ggplot(d, aes(obs, score, color=grade3)) +
    geom_point() +
    theme_bw()

### create factor with custom levels
d$grade4 <- factor(cut(d$score, c(-Inf,
                          mean(d$score) - 2 * sd(d$score),
                          mean(d$score) - .7 * sd(d$score),
                          mean(d$score) + .7 * sd(d$score),
                          mean(d$score) + 2 * sd(d$score),
                          Inf),
                       labels=c("F","D","C","B","A")),
                   levels=c("A","B","C","D","F"))
View(d)

### legends are reordered by factor levels
ggplot(d, aes(obs, score, color=grade4)) +
    geom_point() +
    theme_bw()

### add shapes and size
ggplot(d, aes(obs, score, color=grade4, shape=grade4)) +
    geom_point(size = 2) +
    theme_bw() +
    theme(legend.key = element_blank()) # remove border around legend

# create histogram (count) + density
library(ggplot2)

# create test data ----
set.seed(1)
d <- data.frame(
    subject=factor(rep(c("math", "eng", "sci"), each=200)),
    score=as.integer(c(rnorm(200, mean=80, sd=5),
                       rnorm(200, mean=45, sd=8),
                       rnorm(200, mean=65, sd=5)))
)
View(d)

# basic histogram ----
ggplot(d, aes(x=score)) +
    geom_histogram(color="black", fill="white") +
    theme_bw()

# use ..count.. special variable
ggplot(d, aes(x=score)) +
    geom_histogram(aes(y=..count..), color="black", fill="lightgreen") +
    theme_bw()

# Histogram with density plot ----
# use special variable ..density..
ggplot(d, aes(x=score)) +
    geom_histogram(aes(y=..density..), color="black", fill="white") +
    geom_density(alpha=.2, fill="tan") +
    theme_bw()

# fill/separate histogram by subject ----
# default gemo_histogarm(position="stack")
ggplot(d, aes(x=score, color=subject, fill=subject)) +
    geom_histogram(aes(y=..density..), alpha=0.5)+
    geom_density(alpha=.3) +
    theme_bw()

# set position="identity"
ggplot(d, aes(x=score, color=subject, fill=subject)) +
    geom_histogram(aes(y=..density..), alpha=0.5,
                   position="identity")+
    geom_density(alpha=.3) +
    theme_bw()


# add facet ----
ggplot(d, aes(x=score, color=subject, fill=subject)) +
    geom_histogram(aes(y=..density..), alpha=0.5,
                   position="identity")+
    geom_density(alpha=.3) +
    facet_grid(subject~.) + # try facet_grid(.~subject)
    theme_bw()
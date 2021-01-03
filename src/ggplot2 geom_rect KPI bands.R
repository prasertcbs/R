### use geom_rect() to create dynamic bands

### simple geom_rect
set.seed(33)
d <- data.frame(t=2000:2016,
                sales=as.integer(rnorm(17, mean=70, sd=20)))

ggplot(d, aes(t, sales)) +
    geom_bar(stat="identity")

# another way to create bar
ggplot() +
    geom_bar(data=d, aes(x=t, y=sales), stat="identity")

ggplot(d, aes(x=t,y=sales)) +
    geom_rect(xmin=-Inf, xmax=Inf,
              ymin=75,
              ymax=Inf,
              fill="limegreen") +
    geom_bar(stat="identity")

ggplot(d, aes(x=t,y=sales)) +
    geom_rect(xmin=-Inf, xmax=Inf,
              ymin=-Inf,
              ymax=50,
              fill="pink") +
    geom_rect(xmin=-Inf, xmax=Inf,
              ymin=50,
              ymax=75,
              fill="yellow") +
    geom_rect(xmin=-Inf, xmax=Inf,
              ymin=75,
              ymax=Inf,
              fill="limegreen") +
    geom_bar(stat="identity")
    # geom_line()


##########################
### x-axis as a factor/discrete/categorical variable
set.seed(77)
d <- data.frame(t=factor(month.abb, levels=month.abb),
                sales=as.integer(rnorm(12, mean=70, sd=20)))
View(d)

ggplot(d, aes(x=t,y=sales, group=1)) +
    geom_line()

ggplot(d, aes(x=t,y=sales, group=1)) +
    geom_rect(xmin=-Inf, xmax=Inf,
              ymin=-Inf,
              ymax=50,
              fill="pink") +
    geom_rect(xmin=-Inf, xmax=Inf,
              ymin=50,
              ymax=80,
              fill="yellow") +
    geom_rect(xmin=-Inf, xmax=Inf,
              ymin=80,
              ymax=Inf,
              fill="limegreen") +
    geom_line()


### use data.frame as geom_rect data source
set.seed(22)
d <- data.frame(obs=1:100, score=as.integer(rnorm(100, mean=35, sd=30)))

band <- data.frame(g=LETTERS[1:5],
                   min.y=c(-Inf, 0,20,50,80),
                   max.y=c(   0,20,50,80,Inf)
                   )

min.y <- c(-Inf,0,20,50,80,100)
max.y <- c(min.y[-1], Inf)
band <- data.frame(g=LETTERS[1:6], min.y, max.y)
View(band)

ggplot(d, aes(x=obs, y=score)) +
    geom_line()

# another way to plot simple line
ggplot() +
    geom_line(data=d, aes(x=obs, y=score))

### set geom_rect as a bottom layer
ggplot() +
    geom_rect(data=band,
              aes(xmin=-Inf, xmax=Inf,
                  ymin=min.y, ymax=max.y, fill=g),
              alpha=.5) +
    geom_line(data=d, aes(x=obs, y=score)) +
    theme(legend.position="none")

### geom_point
ggplot() +
    geom_rect(data=band,
              aes(xmin=-Inf, xmax=Inf,
                  ymin=min.y, ymax=max.y, fill=g),
              alpha=.5) +
    geom_point(data=d, aes(x=obs, y=score)) +
    theme(legend.position="none")
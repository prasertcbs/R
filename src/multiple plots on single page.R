# multiple plots on a single page ----

x <- seq(-4,4,len=100)
y <- dnorm(x) # density
plot(x,y)
plot(x,y,type="l", col="red")
plot(x,y,type="h", col="lightgreen")
hist(sample(1:50,100,replace=T),col=sample(colors(),1))
pie(sample(1:50,4,replace=T),col=sample(colors(),4),clockwise = T)
barplot(sample(10:15,5),col = colors(),horiz = T)



# fill plots by row->column ----
g.par <- par(mfrow=c(3,2))
    x <- seq(-4,4,len=100)
    y <- dnorm(x) # density
    plot(x,y)
    plot(x,y,type="l", col="red")
    plot(x,y,type="h", col="lightgreen")
    hist(sample(1:50,100,replace=T),col=sample(colors(),1))
    pie(sample(1:50,4,replace=T),col=sample(colors(),4),clockwise = T)
    barplot(sample(10:15,5),col = colors(),horiz = T)
par(g.par)

# fill plots by column->row ----
g.par <- par(mfcol=c(2,4))
    x <- seq(-4,4,len=100)
    y <- dnorm(x) # density
    plot(x,y)
    plot(x,y,type="l", col="red")
    plot(x,y,type="h", col="lightgreen")
    hist(sample(1:50,100,replace=T),col=sample(colors(),1))
    pie(sample(1:50,4,replace=T),col=sample(colors(),4),clockwise = T)
    barplot(sample(10:15,5),col = colors(),horiz = T)
par(g.par)


# tip: use loop to plot multiple charts ----
g.par <- par(mfrow=c(2,2))
    height.mean <- 170
    height.sd <- 6
    for (n in c(50,100,1000,10000)) {
        s <- rnorm(n, mean=height.mean, sd=height.sd)
        s.mean <- mean(s)
        s.sd <- sd(s)
        hist(s, breaks=50, main=sprintf("n=%d",n),col=sample(colors(),1))
    }
par(g.par)

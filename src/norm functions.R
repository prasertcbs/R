# normal distribution functions ----

# dnorm (height of the probability density function)
# pnorm (cumulative density function)
# qnorm (inverse cumulative density function)
# rnorm (generate random numbers)

# plot standard normal distribution curve
x <- seq(-4,4,len=100)
y <- dnorm(x) # density
plot(x,y)
plot(x,y,type="l")

# add single vertical line
abline(v=0,col="red") # add single line

# add multiple vertical lines
abline(v=c(seq(-3,3,by=1)),col=10:20)

# different means, same sd
x  <- seq(-4,8,len=100)
y1 <- dnorm(x)
y2 <- dnorm(x,mean=2,sd=1)
y3 <- dnorm(x,mean=1,sd=2)
plot(x,y1,type="l",col="blue")
abline(v=0,col="blue")
points(x,y2,type="l",col="red")
abline(v=2,col="red")
points(x,y3,type="l",col="green")
abline(v=1,col="green")

# area under curve ----
x <- seq(-4,4,len=100)
y <- dnorm(x) # density
x2 <- seq(-4,1.96,len=100)
#x2 <- seq(-4,0,len=200)
#x2 <- seq(qnorm(.025),qnorm(.975),len=100)
y2 <- dnorm(x2)
plot(x,y,type="l")
points(x2,y2,type="h",lwd=4,col="tan1")

pnorm(1.96)
pnorm(0)
# pnorm vs qnorm ----
z <- -1.96
x <- seq(-4,4,len=100)
y <- dnorm(x) # density
pnorm(z) # distribution function
plot(x,y,type="l")
x2 <- seq(-4,z,len=200)
y2 <- dnorm(x2)
points(x2,y2,type="h",lwd=2,col="tan1")

pnorm(0)
qnorm(.5) # quantile function: inverse of pnorm

pnorm(-1.96)
qnorm(pnorm(-1.96))

p <- pnorm(1.96)
p.upper <- pnorm(1.96,lower.tail = F)

q <- qnorm(p)
q.upper <- qnorm(p,lower.tail = F)

# lower.tail = F
z <- 1.96
pnorm(z,lower.tail = F) # distribution function
plot(x,y,type="l")
x2 <- seq(z,4,len=200)
y2 <- dnorm(x2)
points(x2,y2,type="h",lwd=2,col="tan1")


# rnorm, mean = 0, sd = 1 ----
n <- 100000
s <- rnorm(n)
s.mean <- mean(s)
s.sd <- sd(s)
hist(s)

# rnorm, mean = ?, sd = ? ----
n <- 10000
height.mean <- 170
height.sd <- 6
s <- rnorm(n, mean=height.mean, sd=height.sd)
s.mean <- mean(s)
s.sd <- sd(s)
hist(s)
hist(s, breaks=50, main=sprintf("n=%d",n))

#g.par <- par(mfrow=c(1,4))
g.par <- par(mfrow=c(2,2))
height.mean <- 170
height.sd <- 6
for (n in c(50,100,1000,100000)) {
    s <- rnorm(n, mean=height.mean, sd=height.sd)
    s.mean <- mean(s)
    s.sd <- sd(s)
    hist(s, breaks=50, main=sprintf("n=%d",n))
}
par(g.par)

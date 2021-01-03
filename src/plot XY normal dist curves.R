# plot xy
a <- seq(-3,3,length.out = 100)
a
b <- dnorm(a)
b
plot(a,b)
plot(a,b,type="l")
plot(a,b,type="l",col="red")
plot(a,b,type="h",col="red")
plot(a,b,type="l",col="red")
c <- pnorm(a)
plot(a,c)
plot(a,b,type="l",col="red")
lines(a,c,col="green")
plot(a,b,type="l",col="red",ylim=c(0,1))
lines(a,c,col="green")
x1 <- seq(40,100,length.out = 100)
x1
y1 <- dnorm(x1,mean=70,sd=8)
plot(x1,y1,col="red")
plot(x1,y1,col="red",type="l")
y2 <- dnorm(x1,mean=70,sd=4)
lines(x1,y2,col="green")
max(y2)
plot(x1,y1,col="red",type="l",ylim=c(0,.1))
lines(x1,y2,col="green")
y3 <- dnorm(x1,mean=60,sd=4)

lines(x1,y3,col="blue")

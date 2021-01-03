# create normal distribution curve
a <- seq(-3,3,length.out = 100) # create number sequence from -3 to 3
b <- dnorm(a) 
plot(a,b)
plot(a,b,type="l",main="Probability density function")

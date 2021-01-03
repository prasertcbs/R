View(mtcars)
plot(mtcars$hp, mtcars$mpg)
with(mtcars, plot(hp, mpg))

attach(mtcars)
plot(hp,mpg, col="red")

?mtcars
a <- subset(mtcars, am==0)
a
m <- subset(mtcars, am==1)
m

with(a, plot(hp,mpg,col="red"))
with(m, points(hp,mpg,col="blue"))

max(mtcars$hp)
max(mtcars$mpg)
with(a, plot(hp,mpg,col="red",xlim=c(0,340), ylim=c(0,35)))
with(m, points(hp,mpg,col="blue"))

detach(mtcars)

x <- 2011:2016
y <- sample(50:100,6)
plot(x,y) # "point"
plot(x,y, type="l")
plot(x,y, type="b") # both
plot(x,y, type="h") # 
plot(x,y, type="s") # step chart 

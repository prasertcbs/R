x <- 1:6
x
sample(x,1)
sample(x,1)

sample(x,2)

sample(x,6)

sample(x)

sample(x,50)
sample(x,50,replace=T)

p <- c(rep(.1,5),.5)
p
sample(x,10)
sample(x,10,replace=T)
x
x
sample(x,10,replace=T)
sample(x,10,replace=T,prob=p)

b <- c("A","B","O","AB")
bp <- c(.4,.11,.45,.04)
sample(b,10,replace=T,prob=bp)

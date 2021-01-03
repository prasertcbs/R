d <- data.frame(
  q1=sample(1:7,10,replace = T),
  q2=sample(1:7,10,replace = T),
  q3=sample(1:7,10,replace = T),
  q4=sample(1:7,10,replace = T)
)
View(d)
# 1 2 3 4 5 6 7
# 7 6 5 4 3 2 1

d$q4r <- 8 - d$q4
View(d)

d$q1 <- 8 - d$q1
View(d)

#rev.col <- c("q1", "q3")
rev.col <- 2:4
d[,rev.col] <- 8 - d[,rev.col]
View(d)

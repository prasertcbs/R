library(ggplot2)

# pet lovers
gender <- factor(c(rep("F", 40),rep("M", 60))) # owner gender
income <- as.integer(rnorm(100, mean=30000,sd=5000)) # owner monthly income
pet <- factor(sample(c("dog","cat","bird","fish"),10000,prob = c(50,25,15,10),replace = T))
count <- sample(1:4,100,replace=T) # number of pets
d <- data.frame(gender,income,pet,count)
View(d)

hist(d$income)
ggplot(d, aes(income)) + geom_histogram()
ggplot(d, aes(income)) + geom_histogram(binwidth = 2500)
ggplot(d, aes(income)) + geom_histogram(binwidth = 2500, fill="green", color="black") + ggtitle("Income distribution")
ggplot(d, aes(income)) + geom_histogram(breaks=c(0,20000,25000,35000,Inf), fill="white", color="black")

g <- ggplot(d, aes(income)) + geom_histogram(binwidth = 2500, fill="white", color="black")
g
g + ggtitle("Income distribution") + ylab("frequency") + xlab("monthly income") +
  geom_vline(aes(xintercept=mean(income)), color="red", linetype="dashed", size=2)

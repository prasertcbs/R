library(reshape2)
library(ggplot2)
View(USArrests)
str(USArrests)
write.csv(USArrests, file="test.csv")
x <- read.csv(file="test.csv")

d <- cbind(State = rownames(USArrests), USArrests)
rownames(d) <- NULL

u <- melt(USArrests, id="UrbanPop")
View(u)

d1 <- melt(d, id=c("State", "UrbanPop"))
View(d1)

d1 <- melt(d, id=c("State", "UrbanPop"), variable.name = "crime", value.name = "arrest")
View(d1)
# wide format

# long format
ggplot(d1, aes(crime, arrest)) + geom_bar(stat="identity")

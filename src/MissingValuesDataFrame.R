# handle missing values in data frame

# create test data
d <- data.frame(student=c("Ben","Jena","Jay","Lek","Bruce"),
                gender=c("M","F","F",NA,"M"),
                score1=c(10,20,NA,40,50),
                score2=c(25,NA,10,20,17),
                score3=c(6,4,-99,5,7))
d

write.csv(d, file="demoNA.csv", row.names = F)
d <- read.csv(file="demoNA.csv")

e <- na.omit(d)
e

d1 <- d[complete.cases(d),]
d1

d1 <- d[!complete.cases(d),]
d1

d2 <- d[complete.cases(d[,c("score1","score2","score3")]),]
d2

d3 <- d[complete.cases(d[,3:5]),]
d3

which(is.na(d$score1))
d$score1[which(is.na(d$score1))] <- mean(d$score1, na.rm=T)
d

d$score3[d$score3 == -99] <- NA
d

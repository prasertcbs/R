install.packages("reshape2")
library("reshape2")

d <- data.frame(
  student=c("Jack","Ann","Peter","Lily","Mike"),
  math=c(79,55,86,70,60),
  english=c(59,82,90,80,70),
  sci=c(75,80,60,90,50))

View(d)

du <- melt(d, id=c("student"))
du
View(du)
str(du)

# add a school factor
d$school = factor(c("A","A","A","B","B"))
du2 <- melt(d, id=c("school","student"))
du2
str(du2)

#rename columns
names(du2)[names(du2)=="variable"] <- "subject"
names(du2)[names(du2)=="value"] <- "score"

View(du2)
du2 <- du2[order(du2$school, du2$subject),]
du2

a1 <- aggregate(score~school,du2,mean)
a1

a2 <- aggregate(score~school+subject,du2,mean)
a2

a3 <- aggregate(score~school+subject,du2,sum)
a3
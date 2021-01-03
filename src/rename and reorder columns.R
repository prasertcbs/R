# create test data
d <- data.frame(student=c("Ben","Jena","Jay","Lek","Bruce"),
                gender=c("M","F","F",NA,"M"),
                score1=c(10,20,NA,40,50),
                score2=c(25,NA,10,20,17),
                score3=c(6,4,8,5,7))
d

# แสดงชื่อคอลัมน์ใน data frame
names(d)
names(d) == "score1"

names(d)[names(d) == "score1"] <- "math"
d

names(d)[names(d) == "score2"] <- "science"
names(d)[names(d) == "score3"] <- "english"
d

# reorder columns position
d <- d[c(1,3,5,4,2)]
d

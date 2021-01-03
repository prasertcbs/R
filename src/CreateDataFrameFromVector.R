names <- c("Leo", "Ben","Jenny","Tiger","Nicole")
genders <- c("M","M","F","M","F")
weights <- c(62, 70, 55, 48, 70)
df <- data.frame(name=names,gender=genders,weight=weights)
df
summary(df)
df$height <- c(170,175,160,155,168)
df
df$bmi <- df$weight /(df$height/100)^2
df
View(df)
df$name <- NULL
df$name <- names
df1 <- df[order(df$height)]
View(df1)
df1 <- df[order(df$height),]
View(df1)
df2 <- df[order(df$height, decreasing = T),]
View(df2)
filtered <- df[df$gender=="M",]
View(filtered)
filtered2 <- df[df$gender=="M", c("name", "height")]
View(filtered2)
filtered2 <- df[df$gender=="M" & df$height>160, c("name", "height")]
filtered3 <- df[df$bmi < 20 | df$bmi > 24, c("name", "height", "bmi")]
View(filtered3)
write.csv(df,file="demo1.csv",row.names = F)
rm(df)
df
df9<-read.csv(file="demo1.csv")
df9

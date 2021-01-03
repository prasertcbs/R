# Factor

# read a data frame
d <- read.csv(file = "sales.csv", stringsAsFactors = F)
str(d)
View(d)
hist(d$age)

hist(d$menu)
# แปลง menu ให้เป็น factor
d$menu.F <- factor(d$menu)
levels(d$menu.F)
head(d$menu.F)
as.numeric(d$menu.F)
head(d$menu.F)
head(as.numeric(d$menu.F))

plot(d$menu.F)

d$size.F <- factor(d$size)
levels(d$size.F)
plot(d$size.F)
d$size.F2 <- factor(d$size, levels = c("S","M","L","XL"))
levels(d$size.F2)
View(d)
plot(d$size.F2)

plot(d$weekday) # !!error!!
plot(factor(d$weekday))
d$weekday.F <- factor(d$weekday, levels = c("Sun","Mon","Tue","Wed","Thu","Fri","Sat"))
plot(d$weekday.F)

head(d$weekday.F)
head(as.numeric(d$weekday.F))

d$gender.F <- factor(d$gender, labels = c("female","male"))
hist(d$age)
d$age.group <- cut(
  d$age, breaks = c(0,13,19,25,60,Inf),
  labels = c("kid","teenager","young adult","adult","senior")
)
d$age.group
levels(d$age.group)
plot(d$age.group)

# how to refer to factor levels
d1 <- subset(d, age.group == "teenager" | age.group == "young adult")
View(d1)


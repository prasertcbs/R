# cut (covert numerical values to categories)

score <- as.integer(rnorm(50, mean=70, sd=10))
barplot(score)
hist(score)
grade <- cut(score,c(0,50,60,75,85,Inf))
grade
# (0,50] 0 < score <= 50
# (50,60] 50 < score <= 60
score
barplot(table(grade))
grade.letter <- cut(score,c(0,50,60,75,85,Inf), labels = c("F","D","C","B","A"))
d <- data.frame(score, grade, grade.letter)
View(d)
barplot(table(d$grade.letter))
barplot(rev(table(d$grade.letter)))

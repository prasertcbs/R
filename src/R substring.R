# demo: substr, nchar (using mpg data from ggplot2)

install.packages("ggplot2")
library(ggplot2)
?mpg
View(mpg)

substr("manual",2,3)

d <- mpg
d$trans.type <- substr(mpg$trans,1,1)
d$trans.type1 <- factor(substr(mpg$trans,1,1), labels = c("auto", "manual"))
View(d)
ggplot(d, aes(trans.type1, cty)) + geom_boxplot()
t.test(cty ~ trans.type1, data = d)

nchar("abcde")
d$trans.gear <- substr(mpg$trans, nchar(mpg$trans) - 1, nchar(mpg$trans) - 1)
View(d)
ggplot(d, aes(trans.type1, cty, fill=trans.gear)) + geom_boxplot() + facet_wrap(~trans.gear)

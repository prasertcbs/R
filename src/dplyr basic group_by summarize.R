# install.packages("dplyr")
library(dplyr)

View(mtcars)
aggregate(mpg~am,mtcars,mean)

mtcars %>%
    group_by(am) %>%
    summarize(mean(mpg)) # use default names

mtcars$am <- factor(mtcars$am,labels=c("auto","manual"))

aggregate(cbind(mpg,hp,wt)~am,mtcars,mean)

mtcars %>%
    group_by(am) %>%
    summarize(mean(mpg), mean(hp), mean(wt)) # use default names

aggregate(cbind(mpg,hp,wt)~am+gear,mtcars,mean)

mtcars %>%
    group_by(am,gear) %>%
    summarize(mean.mpg=mean(mpg), mean.hp=mean(hp), mean.wt=mean(wt))


mtcars %>%
    group_by(am) %>%
    summarize(mean.mpg=mean(mpg), mean.hp=mean(hp),
              sd.mpg=sd(mpg), sd.hp=sd(hp))

mtcars %>%
    group_by(am) %>%
    summarize(mean.mpg=mean(mpg), mean.hp=mean(hp),
              sd.mpg=sd(mpg), sd.hp=sd(hp))

mtcars %>%
    group_by(am) %>%
    summarize_each(funs(mean,sd,min,max), mpg, hp)

mtcars %>%
    group_by(am,gear) %>%
    summarize_each(funs(mean,sd,min,max), mpg, hp)

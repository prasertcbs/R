# descriptive statistics

View(mtcars)

#### simple summary ####
summary(mtcars)
columns <- c("mpg","hp","disp")
s <- summary(mtcars[columns])
s

#### summarized data by group ####
# mean, group by ...
with(mtcars,
     aggregate(mtcars[columns],
               by=list(am),
               mean))

with(mtcars,
     aggregate(mtcars[columns],
               by=list(trans=am),
               mean))

with(mtcars,
     aggregate(mtcars[columns],
               by=list(trans=am, gear=gear),
               mean))

with(mtcars,
     aggregate(mtcars[columns],
               by=list(trans=factor(am, labels=c("auto","manual")),
                       gear=gear),
               mean))

# sd
with(mtcars,
     aggregate(mtcars[columns],
               by=list(trans=factor(am, labels=c("auto","manual"))),
               sd))

#### aggregate using formula style ####
aggregate(mpg~am,mtcars,mean)
aggregate(cbind(mpg,hp,wt)~am,mtcars,mean)
a <- aggregate(cbind(mpg,hp,wt)~am,mtcars,mean)
a
b <- aggregate(cbind(mpg,hp,wt)~am+gear,mtcars,mean)
b

#### use dplyr package ####
library(dplyr)

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

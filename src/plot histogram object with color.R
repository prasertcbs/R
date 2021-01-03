# plot.histogram ----
# set bar color based on given conditions
set.seed(1) # for reproducible result
score <- rnorm(200, mean = 75, sd = 6)
hist(score, breaks =25)
h <- hist(score, breaks = 25, plot = F) # note! save histogram object instead of plotting
h # show h object
h$breaks

?plot.histogram

plot(h,
     col = ifelse(h$breaks >= 85, "blue", "white"))

# hilite bar with highest freq ---
plot(h,
     labels=T, # show freq as data label
     ylim=c(0,max(h$counts)*1.1),
     col=ifelse(h$counts == max(h$counts), "red", "white"))

# color by score
# plot(hist)

# example 1: normal distribution curve ----
x <- rnorm(200)
h <- hist(x, breaks = 50, plot = F)
h
class(h)
qnorm(.95)
plot(h$counts, col = ifelse(abs(h$breaks) > 1.645, "red", "lightblue"))

?plot.histogram
plot(h, col = ifelse(abs(h$breaks) > 1.645, "red", "lightblue"))
plot(h,
     labels = T, # show freq on top of each bar
     ylim=c(0,max(h$counts)*1.1),
     col =
         ifelse(abs(h$breaks) > 1.645, "red",
                ifelse(abs(h$breaks) > 1, "lightblue", "yellow")))

# plot.histogram varying by grade score ----
# set bar color based on given conditions
set.seed(1) # for reproducible result
score <- rnorm(200, mean = 75, sd = 6)
h <- hist(score, breaks = 25, plot = F) # note! save histogram object instead of plotting
h # show h object
h$breaks

?plot.histogram

plot(h,
     col = ifelse(h$breaks > 85, "blue", "white"))

# hilite bar with highest freq ---
plot(h,
     labels=T, # show freq as data label
     ylim=c(0,max(h$counts)*1.1),
     col=ifelse(h$counts == max(h$counts), "red", "white"))

# color by score
score.mean=mean(score)
score.sd=sd(score)
score.A <- qnorm(.9,mean=score.mean,sd=score.sd) # top 10% -> A
score.A
score.B <- qnorm(.7,mean=score.mean,sd=score.sd)
score.B
score.C <- qnorm(.05,mean=score.mean,sd=score.sd)
score.C

plot(h,
     labels=T,
     ylim=c(0,max(h$counts)*1.1),
     col = ifelse(h$breaks >= score.A, "blue",
                  ifelse(h$breaks >= score.B,"lightgreen",
                         ifelse(h$breaks >= score.C,"orange",
                                ifelse(h$breaks < score.C, "yellow","white")))))

# simplify a bit
plot(h,
     labels=T,
     ylim=c(0,max(h$counts)*1.1),
     col = ifelse(h$breaks >= score.A, "blue",
                  ifelse(h$breaks >= score.B,"lightgreen",
                         ifelse(h$breaks >= score.C,"orange",
                                ifelse(h$breaks < score.C, "yellow","white")))))

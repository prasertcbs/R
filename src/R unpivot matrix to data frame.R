# install.packages(reshape2)
library(reshape2)

# unpivot matrix to create a data frame

View(WorldPhones)
class(WorldPhones)
typeof(WorldPhones)

w.t <- melt(WorldPhones)
View(w.t)
class(w.t)
colnames(w.t)
colnames(w.t) <- c("year","continent","phones")
View(w.t)

w.t2 <- melt(WorldPhones, value.name="phones")
View(w.t2)
names(w.t2)[names(w.t2) == "Var1"] <- "year"
names(w.t2)[names(w.t2) == "Var2"] <- "continent"
View(w.t2)

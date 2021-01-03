# serialize a single R object: saveRDS & readRDS
# compare rds to csv

library(ggplot2) # use mpg data from ggplot2

View(mpg)
str(mpg)
mpg$class <- factor(mpg$class)
mpg$drv <- factor(mpg$drv, label=c("4-wheel","front","rear"))
mpg$fl <- factor(mpg$fl)
mpg$transAM <- factor(substr(mpg$trans,1,1), label=c("auto","manual"))

write.csv(mpg, file="mpg.csv", row.names = F)
ds <- read.csv(file="mpg.csv", stringsAsFactors = F)
ds <- read.csv(file="mpg.csv", stringsAsFactors = T)
View(ds)
str(ds)

saveRDS(mpg, file="mpgF.rds")
d <- readRDS(file="mpgF.rds")
View(d)
str(d)

# compare save/readRDS() with save/load()
rData <- mpg
save(rData, file="mpg.Rda") # .Rdata
rm(rData)
load(file="mpg.Rda")

# create another vector object
x <- month.abb
y <- sample(1:100,10)

save(rData, x, y, file="demo.Rda") # save more than one object
rm(rData)
rm(x)
rm(y)
load(file="demo.Rda")

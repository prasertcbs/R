# row/column sum and mean in data frame ----

# create test data ----
set.seed(1)
d <- data.frame(
    respID=seq(1,20),
    gender=sample(rep(c("M","F"),10)),
    se1=sample(1:5,20,replace = T),
    se2=sample(1:5,20,replace = T),
    se3=sample(1:5,20,replace = T),
    se4=sample(1:5,20,replace = T),
    se5=sample(1:5,20,replace = T),
    se6=sample(1:5,20,replace = T),
    se7=sample(1:5,20,replace = T),
    tw1=sample(1:5,20,replace = T),
    tw2=sample(1:5,20,replace = T),
    tw3=sample(1:5,20,replace = T),
    tw4=sample(1:5,20,replace = T),
    tw5=sample(1:5,20,replace = T),
    se8=sample(1:5,20,replace = T),
    se9=sample(1:5,20,replace = T),
    se10=sample(1:5,20,replace = T),
    ase1=sample(1:5,20,replace = T),
    ase2=sample(1:5,20,replace = T),
    ase3=sample(1:5,20,replace = T)
)

View(d)


# row sum ----
d$tw.sum0 <- with(d, tw1+tw2+tw3+tw4+tw5)
names(d)
d$tw.sum1 <- rowSums(subset(d, select=10:14))
d$tw.sum2 <- rowSums(subset(d, select=tw1:tw5))

# row mean ----
d$tw.mean <- rowMeans(subset(d, select=tw1:tw5))

# nonconsecutive columns
names(d)
grep("\\bse\\d",names(d))
d$se.sum0 <- with(d, se1+se2+se3+se4+se5+se6+se7+se8+se9+se10)
d$se.sum1 <- rowSums(subset(d, select=c(se1:se7,se8:se10)))
d$se.sum2 <- rowSums(subset(d, select=grep("\\bse\\d",names(d))))

names(d)
g <- grep("se\\d",names(d))
names(d[g])
g <- grep("se\\d{1}\\b",names(d))
names(d[g])
g <- grep("se\\d{1,2}\\b",names(d))
names(d[g])
g <- grep("\\bse\\d",names(d))
names(d[g])
g <- grep("\\bse\\d\\b",names(d))
names(d[g])


# column sum ----
colSums(subset(d, select=c(se1:se7,se8:se10)))
colMeans(subset(d, select=c(se1:se7,se8:se10)))

summary(subset(d, select=c(se1:se7,se8:se10)))

# use apply() to calculate row mean ---
d$se.sum.apply <- apply(subset(d, select=c(se1:se7,se8:se10)),1,sum)
d$se.mean.apply <- apply(subset(d, select=c(se1:se7,se8:se10)),1,mean)
d$se.min.apply <- apply(subset(d, select=c(se1:se7,se8:se10)),1,min)
d$se.max.apply <- apply(subset(d, select=c(se1:se7,se8:se10)),1,max)

# use apply() to calcuate column mean ----
apply(subset(d, select=se1:se7),2,mean) # 2 = by column
apply(subset(d, select=se1:se7),2,sd) # 2 = by column


# understand missing values (NA)

a <- c("Ben","Jena","Jay","Lek","Bruce")
x <- c(10,20,NA,40,50)
mean(x)
is.na(x)
mean(x, na.rm=T)
sum(x, na.rm=t)
length(x)
which(!is.na(x))
length(which(!is.na(x)))
gender <- c("M","F","F",NA,"M")
is.na(gender)
which(is.na(gender))
y <- c(10,15,99,10,12,99)
y[y==99] <- NA
y
mux  <- mean(x,na.rm=T)
x[which(is.na(x))] = mux

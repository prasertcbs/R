# create date/time sequence ----
t <- seq(from=as.Date("2016-1-1"), to=as.Date("2016-1-31"), by=1)
t
t <- seq(from=as.Date("2016-1-1"), to=as.Date("2016-7-31"), by="1 weeks")
t
t <- seq(from=as.Date("2016-1-7"), by="1 months", len=12)
t
t <- seq(from=as.Date("2016-1-7"), by="3 months", len=12)
t
t <- seq(from=as.Date("2016-1-7"), by="1 quarters", len=12)
t
t <- seq(from=as.Date("2016-1-7"), by="1 weeks", len=5)
t
t <- seq(from=as.Date("2016-1-7"), by="5 years", len=5)
t

# time ----
t <- seq(from=as.POSIXct("2016-1-7 13:00:00"), by="1 hours", len=10)
t
t <- seq(from=as.POSIXct("2016-1-7 10:00:00"), by="15 mins", len=10)
t

### application: customer/car arrival time ----
n <- 500
t.open <- as.POSIXct("2016-1-7 10:00:00")
t.close <- as.POSIXct("2016-1-7 22:00:00")
sample(t.open:t.close,n,replace=T) # second from origin 1970-1-1
inTime <- as.POSIXct(sample(t.open:t.close,n,replace=T), origin="1970-1-1")
head(inTime)

t.break <- seq(
    from=t.open,
    to  =t.close,
    by="30 mins")
t.break

# create histogram ====
hist(inTime, breaks=t.break, freq=T)


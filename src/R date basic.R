# basic date

# create date
d <- as.Date("2016-2-14")
d
d1 <- as.Date("2016/2/15")
d1

# parse date
?strptime # see date formats
d2 <- as.Date("7/20/2014", format = "%m/%d/%Y")
d2

d3 <- as.Date("14-Feb-2016", format = "%d-%b-%Y")
d3

# get current date (no time)
currentDate <- Sys.Date()
currentDate

# add/subtract days
currentDate + 5
currentDate - 4

# date differences in days
bd <- as.Date("1995-7-20")
ageDay <- Sys.Date() - bd
ageDay

# date as number
n <- as.numeric(currentDate)
b <- as.Date("1970-1-1")
as.numeric(b)

a <- as.Date("1969-12-31")
as.numeric(a)

Sys.Date() - as.Date("1970-1-1")
Sys.Date() - as.Date("1969-12-31")

k <- as.Date("0-1-1")
as.numeric(k)

# get date components
vd <- as.POSIXlt("2016-2-14")
vd + 1 # add 1 second
vd + (24 * 60 * 60) # add 1 day
as.numeric(vd)
dc <- unclass(vd)
dc
dc$wday # Sun = 0, Mon = 1, ...
dc$mday # Jan = 0, Feb = 1, ...
dc$yday # 1st Jan = 0

du <- unlist(vd)
du

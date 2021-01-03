# date sequence
d1 <- as.Date("2016-2-14")

?strptime
format(d1, "%d")
as.integer(format(d1, "%d"))

format(d1, "%a")
weekdays(d1, abbreviate=T)

format(d1, "%A")
weekdays(d1)

format(d1, "%m") # character
as.integer(format(d1, "%m"))
format(d1, "%b")
months(d1, abbreviate = T)
format(d1, "%B")
months(d1)

format(d1, "%Y") # character
as.integer(format(d1, "%Y"))
as.integer(format(d1, "%y"))

# create daily sales data
dt <- seq(as.Date("2016-1-1"),as.Date("2016-5-31"),by = 1)
dt

d <- data.frame(
    dt,
    weekday = factor(weekdays(dt, abbreviate = T),
                     levels=c("Sun","Mon","Tue","Wed","Thu","Fri","Sat")),
    month = months(dt, abbreviate = T),
    sales = as.integer(sample(40:500,length(dt)))
)
View(d)

ag1 <- aggregate(sales~weekday,d,sum)
ag1
barplot(ag1$sales, names.arg = ag1$weekday)
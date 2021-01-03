# get metal price and foreign exhange rate with quantmod ----
install.packages("quantmod")
library(quantmod)

# get Metal e.g., Gold ----
getMetals("gold") # base.currency = "USD", prev 500 days
getMetals("gold", base.currency = "THB")
View(XAUTHB) # gold in Thai Baht
chartSeries(XAUTHB) # gold in Thai Baht

chart_Series(XAUTHB) # gold in Thai Baht

getMetals("XAU", base.currency = "THB") # base.currency = "USD"
View(XAUUSD) # note: XAU is gold
chartSeries(XAUUSD)


getMetals("silver") # or XAG
getMetals("XAG") # or silver

getMetals("XPT") # or platinum

getMetals(c("XAU", "XAG"), from = "2015-01-01", to = "2015-12-31")

# get FX ----
getFX("USD/THB") # today - 500 days
View(USDTHB)

# max 5 years ----
getFX("USD/THB", from = "2012-01-01")
chartSeries(USDTHB)
chart_Series(USDTHB) # experimental (interface will change!!)

getFX("EUR/THB", from = "2012-01-01")
getFX("GBP/THB", from = "2012-01-01")

getFX("THB/KRW", from = "2012-01-01") # KRW(Korean Won)
View(THBKRW)
chartSeries(THBKRW)

# merge data ----
p <- as.xts(merge(USDTHB, EURTHB, GBPTHB))
p

# save merged data to CSV ----
write.zoo(p, file = "fx.csv", sep = ",")
fx <- read.csv(file = "fx.csv", stringsAsFactors = F)
names(fx)
names(fx)[names(fx) == "Index"] <- "date"  # rename column
names(fx)
fx$date <- as.Date(fx$date)




library(ggplot2)
ggplot(fx, aes(date)) +
    geom_line(aes(y = USD.THB, color = "USD")) +
    geom_line(aes(y = EUR.THB, color = "EUR")) +
    geom_line(aes(y = GBP.THB, color = "GBP")) +
    labs(title = "Exchange rate", x = "", y = "Thai Baht")

library(reshape2)
fx2 <- melt(fx, id = "date", variable.name = "currency")
fx2
ggplot(fx2, aes(date, value, color = currency)) + geom_line() +
    labs(title = "Exchange rate", x = "", y = "Thai Baht")

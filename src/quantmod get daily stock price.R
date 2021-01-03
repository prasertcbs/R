# get daily stock price with quantmod ----
install.packages("quantmod")
library(quantmod)

getSymbols("mcd")

browseURL("http://finance.yahoo.com/q?s=mcd")
getSymbols(c("mcd", "Msft", "SBUX")) # case insensitive
getSymbols("MCD;MSFT;SBUX;AAPL", from = "2015-10-01") # start from 2015-10-01 till now
getSymbols("^DJI;^GSPC;MCD;MSFT;SBUX", from = "2013-10-01", to = "2016-01-31")

head(MCD)
tail(MCD)

chartSeries(MCD) # from 1st trading day of 2015 onwards
chartSeries(MCD["2015/"]) # from 1st trading day of 2015 onwards
chartSeries(MCD["/2015"]) # til the last trading day of 2015
chartSeries(MCD["2015-06-01/2015-08-31"]) # start from 2015-06-01 to 2015-08-31
chartSeries(MCD, subset = 'last 2 years')
addBBands()

## get symbols from SET (suffix .BK) ----
getSymbols("SCC.BK;BBL.BK;BH.BK", from = "2013-10-01")

# getSymbols("^SET50.BK") # unable to get SETxxx index

symbols <- c("AOT", "SCC", "KBANK")
symbols
s2 <- sprintf("%s.BK", symbols)
s2
getSymbols(s2)
getSymbols(sprintf("%s.BK", symbols))
getSymbols(sprintf("%s.BK", c("AOT", "SCC", "KBANK")))

s3 <- paste(symbols, ".BK", sep = "")
s3

chartSeries(SCC.BK, subset = 'last 20 days')
chartSeries(BBL.BK, subset = 'last 3 months')
chartSeries(BBL.BK, subset = 'last 2 quarters')
chartSeries(BBL.BK, subset = 'last 1 years')

# merge close price columns ----
# merge Closing price (column #4)

head(SCC.BK[, 4])
head(Cl(SCC.BK))

p <- as.xts(merge(SCC.BK[, 4], BBL.BK[, 4], BH.BK[, 4]))
View(p)

p1 <- as.xts(merge(SCC.BK[, 4], Cl(BBL.BK), Ad(BH.BK)))
View(p1)


# save data to CSV using write.zoo ----
write.csv(p, file = "test.csv") # no time series
write.zoo(p, file = "assets.csv", sep = ",")
assets <- read.csv(file = "assets.csv", stringsAsFactors = F)


library(dplyr)
# convert rownames to date column
assets <- as.data.frame(p)
assets <-
    assets %>% add_rownames(var = "date") %>% mutate(date = as.Date(date))
View(assets)

library(reshape2)
d <- melt(assets, id = 1, variable.name = "asset")
d

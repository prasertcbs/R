library(ggplot2) # use mpg data
# subsetting data (rows and columns)

View(mpg)
?mpg
str(mpg)
nrow(mpg)

d <- subset(mpg, year == 2008)
View(head(d))
nrow(d)

d <- subset(mpg, year != 2008)

d <- subset(mpg, drv == "f" &
            cty > 20 & hwy > 30 & class == "midsize")
d <- subset(mpg,
            drv == "f" &
               (cty > 20 | hwy > 30) &
               (class == "midsize" | class == "compact"))
d

# subsetting rows with selected columns ----
d <- subset(mpg, hwy > 35, select = c(manufacturer, model, year))
d <- subset(mpg, hwy > 35, select = manufacturer:year)
d <- subset(mpg, hwy > 35, select = 2:4)
d <- subset(mpg, hwy > 35, select = c(manufacturer:year, cty, hwy))
d

d <- subset(mpg, year == 2008 &
        class == "compact" | class == "pickup")
d <- subset(mpg, year == 2008 & class %in% c("compact", "pickup"))

# not in ----
d <- subset(mpg, year == 2008 & !(class %in% c("compact", "pickup")))

# grepl ----
mfg <- c("audi", "toyota", "honda", "nissan", "bmw")
grep("honda|toyota", mfg)
grepl("honda|toyota", mfg)

d <- subset(mpg, hwy > 30 & grepl("compact|midsize", class))
d <- subset(mpg, hwy > 30 & grepl("\\bcompact\\b|midsize", class))
d <- subset(mpg, hwy > 30 & grepl("Honda|Toyota", manufacturer))
d <- subset(mpg, hwy > 30 & grepl("Honda|Toyota", manufacturer, ignore.case = T))

# subset data (using mpg data from ggplot2 package)

# install.packages("ggplot2")
?subset
library(ggplot2)
View(mpg)

d <- subset(mpg, year == 2008)
d <- subset(mpg, year == 2008 & drv == "4")
d <- subset(mpg, year == 2008 & cty > 20 & hwy > 30)
d <- subset(mpg, year == 2008 & cty > 20 & hwy > 30, select=c(manufacturer,model))
d <- subset(mpg, year == 2008 & cty > 20 & hwy > 30, select=1:3)
d <- subset(mpg, year == 2008 & cty > 20 & hwy > 30, select=model:cyl)
d <- subset(mpg, year == 2008 & (class == "midsize" | class == "compact" | class == "minivan"))
d <- subset(mpg, year == 2008 & (class %in% c("midsize","compact","minivan")))
d <- subset(mpg, year == 2008 & !(class %in% c("midsize","compact","minivan")))

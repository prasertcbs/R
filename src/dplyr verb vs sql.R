# dplyr verb vs SQL

# install.packages("dplyr")
library(dplyr)
packageVersion("dplyr")
library(ggplot2)

# create data source ----
# !!RMySQL package is required to connect to mysql
# install.packages("RMySQL")
?src_mysql
my_db <- src_mysql(
    dbname = "demo",
    host = "localhost",
    user = "tutor",
    password = "pppqqq"
)
my_db

# use SQL command ----
r <- tbl(my_db,
         sql("select * from mpg where hwy > 30"))
r
View(r)

d <- mpg
d

q <-
    d %>%
    filter(hwy > 30) # select all columns
View(q)
str(d)
glimpse(d) # a nicer display version of str()

r <- tbl(my_db,
         sql(
             "select manufacturer, model, trans, hwy, cty
             from mpg
             where hwy > 30 and cty > 20 and
             year = 2008 and drv in ('f', '4')
             order by hwy desc, manufacturer")
         )
View(r)

q <-
    d %>%
    filter(hwy > 30, cty > 20, year == 2008, drv %in% c("f","4")) %>%
    arrange(desc(hwy), manufacturer) %>%
    select(manufacturer, model, trans, hwy, cty)

View(q)

q <-
    d %>%
    filter(hwy > 30, cty > 20, year == 2008, drv == "f" | drv == "4") %>%
    arrange(desc(hwy), manufacturer) %>%
    select(manufacturer, model, trans, hwy, cty)

View(q)

# aggregate (count, avg) ----
r <- tbl(my_db,
         sql(
             "select manufacturer, count(*) as cnt, avg(hwy) as avg_hwy
             from mpg
             group by manufacturer
             order by avg_hwy desc"
         ))
View(r)

q <-
    d %>%
    group_by(manufacturer) %>%
    summarize(cnt = n(), avg_hwy = mean(hwy)) %>%
    arrange(desc(avg_hwy)) %>%
# note: output columns are implied from group_by and summarize
View(q)

# add HAVING clause to filer result from group_by
r <- tbl(my_db,
         sql(
             "select manufacturer, count(*) as cnt, avg(hwy) as avg_hwy
             from mpg
             group by manufacturer
             having avg_hwy > 25
             order by avg_hwy desc"
         ))
View(r)

q <-
    d %>%
    group_by(manufacturer) %>%
    summarize(cnt = n(), avg_hwy = mean(hwy)) %>%
    filter(avg_hwy > 25) %>%
    arrange(desc(avg_hwy))
View(q)

r <- tbl(my_db,
         sql(
             "select manufacturer, drv, count(*) as cnt, avg(hwy) as avg_hwy
             from mpg
             group by manufacturer, drv
             having avg_hwy > 25
             order by avg_hwy desc"
         ))
View(r)

q <-
    d %>%
    group_by(manufacturer, drv) %>%
    summarize(cnt = n(), avg_hwy = mean(hwy)) %>%
    filter(avg_hwy > 25) %>%
    arrange(desc(avg_hwy))
View(q)

# simple bar plot ----
barplot(q$avg_hwy, names.arg = q$manufacturer)

# ggplot ----
ggplot(q, aes(manufacturer, avg_hwy)) + geom_bar(stat="identity")

# sort x-axis by avg_hwy (descending)
q <- transform(q, manufacturer = reorder(manufacturer, -avg_hwy))
ggplot(q, aes(manufacturer, avg_hwy)) + geom_bar(stat="identity")

ggplot(q, aes(manufacturer, avg_hwy)) + geom_bar(stat="identity") + facet_grid(drv~.)



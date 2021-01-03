# dplyr and MySQL

# install.packages("dplyr")
library(dplyr)
packageVersion("dplyr")

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

r <- tbl(my_db,
         sql(
             "select manufacturer, model, hwy, cty from mpg
             where hwy > 30 and cty > 20 and
             year = 2008 and drv in ('f', '4')")
         )
r
View(r)

# aggregate (count, avg)
r <- tbl(my_db,
    sql(
        "select manufacturer, count(*) as cnt, avg(hwy) as avg_hwy
        from mpg group by manufacturer
        order by avg_hwy desc"
    ))
r

# barplot(r$avg_hwy, names.arg = r$manufacturer)
d <- as.data.frame(r)
barplot(d$avg_hwy, names.arg = d$manufacturer)

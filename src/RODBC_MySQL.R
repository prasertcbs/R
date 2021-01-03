# remove all existing variables
# rm(list=ls(all=TRUE))

# Load RODBC package
library(RODBC)

# 1) use connection string
conn <- odbcDriverConnect("DRIVER={MySQL ODBC 5.3 Unicode Driver};Server=192.168.9.10;Database=Chinook;user=tutor;password=pppqqq")

# 2) use DSN (Data Source Name)
conn <- odbcConnect("MySQLDemo2", uid="tutor", pwd="pppqqq")

sqlTables(conn) # available tables 

q1 <- sqlQuery(conn, "Select CustomerId, FirstName, LastName from Customer order by FirstName")
head(q1)

q2 <- sqlQuery(conn, "SELECT customerid, sum(total) from invoice group by customerid")

q3 <- sqlQuery(conn, "select * from store")

odbcClose(conn)

str(q2)
head(q2)
summary(q2)


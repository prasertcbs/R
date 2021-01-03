# remove all existing variables
# rm(list=ls(all=TRUE))

# Load RODBC package
library(RODBC)

# 1) use DriverConnect
# create a connection to (local) SQL Server, Yummi2014 database with Windows Authentication (Trusted Connection)
conn <- odbcDriverConnect("Driver=SQL Server;Server=.;Database=Yummi2014;Trusted_Connection=Yes")

# SQL Server Name = Venus
#conn <- odbcDriverConnect("Driver=SQL Server;Server=Venus;Database=Yummi2014;Trusted_Connection=Yes")

# 2) use DriverConnect and SQL Server Authentication
#conn <- odbcDriverConnect("Driver=SQL Server;Server=.;Database=Yummi2014;uid=tutor;pwd=pppqqq")

# 3) use odbcConnect
# use named DSN with SQL Server Authentication
#conn <- odbcConnect("SQLDemo", uid="tutor", pwd="pppqqq")

q1 <- sqlQuery(conn, "Select * from category")

q2 <- sqlQuery(conn, "SELECT NoGuest, NetPay, OrderID FROM OrderHdr WHERE (OrderID < 50)")

odbcClose(conn)

str(q2)
head(q2)
summary(q2)
plot(q2$NoGuest, q2$NetPay)
m <- lm(NetPay ~ NoGuest, data=q2)
summary(m)

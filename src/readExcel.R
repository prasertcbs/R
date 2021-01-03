# remove all existing variables
# rm(list=ls(all=TRUE))

library(XLConnect)


# demo file from the current working directory
demoFile <- "demo.xlsx" 
# demoFile <- file.choose() 

# Excel Workbook
wb <- loadWorkbook(demoFile)

# read a specific sheet
phuket <- readWorksheet(wb, sheet = "Phuket")
phuket
str(phuket)
summary(phuket)

# data not starting at A1 (still OK but not recommended)
product <- readWorksheet(wb, sheet = "Product")
product

bkk <- readWorksheet(wb, sheet = "Bangkok")
bkk

# read from a specific region
phuket.coffee <- readWorksheet(wb, sheet = "Phuket", region = "B1:B10")
phuket.coffee

# read TABLE from a specific sheet
bkk2 <- readTable(wb, sheet = "Bangkok", table="_tblBangkok")
bkk2

samui <- readTable(wb, sheet = "samui", table="_tblSamui")
samui

# read NAMED REGION
weather <- readNamedRegion(wb, name = "_rngTemperature")
weather


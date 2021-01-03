menu <- c("mocha","latte","espresso","green tea","water")
price <- c(60,50,45,65,45)
qty <- c(22,12,20,30,13)
menu[price > 60]
revenue <- price * qty
revenue
sum(revenue)
revenue / sum(revenue)
sprintf("%.2f%%", p * 100)
p <- revenue / sum(revenue)
sprintf("%.2f%%", p * 100)
"water" %in% menu
"tea" %in% menu
"*tea" %in% menu
"\*tea" %in% menu
"?tea" %in% menu
priceUS <- price * 36
priceUS
priceUS <- price / 36
priceUS
(qty + qty2)
qty <- c(22,12,20,30,13)
qty2 <- c(70,69,53,52,64)
qty <- c(20,15,20,30,10)
qty2 <- c(70,69,53,52,64)
(qty + qty2)
menu <- c("mocha","latte","espresso","green tea","water")
price <- c(60,50,40,65,45)
qty <- c(20,15,20,30,10)
revenue <- price * qty
revenue
sum(revenue)
p <- revenue / sum(revenue)
sprintf("%.2f%%", p * 100)
qty2 <- c(70,69,53,52,64)
totalRevenue <- price * (qty + qty2)
totalRevenue
priceUS <- price / 36
priceUS
"water" %in% menu
menu[price > 60]
sprintf("%.2USD", priceUS)
sprintf("%.2fUSD", priceUS)
menu <- c("mocha","latte","espresso","green tea","water")
price <- c(60,50,40,65,45)
qty <- c(20,15,20,30,10)
revenue <- price * qty
revenue
sum(revenue)
p <- revenue / sum(revenue)
p
1200/5150
sprintf("%.2f", p * 100)
sprintf("%.2f%%", p * 100)
p*100
priceUS <- price / 36
priceUS
qty2 <- c(70,69,53,52,64)
totalQty <- qty + qty2
totalQty
totalRevenue <- price * (qty + qty2)
totalRevenue
sum(totalRevenue)
price > 50
price
price[price > 50]
menu[price > 50]
menu
price
menu[price > 50 & qty > 10]
qty
menu[price > 50 & qty > 25]

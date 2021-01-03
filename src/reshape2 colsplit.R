# Split a vector into multiple columns with reshape2::colsplit ----
# install.packages("reshape2")
library(reshape2)

# create test data: land area in rai-ngan-wa ----
set.seed(1)
d <- data.frame(
    id = LETTERS[1:10],
    area = sprintf(
        "%d-%d-%d",
        sample(0:4, 10, replace = T),
        sample(0:3, 10, replace = T),
        sample(0:99, 10, replace = T)
    ),
    stringsAsFactors = F
)
d
str(d)

s <- colsplit(d$area, "-", names = c("rai", "ngan", "wa"))
s
str(s)
d2 <- cbind(d, s)
d2
d2$total_sq_wa <- with(d2, rai * 400 + ngan * 100 + wa)
d2

# stem and leaf plot
# created by John Tukey

set.seed(9)
score <- as.integer(rnorm(100,mean=70,sd=8))
score
stem(score)

# John Tukey
score2 <- sort(score)
score2

hist(score) # frequency

# endpoint convention (40, 50], 40 < score <= 50
hist(score, right=F) # frequency [40, 50)
hist(score, breaks=c(seq(40,100,by=5)), right=F) # frequency

# large datasets
score <- as.integer(rnorm(1000,mean=70,sd=8))
stem(score) # not suitable for large dataset

# endpoint convention : default right = T (left open, right closed) e.g., (0, 25]
hist(score) # frequency











hist(score, breaks=c(0,50,70,100)) # density

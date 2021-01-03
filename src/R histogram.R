# basic histogram
a <- as.integer(rnorm(100,mean = 170,sd = 7))

hist(a)
hist(
    a,
    main = "Height distribution",
    xlab = "height",
    las = 1,
    col = "yellow",
    border = "purple"
)

j <- hist(a, plot = F)
j
typeof(j)
j$counts

hist(a, labels = as.character(j$counts), las = 1)
hist(
    a, labels = as.character(j$counts),
    las = 1,
    ylim=c(0,40),
    main = "Height distribution",
    col = "yellow",
    border = "purple"
)

hist(
    a, labels = as.character(j$counts / sum(j$counts)),
    las = 1,
    ylim=c(0,40),
    main = "Height distribution",
    col = "yellow",
    border = "purple"
)

hist(
    a, labels = sprintf("%.0f%%",j$counts / sum(j$counts) * 100),
    las = 1,
    ylim=c(0,40),
    main = "Height distribution",
    col = "yellow",
    border = "purple"
)

# probability density sum(area = 1)
hist(
    a,
    freq = F,
    las = 1,
    main = "Height distribution",
    col = "yellow",
    border = "purple"
)

# proof
x <- c(40,40,40,60)
r <- hist(x, freq = F)
(.15 * 5) + (5 * .05)


# breaks
k <- as.integer(rnorm(100,mean = 155,sd = 4))
hist(c(a,k))
hist(c(a,k), breaks = 50)

# custom breaks and labels
age <- as.integer(c(
    rnorm(20,mean = 8,sd = 2),
    rnorm(40,mean = 15,sd = 2.5),
    rnorm(60,mean = 23,sd = 3),
    rnorm(35,mean = 40,sd = 3),
    rnorm(35,mean = 60,sd = 5)
))
age
hist(age)
hist(age,breaks = 10)
hist(age, breaks = c(0,13,22,60,100), las = 1) # density
hist(
    age,
    freq = T,
    breaks = c(0,13,20,60,100),
    ylim=c(0,120),
    labels = c("kid","teenager","adult","senior")
)

#endpoint convention
# (0,13] 0 < age <= 13
# right F [0, 13)

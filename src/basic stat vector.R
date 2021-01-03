names <- c("Leo", "Ben","Jenny","Tiger","Nicole")
genders <- c("M","M","F","M","F")
weights <- c(62, 70, 55, 48, 70)
heights  <- c(170, 175, 160, 155, 168)

mean(weights)
median(weights)
min(weights)
max(weights)
range(weights)

plot(weights, heights)

bmis <- weights / (heights/100)^2
bmis

summary(weights)
table(genders)

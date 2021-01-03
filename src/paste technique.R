# paste function (concatenate strings) ----

h <- c(2, 7, 5, 3)
w <- c(4, 2, 6, 5)

a <- paste(h, w, sep = "x")
a

b <- sprintf("%dx%d", h, w)
b

a == b

ac <- paste(h, w, sep = "x", collapse = ",")
ac

a <- paste(h, w, 10, sep = " x ")
a

d <- data.frame(h, w)
d$dimension <- with(d, paste(h, w, sep = " x "))
View(d)


# binary art ----
paste(sample(0:1, 20, replace = T), collapse = "")

LETTERS
paste(LETTERS, collapse = "")
paste(letters, collapse = "<")
paste(letters[3:10], collapse = " -> ")

# simple password generator ----
for (i in 1:5) {
    print(
        paste(
            sample(LETTERS,
                   sample(5:8),
                   replace = T),
            collapse = ""))
}

for (i in 1:5) {
    print(
        paste(
            sample(c(LETTERS, letters, 0:9, unlist(strsplit("+-*/.,:;",""))),
                   sample(5:8),
                   replace = T),
            collapse = ""))
}


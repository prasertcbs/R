library(dplyr)
packageVersion("dplyr")

# cheat sheet
browseURL("https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf")

d <- data.frame(
    studentID=seq(1,20),
    gender=sample(rep(c("M","F"),10)),
    math1=sample(4:10,20,replace = T),
    math2=sample(5:10,20,replace = T),
    math3=sample(6:10,20,replace = T),
    eng1=sample(4:15,20,replace = T),
    eng2=sample(7:15,20,replace = T),
    eng3=sample(8:15,20,replace = T),
    sci1=sample(4:20,20,replace = T),
    sci2=sample(7:20,20,replace = T),
    sci3=sample(8:20,20,replace = T)
)

# create _total columns
d <- d %>% mutate(math_total = math1 + math2 + math3,
                  eng_total = eng1 + eng2 + eng3,
                  sci_total = sci1 + sci2 + sci3)

View(d)

q <- d %>% select(everything())
q <- d %>% select(studentID, math_total, eng_total)
q <- d %>% select(starts_with("eng"))
q <- d %>% select(ends_with("total"))
q <- d %>% select(contains("_"))
q <- d %>% select(num_range("math",1:3))
q <- d %>% select(eng1:eng3)
q <- d %>% select(eng1:sci3)
q <- d %>% select(math1:math3, sci1:sci3)
q <- d %>% select(-gender)
q <- d %>% select(-c(gender, math1:math3))
q <- d %>% select(studentID, num_range("math",1:3), math_total, sci1:sci3)
q <- d %>% select(studentID, matches("math|eng"))

### bullet chart
# install.packages("ggplot2")
library(ggplot2)

# condo room size
# compare total units vs sold
d <- data.frame(room=c("30m2", "55m2", "70m2", "90m2"),
                unit=c(40,50,25,30),
                sold=c(35,45,15,10))
View(d)


ggplot(d, aes(x=room, y=unit)) +
    geom_bar(stat="identity", fill="grey70")

ggplot(d, aes(x=room)) +
    geom_bar(aes(y=unit), stat="identity", fill="green")

ggplot(d, aes(x=room)) +
    geom_bar(aes(y=unit), stat="identity", fill="grey70") +
    geom_bar(aes(y=sold), stat="identity", fill="orange") +
    xlab("room size") +
    theme_bw()

ggplot(d, aes(x=room)) +
    geom_bar(aes(y=unit), stat="identity", fill="grey70") +
    geom_bar(aes(y=sold), stat="identity", width=.5, fill="orange") +
    xlab("room size") +
    theme_bw()

# add data label (units sold)
ggplot(d, aes(x=room)) +
    geom_bar(aes(y=unit), stat="identity", fill="grey70") +
    geom_bar(aes(y=sold), stat="identity", width=.5, fill="orange") +
    geom_text(aes(y=sold, label=sold), vjust=-1, color="white") +
    xlab("room size") +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

# add 2 data labels
ggplot(d, aes(x=room)) +
    geom_bar(aes(y=unit), stat="identity", fill="grey70") +
    geom_bar(aes(y=sold), stat="identity", width=.5, fill="orange") +
    geom_text(aes(y=unit, label=unit), vjust= -1, color="black") +
    geom_text(aes(y=sold, label=sold), vjust= 2, color="black") +
    xlab("room size") +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())


### if data.frame is organized in the long format
# use tidyr::gather to unpivot d
library(tidyr)
d2 <- gather(d, dim, value, unit:sold)
View(d2)

ggplot(d2, aes(x=room, y=value)) +
    geom_bar(stat="identity")

ggplot(d2, aes(x=room, y=value, fill=dim)) +
    geom_bar(stat="identity", position="dodge")

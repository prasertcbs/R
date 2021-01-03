# convert matrix to data frame for ggplot2
# install.packages(ggplot2)
# install.packages(scales)
# install.packages(reshape2)

library(reshape2)
library(ggplot2)
library(scales)
View(WorldPhones)
class(WorldPhones)
d <- as.data.frame(WorldPhones)
w.t <- melt(WorldPhones)
colnames(w.t) <- c("year","region","phones")

ggplot(w.t, aes(year, phones, color=region)) + geom_line(stat="identity")
ggplot(w.t, aes(year, phones, color=region)) +
  geom_line(stat="identity") +
  scale_y_log10(labels=comma)

ggplot(w.t, aes(year, phones, color=region)) +
  geom_line(stat="identity") +
  facet_wrap(~region)

ggplot(w.t, aes(year, phones, color=region)) +
  geom_line(stat="identity") +
  scale_y_continuous(labels=comma) +
  facet_wrap(~region, scales="free")


# this will open KiaHyundaiThefts.xlsx file to do analysis

{r, echo=FALSE}
library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
setwd("~/dsc640/Wk5-6")

Thefts <- read_excel('kiaHyundaiThefts.xlsx', sheet ='kiaHyundaiThefts')


States <- read_excel('kiaHyundaiThefts.xlsx', sheet ='Sheet3')

df <-data.frame(x= States$State, y = States$KiaHyundaiThefts, group = States$Year)
View(df)

#plot by scatter chart
ggplot(df, aes(x=x, y = y, fill = group)) +
  ggtitle("KiaHyundai car theft per year") +
  labs(y="Theft count", x="state") +
  geom_bar(stat ="identity")


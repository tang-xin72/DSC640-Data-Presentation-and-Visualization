# this will open KiaHyundaiMilwaukeeData.xlsx file to do analysis

#{r, echo=FALSE}
library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
setwd("~/dsc640/Wk5-6")

M_loss <- read_excel('KiaHyundaiMilwaukeeData.xlsx', sheet ='KiaHyundaiMilwaukeeData')


ggplot(M_loss, aes(M_loss$year, M_loss$percentKiaHyundai)) +
  ggtitle("Milwaukee KiaHyundai car theft case per year") +
  labs(y="Ratio of loss to other car loss ", x="Year") +
  geom_point()


#plot again by area chart 
ggplot(M_loss, aes(year, countKiaHyundaiThefts)) +
    ggtitle("KiaHyundai car theft count per year") +
  labs(y="Theft count", x="Year") +
  geom_area(alpha=0.6)


#plot stacked area chart
M_allloss<- read_excel('KiaHyundaiMilwaukeeData.xlsx', sheet ='Sheet3')

ggplot(M_allloss, aes(x=year, y=Count, fill=group)) +
  ggtitle("Milwaukee area car theft count per year") +
  labs(y="Theft count", x="Year") +
  geom_area()
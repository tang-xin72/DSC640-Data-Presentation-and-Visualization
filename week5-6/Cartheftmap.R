# this will open carTheftsMap.xlsx file to do analysis


{r, echo=FALSE}
library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
setwd("~/dsc640/Wk5-6")

Theftmap <- read_excel('carTheftsMap.xlsx', sheet ='carTheftsMap')

Worse <- Theftmap %>% filter(percentChange2019to2022 >2.5) 
View(Worse)

Better <- Theftmap %>% filter(percentChange2019to2022 < -0.3) 
View(Better)

#make a pie chart
ggplot(Better, aes(x = "", y = percentChange2019to2022, fill = geo_name)) + 
  geom_bar(width = 1, stat = "identity", color = "black") + 
  coord_polar("y", start = 0)+ 
  geom_text(aes(label = paste0(round(percentChange2019to2022*100,0), "%")), 
            position = position_stack(vjust = 0.5)) +
  labs(x=NULL, y=NULL, fill =NULL,
       title = "County with less Theft") +
  guides(fill = guide_legend (reverse = TRUE))
  theme_void()

# make a donut chart
df <- data.frame(value = Worse$percentChange2019to2022, group = Worse$geo_name)

hsize <- 2

df <- df %>% 
  mutate(x = hsize)

ggplot(df, aes(x= hsize, y = value, fill = group)) +
  geom_col() +
  geom_text(aes(label = group),
            position = position_stack(vjust = 0.5), size =1.5) +
  coord_polar(theta = "y") +
  xlim(c(0.2, hsize +0.5))
  theme_void()
    

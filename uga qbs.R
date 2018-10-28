setwd("C:/Users/tedhe/OneDrive/Documents/analytics")
library(readr)
fromm <- read_csv("JakeFromm.csv")
stafford <- read_csv("MatthewStafford.csv")
murray <- read_csv("AaronMurray.csv")

# 
names(stafford) <- names(fromm)
names(murray) <- names(fromm)
data <- rbind(fromm,  murray, stafford)
library(tidyverse)
names(data)[22] <- 'QBR'

data <- data %>% filter(DEF > 0)



library(ggplot2)

ggplot(data,  aes(x =`Game`, y = `QBR`, col = Player, label = OPP))  + 
  geom_smooth(method = 'loess', se = FALSE) + geom_text() + 
  ggtitle("Adjusted QBR over time for UGA QBs in first two seasons") + 
  geom_hline(yintercept = mean(data$QBR)) 


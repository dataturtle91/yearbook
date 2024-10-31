library(dplyr)
library(ggplot2)

army <- read.csv("army.csv", sep =";")



# Difference between number of privates y/y

privates <- army[,c(1,6)]
privates$change <- c(NA, diff(privates$privates))
privates
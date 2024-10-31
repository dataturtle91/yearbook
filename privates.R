# This script shows how to calculate difference between number of
# pricates year to year


library(dplyr)

army <- read.csv("army.csv", sep =";")

# I. R-base version

df_privates <- army[,c(1,6)]
df_privates$change <- c(NA,diff(df_privates$privates))

# II. dplyr version

privates_df <- army %>%
  select(year,privates)

privates_df <- privates_df %>% 
  arrange(year) %>%
  mutate(change = privates - lag(privates))

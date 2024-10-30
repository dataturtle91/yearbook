library(tidyverse)
library(plotly)
setwd("D:/wd")
df <- read.csv("army.csv",sep = ";")


df$pro_soldiers_total <-  rowSums(df[,-c(1,7:9)])


# Draw line chart (y scale starts from 0)

total_chart_0 <- ggplot(df,aes(x = year, y = pro_soldiers_total))+
  scale_x_continuous(breaks = c(2013,2014,2015,2016,2017,2018,2019,2020,2021,
                                2022,2023)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 152)) +
  geom_line(color = "darkgreen") + 
  geom_point(col = "darkblue") +
  labs(
    title = "The number of soldiers in Poland shows an upward trend till 2016",
    y = "Number of proffesional soldiers [in thousands]"
  ) +
  theme_minimal()

ggplotly(total_chart_0)


particular_soldiers_chart <- ggplot(df,aes(x = year)) +
  scale_x_continuous(breaks = c(2013,2014,2015,2016,2017,2018,2019,2020,2021,
                                2022,2023)) +
  labs(
    title = "Number of professional soldiers in Poland in 2013-2023 by position"
    y=""
  )+
  scale_y_continuous(breaks = seq(0,60, by = 10)) +
  geom_line(aes(y = privates, color = "Privates")) +
  geom_line(aes(y = warrant_officers_and_non.commissioned_officers,
                color = "Warrant / non commisioned officers")) +
  geom_line(aes(y = junior_officers, color = "Junior officers")) +
  geom_line(aes(y = senior_officers, color = "Senior officers")) +
  geom_line(aes(y = generals, color = "Generals")) 

ggplotly(particular_soldiers_chart)
                                      
                                    
                                                    










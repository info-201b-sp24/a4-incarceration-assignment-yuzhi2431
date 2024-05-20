library(ggplot2)
library(tidyverse)

prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
jail_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-jail-pop.csv")

prison_pop_yearly <- prison_pop %>% group_by(year) %>% filter(!is.na(total_prison_pop)) %>% summarize(sum_pop = sum(total_prison_pop))
yearly_black_prison_pop_por <- prison_pop %>% filter( !is.na(total_prison_pop), !is.na(black_prison_pop)) %>% group_by(year) %>% summarize(pop = sum(black_prison_pop)/sum(total_prison_pop)) 
yearly_white_prison_pop_por <- prison_pop %>% filter( !is.na(total_prison_pop), !is.na(white_prison_pop)) %>% group_by(year) %>% summarize(pop = sum(white_prison_pop)/sum(total_prison_pop)) 

ggplot() +
  geom_line(data = yearly_black_prison_pop_por, aes(x = year, y = pop, color = "Black_Prisoner")) +
  geom_line(data = yearly_white_prison_pop_por, aes(x = year, y = pop, color = "White_Prisoner")) +
  labs(title = "Proportion of Black and White in Prison from 1970 to 2018", x = "Year", y = "Proportion", color = "Legend") +
  scale_color_manual(values = c("Black_Prisoner" = "blue", "White_Prisoner" = "red"))

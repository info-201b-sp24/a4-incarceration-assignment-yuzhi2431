library(ggplot2)
library(tidyverse)

prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
prison_pop <- prison_pop %>% mutate(black_prison_por = black_prison_pop/total_prison_pop, black_1564_por = black_pop_15to64/total_pop_15to64)
ggplot(data = prison_pop, mapping=aes(x = black_prison_por, y = black_1564_por )) +
  geom_point() + 
  labs(title="Proportion of black population in and out of prison",
       x="Porportion of Black Population in Prison",
       y="Porportion of Black Population out of Prison") 


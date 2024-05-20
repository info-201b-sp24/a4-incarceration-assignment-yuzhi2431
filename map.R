library(ggplot2)
library(tidyverse)
library(maps)

prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

states_map <- map_data("state")

state_abbrev <- data.frame(
  state = state.abb,
  full_name = tolower(state.name)
)


state_black_prison_pop_por <- prison_pop %>% filter( !is.na(total_prison_pop), !is.na(black_prison_pop)) %>% group_by(state) %>% summarize(por = sum(black_prison_pop) / sum(total_prison_pop))



state_black_prison_pop_por <- state_black_prison_pop_por %>%
  left_join(state_abbrev, by = c("state" = "state"))

map_data_population <- states_map %>%
  left_join(state_black_prison_pop_por, by = c("region" = "full_name"))




# Plot the map with ggplot2
ggplot(data = map_data_population, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = por), color = "black") +
  scale_fill_continuous(name = "Proportion", low = "lightblue", high = "darkblue", na.value = "grey50") +
  theme_minimal() +
  labs(title = "Porportion of Black Population in Prison by State in the US", x = "", y = "") +
  theme(axis.text = element_blank(), axis.ticks = element_blank(), panel.grid = element_blank())




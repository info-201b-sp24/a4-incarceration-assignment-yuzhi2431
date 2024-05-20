library(tidyverse)

prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
jail_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-jail-pop.csv")

# prison_pop <- prison_pop %>% filter(year == 2000)
# jail_pop <- jail_pop %>% filter(year == 2000)

black_prison_pop_por <- prison_pop %>% filter( !is.na(total_prison_pop), !is.na(black_prison_pop)) %>% summarize(pop = sum(black_prison_pop)/sum(total_prison_pop)) %>% pull()

black_jail_pop_por <- jail_pop %>% filter(!is.na(total_jail_pop), !is.na(black_jail_pop)) %>% summarize(pop = sum(black_jail_pop)/sum(total_jail_pop)) %>% pull()

  
white_prison_pop_por <- prison_pop %>% filter(!is.na(total_prison_pop), !is.na(white_prison_pop)) %>% summarize(pop = sum(white_prison_pop)/sum(total_prison_pop)) %>% pull()

white_jail_pop_por <- jail_pop %>% filter(!is.na(total_jail_pop), !is.na(white_jail_pop)) %>% summarize(pop = sum(white_jail_pop)/sum(total_jail_pop)) %>% pull()

year_max_black_prison_porportion <- prison_pop %>% filter( !is.na(total_prison_pop), !is.na(black_prison_pop)) %>% group_by(year) %>% summarize(black_pop_por = sum(black_prison_pop)/sum(total_prison_pop)) %>%  arrange(desc(black_pop_por)) %>% slice_head(n = 1)

year_min_black_prison_porportion <- prison_pop %>% filter( !is.na(total_prison_pop), !is.na(black_prison_pop)) %>% group_by(year) %>% summarize(black_pop_por = sum(black_prison_pop)/sum(total_prison_pop)) %>%  arrange(black_pop_por) %>% slice_head(n = 1)

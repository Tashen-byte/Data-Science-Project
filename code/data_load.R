#load and neaten the data
library(tidyverse)
library(dplyr)
library(knitr)
library(readr)

points <- read_csv2("data/Points.csv") %>%
    janitor::clean_names() %>%
    mutate(rank = as.factor(rank)) %>%
    mutate(season = as.character(season)) %>%
    mutate(nrr = as.numeric(nrr)) %>%
    mutate(name = gsub("Kings XI Punjab", "Punjab Kings", name))


all_match <- read_csv2("data/matches.csv") %>%
    janitor::clean_names() %>%
    mutate(season = case_when(season == "2020/21" ~ "2020",
                              season == "Oct-09" ~ "2010",
                              season == "Aug-07" ~ "2008",
                              TRUE ~ season),
           season = as.character(season)) %>%
    mutate(toss_winner = case_when(toss_winner == "Delhi Daredevils" ~ "Delhi Capitals",
                                   toss_winner == "Kings XI Punjab" ~ "Punjab Kings",
                                   toss_winner == "Rising Pune Supergiant" ~ "Rising Pune Supergiants",
                                   TRUE ~ toss_winner),
           toss_winner = as.character(toss_winner))


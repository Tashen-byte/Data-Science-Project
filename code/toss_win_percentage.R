
#isolate the selected ones, as per the following intuition.
#each team plays 14 games per season, except for 2012, where 16 games were played per team
toss_win <- function(data){
toss <- data %>%
    group_by(season, toss_winner) %>%
    filter(!season == 2012) %>%
    summarise(proportion = n()/14*100)
#2012
tos <- data %>%
    group_by(season, toss_winner) %>%
    filter(season == 2012) %>%
    summarise(proportion = n()/16*100)

com <- toss %>%
    full_join(tos) %>%
    rename("name" = toss_winner) %>%
    arrange(season)
com
}
toss_win(all_match)




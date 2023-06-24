#Team selection of teams present in more than 8 seasons
persistent <- function(data){
    sum <- data %>%
    group_by(name) %>%
    summarise(seasons = n_distinct(season))

    pers <- sum %>%
        filter(seasons > 10) %>%
        arrange(seasons)

    pers
}

#selection of these teams by their short-name.
data <- data %>%
    filter(short_name %in% c("RR","CSK","KXIP", "DC", "KKR","MI","RCB"))
#However, the short-name is not ideal to use, as Dehli Capitals and Deccan Chargers have the
#same short-name, DC. Deccan chargers does not meet the criteria for the tema selection. This means
#that the model must be filtered through their name and not the short-name.


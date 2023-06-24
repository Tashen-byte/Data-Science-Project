box <- function(data){
    library(tidyverse)
d <- data %>%
    select(matcheswon, matcheslost)
boxplot(d, xlab = "Variables",
        ylab = "Value",
        main = "Box-plot of Matches")
}


box1 <- function(data){
    d2 <- data %>%
        select(nrr)
    boxplot(d2, xlab = "Variable",
            ylab = "Value",
            main = "Box-plot of Net Run Rate")
}

box2 <- function(data){
    d3 <- data %>%
        select(proportion)
    boxplot(d3, xlab = "Variable",
            ylab = "Value",
            main = "Box-plot of Proportion of Coin Toss Wins")
}

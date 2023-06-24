
fit2 <- function(dat){
    library(caret)
    library(rsample)
    (set.seed(123))
    split1 <- initial_split(dat, prop = 0.7, strata = "matchpoints")
    train1 <- training(split1)
    test1 <- testing(split1)
    crtl1 <- trainControl(method = "repeatedcv", number = 10, repeats = 5)
    grid1 <- expand.grid(k = seq(2,25, by=1))
    fitt1 <- train(matchpoints ~ matcheswon+matcheslost+noresult+
                      nrr+proportion,
                  data = train1,
                  method = "knn",
                  trControl = crtl1,
                  tuneGrid = grid1,
                  metric = "RMSE")
    fitt1
    ggplot(fitt1)
}

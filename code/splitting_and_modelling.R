#I would like to ideally work with the data split 70/30 utilising
fit1 <- function(data){
library(caret)
library(rsample)
(set.seed(123))
split <- initial_split(data, prop = 0.7, strata = "matchpoints")
train <- training(split)
test <- testing(split)

crtl <- trainControl(method = "repeatedcv", number = 10, repeats = 5)
grid <- expand.grid(k = seq(2,25, by = 1))
fit <- train(matchpoints ~ matcheswon+matcheslost+noresult+
                 nrr+proportion ,
             data = train,
             method = "knn",
             trControl = crtl,
             tuneGrid = grid,
             metric = "RMSE")
ggplot(fit)
}

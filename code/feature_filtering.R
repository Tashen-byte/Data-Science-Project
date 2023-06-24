#Feature Filtering
library(caret)
caret::nearZeroVar(train, saveMetrics = TRUE) %>%
    tibble::rownames_to_column() %>%
    filter(nzv)
#normalise all columns
install.packages("recipes")
library(recipes)
recipe(rank ~ . , data = train) %>%
    step_YeoJohnson(all_numeric())

library(tidymodels)

meus_dados <- iris

# 1. Dividir os dados
set.seed(123)
data_split <- initial_split(meus_dados, prop = 0.8)
train_data <- training(data_split)
test_data  <- testing(data_split)

# 2. Criar a receita de pré-processamento
minha_receita <- recipe(Species ~ ., data = train_data) |>
  step_impute_median(all_numeric_predictors()) |>
  step_normalize(all_predictors())

# 3. Especificar o modelo
rf_model <- rand_forest(trees = 100) |>
  set_engine("ranger") |>
  set_mode("classification")

# 4. Criar o workflow
meu_workflow <- workflow() |>
  add_recipe(minha_receita) |>
  add_model(rf_model)

# 5. Treinar o modelo
modelo_final <- meu_workflow |> fit(data = train_data)


saveRDS(modelo_final, "modelo_final.rds")

library(vetiver)

# 1. Crie um "objeto de modelo" vetiver
v <- vetiver_model(modelo_final, "meu_modelo_rf")

# 2. Versione o modelo em um "board" (ex: uma pasta, S3, etc)
library(pins)
board <- board_folder("model_versions")
vetiver_pin_write(board, v)

# 3. Crie uma API plumber a partir do objeto vetiver
pr() |> 
  vetiver_api(v) |> 
  pr_run()

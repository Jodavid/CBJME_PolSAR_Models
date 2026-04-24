# api.R
library(plumber)
#library(meus_pacotes)

modelo <- readRDS("modelo_final.rds")

#* @post /predict
function(req, res) {
  new_data <- as.data.frame(req$body)
  predict(modelo, new_data)
}

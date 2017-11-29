# dada uma lista de series de TV, esta funcao extrai o nome
# e o codigo destas series do site do IMDb
# 
# Marcus Nunes - http://marcusnunes.me

extrair <- function(serie){
  
  string <- as.character(serie)
  codigo <- strsplit(string, "/")[[1]][3]
  nome   <- strsplit(string, "\"")[[1]][4]
  
  return(c(codigo, nome))
  
}

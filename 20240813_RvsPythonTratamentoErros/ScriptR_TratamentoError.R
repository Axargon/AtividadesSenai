tryCatch({
  resultado <-10/0
},error = function(e){
  print("Erro: Divisão por 0 não é permitida")
})

#Implemente um bloco de try-except para capturar um indice fora dos limites de uma lista
lista <- c(1,2,3)
tryCatch({
  elemento <- lista[5]
}, error = function(e){
  print("Erro: indice fora dos limites da lista")
})

#Implemente um bloco try except para capturar uma chave inexistente de um dicionario
dicionario <- list(a=1,b=2,c=3)

tryCatch({
  valor <- dicionario[['d']]
},error = function(e){
  print("Erro: Chave inexistente no dicionário")
})

#Capture e trate uma exceção ao converter uma string para um inteiro,

word <- "abc"
tryCatch({
  numero <- as.integer(word)
}, warning = function(w){
  print("Erro: Conversáo para string Falhou")
})

#Capture e trate exceções em opeações e listas aninhadas
dicionario <- list(a=c(1,2,3),b=c(4,5,6))
tryCatch({
  elemento <- dicionario[["c"]][1]
},error = function(e){
  if(inherits(e,"simpleError")){
    print("Error: chave inexistente no dicioario ou indice fora dos limites da lista")
  }
})
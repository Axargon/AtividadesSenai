#Imprimir uma funcao que retorna a soma de dois numeros
soma <- function(a,b){
  return(a+b)
}
print(soma(5,2))

palindromo <- function(word){
  return(word == paste(rev(strsplit(word, NULL)[[1]]), collapse = ""))
}
palindromo("radar")


#Implemente uma função que retorna a quantidade de vogais em uma string.
conta_vogais <- function(word){
  vogais <- c('a','e','i','o','u')
  return(sum(tolower(strsplit(word,NULL)[[1]])%in% vogais))
}
conta_vogais("paralelepipedo")

#Implemente uma função que retorna o produto de duas matrizes
mult_mat <- function(matriz_a,matriz_b){
  return(matriz_a %*% matriz_b)
}

m1 <- matrix(c(1,2,3,4), nrow =2, ncol = 2, byrow = TRUE)
m2 <- matrix(c(5,6,7,8),nrow=2,ncol=2, byrow = TRUE)

print(mult_mat(m1,m2))

fatorial <- function(n){
  if (n == 0){
    return(1)
  }
  return(n * fatorial(n-1))
}

fatorial(4)

#implemente uma funcao que retorna a soma dos n primeiros numeros naturais
soma_n_numeros <- function(n){
  if(n==0){
    return(0)
  }
  return(n+soma_n_numeros(n-1))
}

soma_n_numeros(10)



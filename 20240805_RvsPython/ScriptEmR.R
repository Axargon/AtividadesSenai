# vetores
#Crie um vetor com os números de 1 a 10 e imprima - 0
vetor <-1:10
print (vetor)

#Crie um vetor com os numeros pares de 2 a 20 e imprima-o
vetor <- seq(2,20, by =2)
print(vetor)

#Calcule a soma dos elementos de um vetor com números de 1 a 100
vetor <- 1:100
soma <-sum(vetor)
print(soma)

#Encontre o maior e o menor valor em um vetor de números aleatórios 
#entre 1 a2 1000, de tamanho 50
vetor <- sample(1:1000,50)
maior <- max(vetor)
menor <- min(vetor)
print(paste("Maior:", maior,"Menor:",menor))

# Crie um vetor com os 10 primeiros numeros primos
eh_primo <- function(n){
  if (n<=1){
    return(FALSE)
  }
  for (i in 2:sqrt(n)){
    if(n%% i ==0){
      return(FALSE)
    }
  }
  return(TRUE)
}
primos <- c()
num <-2
while(length(primos)<10){
  if(eh_primo(num)){
    primos<-c(primos, num)
  }
  num <- num+1
}

print(primos)

#inverta a ordem de um vetor de tamanho 20 preenchido com numeros aleatorios
vetor <- sample(1:100, 20, replace = TRUE)
vetor_invertido <- rev(vetor)
print(vetor)
print(vetor_invertido)


#Crie uma matriz 3x3 com os numeros de 1 a 9
matriz <- matrix(1:9,nrow = 3,ncol = 3)
print(matriz)
 
#Crie uma matriz identidade de 4X4 e imprima -a 
matriz <- diag(4)
print(matriz)

#some duas matrizes 2x2
matriz1 <- matrix(c(1,2,3,4),nrow = 2,ncol = 2)
matriz2 <- matrix(c(5,6,7,8),nrow = 2,ncol = 2)
matriz_soma <-t(matriz1) + t(matriz2)
print(matriz_soma)

#multiplique duas matrizes 2x2
matriz1 <- matrix(c(1,2,3,4),nrow = 2,ncol = 2)
matriz2 <- matrix(c(5,6,7,8),nrow = 2,ncol = 2)
matriz_mult <-t(matriz1) %*% t(matriz2)
print(matriz_mult)

#calcule a transposta de uma matriz 3x3
matriz <- matrix(1:9,nrow = 3, ncol = 3)
matriz_transposta <- t(matriz)
print(matriz_transposta)

# Calcule a determinante de uma matriz 3x3.
matriz <- matrix(1:9, nrow =3, ncol=3)
determ <- det(matriz)
print(determ)



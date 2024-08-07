
#crie um vetor de categorias (fatores) com as cores vermelho azul e verde
cores <- factor(c('vermelho','azul','verde'))
print(cores)

#Crie um vetor de fatores para os dias da semana e imprima-os
semana <- factor(c('segunda', 'terca', 'quarta', 'quinta', 'sexta'))
print(semana)

#crie um vetor com as categorias baixo, medio e alto e ordene-os
niveis <- factor(c('baixo','alto','medio'), levels = c('baixo','medio','alto'), ordered = TRUE)
print(niveis)

# Converta um vetor de fatores em um vetor numerico
categoria <- factor(c('baixo','alto','medio'), levels = c('baixo','medio','alto'), ordered = TRUE)
numeros <- as.numeric(categoria)
print(numeros)

#Crie um vetor de fatores com as categorias pequeno medio e grande e substitua pequeno por extra pequeno
tamanhos <- factor(c('pequeno','medio','grande'), levels = c('pequeno','medio','grande'), ordered = TRUE)
levels(tamanhos)[levels(tamanhos)=='pequeno'] <- 'extra pequeno'
print(tamanhos)

#Crie um vetor de fatores com 100 elementos aleatorios entre baixo medio e alto 
#e calcule a frequencia de cada categoria
set.seed(123)
categorias <- c('baixo','medio','alto')
vetor <- sample(catetorias, 100, replace = TRUE)
fatores <- factor(vetor, levels = categorias, ordered = TRUE)
frequencias <-table(fatores)
print(frequencias)

##############   LISTAS!!!   ##########################
#crie uma listaa contendo os numeros de 1 a 5
lista <- list(1,2,3,4,5)
print(lista)

#adicione o elemento "6" no final da lista criada
lista <- list(1,2,3,4,5)
lista[[6]]<-6
print(lista)

#Remova o terceiro elemento da lista 1,2,3,4,5
lista <- list(1,2,3,4,5)
lista <- lista[-3]
print(lista)

#Inverta a ordem dos elementos da lista (1,2,3,4,5)
lista <- list(1,2,3,4,5)
lista_invertida <- rev(lista)
print(lista_invertida)

#crie unma lista de liestas (matriz)
#de tamanho 3x3 e calcule a soma de cada linha
matriz <- list(c(1,2,3),c(4,5,6),c(7,8,9))
soma_linhas <- sapply(matriz, sum)
print(soma_linhas)

##############   Tuplas!!!   ##########################
# Crie uma tupla contendo os numeros de 1 a 5 e imprima
tupla <- list(1,2,3,4,5) #nao existe tupla em R!!
print(tupla)

#Acesse o terceiro elemento da tupla e imprima-o
tupla <- list(1,2,3,4,5) #nao existe tupla em R!!
print(tupla[[3]])

#Crie uma tupla contendo tres tuplas internas, e cada uma com dois elementos e a imprima
tupla <- list(c(1,2),c(3,4),c(5,6)) #nao existe tupla em R!!
print(tupla)
    ###Variacao
    tupla <- list(list(1,2),list(3,4),list(5,6)) #nao existe tupla em R!!
    print(tupla)
    
#Concatene  duas tuplas e imrprima o resultado
lista1 <-list(1,2,3)
lista2 <-list(4,5,6)
lista_concatenada <- c(lista1,lista2)
print(lista_concatenada)

#Crie uma tupla (1,2,3,4,5) e verifique se o numero 3 esta na tupla
lista <-list(1,2,3,4,5)
existe <- 3 %in% lista
print(existe)

#Crie uma tupla (1,2,3,4,5) e encontre o indice do numero 4
lista <- list(1,2,3,4,5)
indice <-which(unlist(lista)==4)
print(indice)

##############   Dicionario!!!   ##########################
#Crie um dicionario com as chaves "nome", "idade", "cidade" e os
#valores "Ana", 25 e "São Paulo" respectivamente
dicionario <- list(nome = "Ana", idade=25 , cidade="São Paulo")
print(dicionario)

#Acesse o valor associado a chave idade no dicionario
dicionario <- list(nome = "Ana", idade=25 , cidade="São Paulo")
idade <- dicionario$idade
print(idade)

#Adicione  um novo par chave valor "profissao": "engenheira"
#ao dicionario anterior
dicionario <- list(nome = "Ana", idade=25 , cidade="São Paulo")
dicionario$profissão <- "engennheira"
print(dicionario)



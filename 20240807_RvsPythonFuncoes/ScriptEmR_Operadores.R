#Remova a chave 'cidade' do dicionario
dicionario <- list(nome = "Ana", idade=25 , cidade="São Paulo", profissão = "engennheira")
dicionario$cidade <- NULL
print(dicionario)

#Crie um dicionario aninhado para armazenar informacors de varias pessoas, onde
#cada pessoa tem um ome, idade e cidade
dicionario <- list(
    pessoa1 <- list(nome = "Ana", idade=25 , cidade="São Paulo"),
    pessoa2 <- list(nome = "Carolina", idade= 32 , cidade="Araçatuba"),
    pessoa3 <- list(nome = "Anabela", idade= 40 , cidade="Pequenópolis"),
    pessoa4 <- list(nome = "Anafeia", idade= 18 , cidade="Akropolis")
)
for(pessoa in dicionario){
  print(paste("nome:",pessoa$nome, "idade: ",pessoa$idade,"cidade:",pessoa$cidade))
}

####### Operadores! ###########
## Aritméticos
#Soma
soma <- 10 + 20
print(soma)
 
#subtracao
sub <- 30-15
print(sub)

#multiplicacao
mult <- 5*7
print(mult)

#divisao
div <- 81/9
print(div)

#exponenciacao
exp <- 2^10
print(exp)

#resto da divisao
resto = 29 %% 5
print(resto)

## Logicos 
# verifique se 8 é maior que 5 e imprima
result <- 8>5
print(result)

#verifique se 3 é menor ou igual a 10 e imprima
result <- 3<=10
print(result)

#Verifique se o numero 7 é menor que 5 e menor que 10
result <- 5<7 & 7<10
print(result)

#Verifique se o numero 12 é par e se esta entre 10 e 15
result <- (12%%2==0)&(10<12 & 12<15)
print(result)

#Verifique se um numero é multiplo de 3 ou 5 e se esta entre 20 e 30
num <- 25
result <- (num%%3==0 | num%%5==0) & (20<num & num<30)
print(result)

#Crie uma funcao que verifica se uma pessoa é elegivel para um premio com base
# nas seguintes condicores: deve ter mais de 18 anos
# e um membro ativo ou ter mais de 60 anos
elegibilidade<- function(idade, membro_ativo){
  return((idade>18 & membro_ativo) | (idade>60))
}
print(elegibilidade(25,TRUE))
print(elegibilidade(65,FALSE))
print(elegibilidade(30,FALSE))
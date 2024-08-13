#verifique se o numero é positivo
n <- 5
if (n>0){
  print("O número é positivo")
}else{
  print("O número é negativo")}

#verifique se uma palavra tem mais que 5 caracteres
word <- 'abracadabra'
if(nchar(word)>5){
  print("Palavra tem mais que 5 caracteres")
}else{
  print("Palavra tem menos que 5 caracteres")}

#Verifique se um um ano é bisexto
ano <- 2024
if((ano %% 4==0 & ano %% 100 != 0) | (ano %% 400 == 0)) {
  print("O ano é bisexto")
}else{
  print("O ano não é bisexto")
}

#verificar se um número está entre 10 e 20
num <- 21
if(num>=10 & num <=20){
  print("O Número está entre 10 e 20")
}else {
  print("O Número não está entre 10 e 20")
}

#Verifique se uma string contém letras e números
string <- "abc"
if(any(grepl("[A-Za-z]", string)) & any(grepl("[0-9]", string))){
  print("A string possui letras e números")
}else{
  print("A string náo possui letras e números")
}

#Verifique a faixa etária de uma pessoa e classifique em criança, adolescente, adulto, idoso)
idade = 25
if (idade <13){
  print("Criança") 
}else if(idade <18){
  print("Adolescente")
}else if(idade <60){
  print("Adulto")
}else {
  print("Alex")
}

#Determine a estação do ano no hemisferio sul baseada no mês (primavera verão oututono inverno)
mes <- 11
if (mes %in% c(6,7,8)){
  print("inverno")
}else if (mes %in% c(9,10,11)){
  print("primavera")
}else if (mes %in% c(12,1,2)){
  print("verão")
}else if (mes %in% c(3,4,5)){
  print("outono")
}else{
  print("mes invalido")
}

# Imprima os numeros de 1 a 10
for (i in 1:10){
  print(i)
}

# Imprima os elementos de uma lista
lista <- c(1,2,3,4,5)
for (i in lista){
  print(i)
}

#Imprima os elementos de um dicionario
dicionario <- list(a=1,b=2,c=3)
for(chave in names(dicionario)){
  print(paste("Chave: ",chave,"Valor: ",dicionario[[chave]]))
}

# Imprima numeros de 1 a 10 usando um laco while.
i <-1
while (i<11){
  print(i)
  i<-i+1
}


  
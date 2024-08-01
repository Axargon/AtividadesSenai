# Declaração de variáveis 
idade <- 47
altura = 1.76
nome <- "Alex"
brasileiro <- TRUE

print(nome)
print(altura)
print(idade)
print(brasileiro)


print(typeof(nome))
print(typeof(altura))
print(typeof(idade))
print(typeof(brasileiro))

#constante -- sem constante
PI <- 3.14159

#  nao há constantes declaráveis em R, apenas conevencionalmente
# se declara constantes em letras maiusculas, mas não são imutaveis

#string
mensagem <- "Qualquer coisa aqui"
print(mensagem)
print(typeof(mensagem))

#inteiro (double se nao declara variavel com L no final)
numero <- 100L
print(typeof(numero))

#data e hora
data_atual <- Sys.time()
print(data_atual)

#enumerar(factor) [variaveis categoricas]

DiasDaSemana <- factor(c("Segunda","Terca","Quarta","Quinta","Sexta"),levels = c("Segunda","Terca","Quarta","Quinta","Sexta"))

print(DiasDaSemana[3])



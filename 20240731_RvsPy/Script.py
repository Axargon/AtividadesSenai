#declaração de variáveis
nome = "Alex"
idade = 47
altura = 1.76
brasileiro = True

print(f"Nome, {nome}")
print(f"Idade, {idade}")
print(f"Altura, {altura}")
print(f"Brasileiro, {brasileiro}")

print(type(nome))
print(type(idade))
print(type(altura))
print(type(brasileiro))

PI = 3.14159 

''' 
 nao há constantes declaráveis em Python, apenas conevencionalmente
 se declara constantes em letras maiusculas, mas não são imutaveis
'''


#string

mensagem = "qualquer frase aqui"
print(mensagem)
print(type(mensagem))

#inteiro
numero = 100
print(type(numero))

# data e hora
from datetime import datetime
data_atual = datetime.now()
print(data_atual)

# enumerar
from enum import Enum

class diasDaSemana(Enum):
  Segunda = 1
  Terca = 2
  Quarta = 3
  Quinta = 4
  Sexta = 5
  
print(diasDaSemana.Quarta.value)
print(diasDaSemana.Quarta.name)  



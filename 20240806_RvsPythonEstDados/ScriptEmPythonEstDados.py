#Fatores em Python
# Exercício facil: crue um vetor de categorias (fatores) com as cores
# "vermelho", "azul" e "verde"

import pandas as pd
cores = pd.Categorical(['vermelho', 'azul', 'verde'])
print(cores)

# Exercício fácil: Crie um vetor de fatores os dias da semana e imprima-os.
import pandas as pd
semana = pd.Categorical(['segunda', 'terca', 'quarta', 'quinta', 'sexta'])
print(semana)

#Exercício Médio: Crie um vetor de fatores com as
#Categorias "baixo", "medio" e "alto" e ordene-os
import pandas as pd
niveis = pd.Categorical(["Baixo", "Alto", "Medio"], categories=["Baixo", "Medio", "Alto"], ordered=True)
print(niveis)

#Exercício Médio: Converta um vetor de fatores em um vetor numérico
import pandas as pd
categorias = pd.Categorical(["Baixo", "Alto", "Medio"], categories=["Baixo", "Medio", "Alto"], ordered=True)
numeros = categorias.codes
print(numeros)

#Crie um vetor de fatores com as categorias pequeno medio e grande e substitua pequeno por extra pequeno
import pandas as pd
tamanhos = pd.Categorical(['pequeno','medio','grande'], categories=['pequeno','medio','grande'], ordered = True)
tamanhos2 = tamanhos.rename_categories({'pequeno': 'extra pequendo'})
print(tamanhos)
print(tamanhos2)

#Crie um vetor de fatores com 100 elementos aleatorios entre baixo medio e alto 
#e calcule a frequencia de cada categoria
import pandas as pd
import random
categorias = ['baixo','medio','alto']
vetor = [random.choice(categorias) for _ in range(100)]
fatores = pd.Categorical(vetor, categories=categorias, ordered = True)
frequencias = pd.value_counts(fatores)
print(frequencias)

##############   LISTAS!!!   ##########################
#crie uma listaa contendo os numeros de 1 a 5
lista = [1,2,3,4,5]
print(lista)

#adicione o elemento "6" no final da lista criada
lista = [1,2,3,4,5]
lista.append(6)
print(lista)

#Remova o terceiro elemento da lista 1,2,3,4,5
lista = [1,2,3,4,5]
lista.pop(3)
print(lista)

#Inverta a ordem dos elementos da lista (1,2,3,4,5)
lista = [1,2,3,4,5]
#lista.reverse()
lista_invertida = lista[::-1]
print(lista_invertida)

#crie unma lista de liestas (matriz)
#de tamanho 3x3 e calcule a soma de cada linha
matriz = ([[1,2,3],[4,5,6],[7,8,9]])
soma_linhas = [sum(linha)for linha in matriz]
print(soma_linhas)

##############   Tuplas!!!   ##########################
# Crie uma tupla contendo os numeros de 1 a 5 e imprima
tupla =(1,2,3,4,5)
print(tupla)

#Acesse o terceiro elemento da tupla e imprima-o
tupla =(1,2,3,4,5)
print(tupla[2])

#Crie uma tupla contendo tres tuplas internas, e cada uma com dois elementos e a imprima
tupla = ((1,2),(3,4),(5,6))
print(tupla)

#Concatene  duas tuplas e imrprima o resultado
tupla1 = (1,2,3)
tupla2 = (3,4,5)
tupla_concatenada = (tupla1+ tupla2)
print(tupla_concatenada)

#Crie uma tupla (1,2,3,4,5) e verifique se o numero 3 esta na tupla
tupla =(1,2,3,4,5)
existe = 3 in tupla
print(existe)

#Crie uma tupla (1,2,3,4,5) e encontre o indice do numero 4
tupla = (1,2,3,4,5)
indice = tupla.index(4)
print(indice)

##############   Dicionario!!!   ##########################
#Crie um dicionario com as chaves "nome", "idade", "cidade" e os
#valores "Ana", 25 e "São Paulo" respectivamente
dicionario ={"nome":"Ana","idade":25, "cidade":"São Paulo" }
print(dicionario)

#Acesse o valor associado a chave idade no dicionario
dicionario ={"nome":"Ana","idade":25, "cidade":"São Paulo" }
idade = dicionario["idade"]
print(idade)

#Adicione  um novo par chave valor "profissao": "engenheira"
#ao dicionario anterior
dicionario = list(nome = "Ana", idade=25 , cidade="São Paulo")
dicionario["profissão"]= "engennheira"
print(dicionario)


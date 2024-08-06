# Vetores
#Crie um vetor com os números de 1 a 10 e imprima - 0
vetor = list(range(1,11))
print (vetor)

#Crie um vetor com os numeros pares de 2 a 20 e imprima-o
vetor = list(range(2,21,2))
print(vetor)

 #Calcule a soma dos elementos de um vetor com números de 1 a 100
 vetor = list(range(1,101))
 soma = sum(vetor)
 print(soma)
 
 #Encontre o maior e o menor valor em um vetor de números aleatórios 
 #entre 1 a2 1000, de tamanho 50 em python
 import random
 import numpy as np
 #vetor = random.sample(range(1000),50)
 vetor = np.random.randint(1,1001,size = 50)
 #vetor =[random.randint(1,1000) for _ in range(50)]
 minim = min(vetor)
 maxm = max(vetor)
 print(f"Maior: {maxm}, Menor:{minim}")
 
 # Crie um vetor com os 10 primeiros numeros primos
 def eh_primo(n):
   if n<=1:
     return False
   for i in range(2, int(n**0.5)+1):
     if n%i ==0: 
       return False
   return True
primos = []
num = 2
while len(primos)<10:
  if eh_primo(num):
    primos.append(num)
  num+=1
print(primos) 

#inverta a ordem de um vetor de tamanho 20 preenchido com numeros aleatorios
import random
vetor =[random.randint(1,100) for _ in range(20)]
vetor_invertido = vetor[::-1]
print(vetor)
print(vetor_invertido)

#Crie uma matriz 3x3 com os numeros de 1 a 9
import numpy as np
matriz = np.arange(1,10).reshape(3,3)
print(matriz)

#Crie uma matriz identidade de 4X4 e imprima -a 
import numpy as np
matriz = np.identity(4)
print(matriz)

#some duas matrizes 2x2
import numpy as np
matriz1 =np.array([[1,2],[3,4]])
matriz2 =np.array([[5,6],[7,8]])
matriz_soma = matriz1+matriz2
print(matriz_soma)

#multiplique duas matrizes 2x2

import numpy as np
matriz1 =np.array([[1,2],[3,4]])
matriz2 =np.array([[5,6],[7,8]])
matriz_mult = np.dot(matriz1,matriz2)
print(matriz_mult)

#calcule a transposta de uma matriz 3x3
import numpy as np
matriz = ([[1,2,3],[4,5,6],[7,8,9]])
matriz_transposta = np.transpose(matriz)
print(matriz_transposta)

# Calcule a determinante de uma matriz 3x3.
import numpy as np
matriz = ([[1,2,3],[4,5,6],[7,8,9]])
determ = np.linalg.det(matriz)
print(determ)


#Remova a chave 'cidade' do dicionario
dicionario = {"nome" : "Ana", "idade":25 , "cidade":"São Paulo","profissao" :"engenheira"}
del dicionario ["cidade"]
print(dicionario)

#Crie um dicionario aninhado para armazenar informacors de varias pessoas, onde
#cada pessoa tem um ome, idade e cidade
dicionario = {
          "pessoa1": {"nome" : "Ana", "idade":25 , "cidade":"São Paulo"},
          "pessoa2": {"nome" : "Carolina", "idade":32 , "cidade":"Araçariguama"},
          "pessoa3": {"nome" : "João", "idade":21 , "cidade":"Janiru"},
          "pessoa4": {"nome" : "Neto", "idade":40 , "cidade":"Pindamohangaba"}
          }
print(dicionario)

#Percorra oum dicionario aninhado e iprima as informacoes de cada pessoa no formato
#"nome: Ana, idade 25 cidade: Sao paulo"
dicionario = {
          "pessoa1": {"nome" : "Ana", "idade":25 , "cidade":"São Paulo"},
          "pessoa2": {"nome" : "Carolina", "idade":32 , "cidade":"Araçariguama"},
          "pessoa3": {"nome" : "João", "idade":21 , "cidade":"Janiru"},
          "pessoa4": {"nome" : "Neto", "idade":40 , "cidade":"Pindamohangaba"}
          }
          
for chave, valor in dicionario.items():
  print(f"Nome:{valor['nome']} Idade:{valor['idade']} Cidade:{valor['cidade']}")
  
####### Operadores! ###########
# Aritméticos
#Soma
soma = 10 + 20
print(soma)

#subtracao
subtracao = 30-15
print(subtracao)

#multiplicacao
mult = 5*7
print(mult)

#divisao
div = 81/9
print(div)

#exponenciacao
exp = 2**10
print(exp)

#resto da divisao
resto = 29 % 5
print(resto)

## Logicos 
# verifique se 8 é maior que 5 e imprima
result = 8>5
print(result)

#verifique se 3 é menor ou igual a 10 e imprima
result = 3<=10
print(result)

#Verifique se o numero 7 é menor que 5 e menor que 10
result = 5<7<10
print(result)

#Verifique se o numero 12 é par e se esta entre 10 e 15
result = (12%2==0)and(10<12<15)
print(result)

#Verifique se um numero é multiplo de 3 ou 5 e se esta entre 20 e 30
num = 25
result = (num%3==0 or num%5==0) and (20<num<30)
print(result)

#Crie uma funcao que verifica se uma pessoa é elegivel para um premio com base
# nas seguintes condicores: deve ter mais de 18 anos
# e um membro ativo ou ter mais de 60 anos
def elegibilidade(idade, membro_ativo):
  return(idade>18 and membro_ativo) or (idade>60)

print(elegibilidade(25,True))
print(elegibilidade(65,False))
print(elegibilidade(30,False))


  

  

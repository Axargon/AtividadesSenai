#Tratamento de Erros
try:
    resultado =10/0
except ZeroDivisionError:
    print("Divisao por zero não é definida")

#Implemente um bloco de try-except para capturar um indice fora dos limites de uma lista

lista =[1,2,3]

try:
    elemento = lista[5]
except IndexError:
    print("Indice fora dos limites da lista")

#Implemente um bloco try except para capturar uma chave inexistente de um dicionario

dicionario = {'a':1,'b':2,'c':3,'d':4,'e':5,'f':6}

try:
    chave = dicionario['h']
except KeyError:
    print("Chave não existe no dicionário.")

# Implementação extra
def main():
    try:
        num1 = float(input("Digite o primeiro numero "))
        num2 = float(input("Digite o segundo numero "))

        #tentar realizar a divisao
        resultado = num1/num2
    except ZeroDivisionError as e:
        print("Erro: Divisão por zero não 1permitida")
    except ValueError as e:
        print("Vai dividir por uma letra mano??")
    except Exception as e:
        print(f"Erro desconhecido: {e}")
    else:
        print(f"O resultado da divisão é: {resultado}")
    finally:
        print("Programa finalizado")
main()

#Capture e trate uma exceção ao converter uma string para um inteiro

word = "abc"
try:
    word = int(word)
except ValueError:
    print("Erro: Conversão de string para inteiro")

#Capture e trate exceções em opeações e listas aninhadas

dicionario = {'a':[1,2,3],'b':[4,5,6]}
try:
    elemento =dicionario["b"][5]
except KeyError:
    print("Erro: Chave inexistente no dicionário")
except IndexError:
    print("Erro: índice fora dos limites da lista")



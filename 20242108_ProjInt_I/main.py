from flask import Flask
from bd import Carros

#Instanciar o modulo Flask noa nossa variavel app

app = Flask('carros')

#Primeiro método parte - visualizar os dados (GET)
# app.route -> definir que esta função para que o Flask entenda que aquilo é um etodo que deve ser executado
@app.route('/carros', methods = ['GET'])
def get_carros():
    return Carros

#Primeiro método parte 2 visualizar dados por id (GET / ID)

#Segundo Método - criar novos dados (POST)

#Terceiro Método - Editar dados (PUT)

#Quarto Método - Deletar dados (DELETE)


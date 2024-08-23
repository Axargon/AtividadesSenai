from flask import Flask, jsonify, make_response, request
from bd import Carros

#Instanciar o modulo Flask noa nossa variavel app

app = Flask('carros')

#Primeiro método parte 1 - visualizar os dados (GET)
# app.route -> definir que esta função para que o Flask entenda que aquilo é um metodo que deve ser executado
@app.route('/carros', methods = ['GET'])
def get_carros():
    return Carros

#Primeiro método parte 2 visualizar dados por id (GET / ID)
@app.route('/carros/<int:id>', methods=['GET'])
def get_carros_id(id):
    for carro in Carros:
        if carro.get('id') == id:
            return jsonify(carro)

#Segundo Método - criar novos dados (POST)
@app.route('/carros', methods =['POST'])
def criar_carros():
    carro = request.json
    Carros.append(carro)
    return make_response(
        jsonify(mensagem='Carro cadastrado com sucesso', 
                carro=carro
                )
    )
#Terceiro Método - Editar dados (PUT)
@app.route('/carros/<int:id>',methods = ['PUT'])
def editar_carro_id(id):
    carro_alterado = request.get_json()
    for  indice, carro in enumerate(Carros):
        if carro.get('id') == id:
            Carros[indice].update(carro_alterado)
            return jsonify(Carros[indice])

#Quarto Método - Deletar dados (DELETE)
@app.route('/carros/<int:id>', methods =['DELETE'])
def excluir_carro(id):
    for indice, carro in enumerate(Carros):
        if carro.get('id')==id:
            del Carros[indice]
            return jsonify({"mensagem": "Carro excluiro com sucesso"})




app.run(port=5000, host = 'localhost')


from flask import Flask, jsonify, make_response, request
from bd import Env

#instanciar o modo flask
app = Flask('env')

# Primeiro método parte 1 - visualizar os dados (GET)
# app.route -> definir que esta função para que o Flask entenda que aquilo é um metodo que deve ser executado
@app.route('/env', methods =['GET'])
def get_env():
    return Env

#Primeiro método parte 2 visualizar dados por id (GET / ID)
@app.route('/env/<int:id>', methods =['GET'])
def get_env_id(id):
    for env in Env:
        if env.get('id')==id:
            return jsonify(env)
        
#Segundo Método - criar novos dados (POST)
@app.route('/env', methods = ['POST'])
def criar_env():
    novo_env = request.json
    Env.append(novo_env)
    return make_response(
        jsonify(mensagem = 'Nova métrica criada com sucesso: ', 
                env =novo_env                
               )
    )
#Terceiro Método - Editar dados (PUT)
@app.route('/env/<int:id>', methods = ['PUT'])
def atuz_env(id):
    env_alterado = request.json
    for indx, env in enumerate(Env):
        if env.get('id')==id:
            Env[indx].update(env_alterado)
            return jsonify(Env[indx])

#Quarto Método - Deletar dados (DELETE)
@app.route('/env/<int:id>', methods = ['DELETE'])
def delete_env(id):
    for indx, env in enumerate(Env):
        if env.get('id')==id:
            del Env[indx]
            return jsonify({"mensagem":'Dado deletado com sucesso'})

app.run(port='5000',host='localhost')
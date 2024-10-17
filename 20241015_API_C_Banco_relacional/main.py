
import json # para trabalhar com o json
from flask import Flask, Response, request # ferrameta que o python disponibiliza
from flask_sqlalchemy import SQLAlchemy #conexão com o banco de dados

app = Flask('carros') 

# haverá modificações em nosso bd. Por padrão em aplicações em produção default = FALSE
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] =  True 

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:senai%40134@127.0.0.1/bd_carro' #variável que 
# qual banco estamos usando // usuario : senha @ endereco de ip / nome do projeto

#Definimos a estrutura da tabela tb_carros
mybd = SQLAlchemy(app)
class Carros(mybd.Model):
    __tablename__='tb_carro'
    id = mybd.Column(mybd.Integer, primary_key = True)
    marca = mybd.Column(mybd.String(100))
    modelo = mybd.Column(mybd.String(100))
    valor = mybd.Column(mybd.Float)
    cor = mybd.Column(mybd.String(100))
    numero_vendas = mybd.Column(mybd.Float)
    ano = mybd.Column(mybd.String(10))

# converter objetos em json
    def to_json(self): # converter tabela em json
        return{
            'id':self.id
            ,'marca':self.marca
            ,'modelo': self.modelo
            ,'valor': self.valor
            ,'cor': self.cor
            ,'numero_vendas': self.numero_vendas
            ,'ano': self.ano
        }

# *******************************API*************************** #
# Selecionar tudo (GET)
@app.route("/carros", methods = ["GET"])
def selecionar_carros():
    # executa uma consulta no banco de dados para obter todos os carros do banco de dados
    # métoo qurey.all()retorna uma lista de objetos 'carros'
    carro_objetos = Carros.query.all()
    carro_json = [carro.to_json()for carro in carro_objetos]
    return gera_response(200, "carros", carro_json)

#seleciona individual (por id)
@app.route("/carros/<id>", methods = ["GET"])
def seleciona_carro_id(id):
    carro_objetos = Carros.query.filter_by(id=id).first()
    carro_json = carro_objetos.to_json()
    return gera_response (200, "carros", carro_json)

#cadastrar
@app.route("/carros", methods = ["POST"])
def criar_carro():
    body = request.get_json()
    try:
        carro = Carros(
            id = body['id']
            ,marca= body['marca']
            ,modelo= body['modelo']
            ,valor= body['valor']
            ,cor= body['cor']
            ,numero_vendas= body['numero_vendas']
            ,ano= body['ano']
            )
        mybd.session.add(carro)
        mybd.session.commit()

        return gera_response(201, "carros", carro.to_json(), "Criado com sucesso!!")
    except Exception as e:
        print('Erro', e)
        return gera_response(400, "carros", {}, "Erro ao cadastrar!!")
# # Atualizar
@app.route("/carros/<id>", methods = ["PUT"])
def atualizar_carro(id):
     # consulta por id
     carro_objeto = Carros.query.filter_by(id=id).first()
     # corpo da requisição
     body = request.get_json()
     try:
        if('marca' in body):
            carro_objeto.marca =  body['marca']
        if('modelo'in body):
            carro_objeto.modelo =  body['modelo']
        if('valor'in body):
            carro_objeto.modelo =  body['valor']
        if('cor'in body):
            carro_objeto.modelo =  body['cor']
        if('numero_vendas'in body):
            carro_objeto.modelo =  body['numero_vendas']
        if('ano'in body):
            carro_objeto.modelo =  body['ano']

        mybd.session.add(carro_objeto)
        mybd.session.commit()

        return gera_response(200, "cassos", carro_objeto.to_json(),"Atualizado com sucesso!")
     except Exception as e:
         print('Erro',e)
         return gera_response(400,"carros",{},"Erro ao atualizar")

# Deletar
@app.route("/carros/<id>",methods = ["DELETE"])
def deletar_carro(id):
    carro_objeto = Carros.query.filter_by(id=id).first()

    try:
        mybd.session.delete(carro_objeto)
        mybd.session.commit()

        return gera_response(200, "carros", carro_objeto.to_json(), "Deletado com sucesso!")
    except Exception as e:
        print('Erro',e)
        return gera_response(400, "carro",{},"Erro ao deletar")
        
    



def gera_response(status, nome_conteudo, conteudo, mensagem=False):
    body = {}
    body[nome_conteudo] = conteudo

    if(mensagem):
        body['mensagem'] = mensagem

    return Response(json.dumps(body), status = status, mimetype = "application/json")

app.run(port=5000, host='localhost',debug=True)


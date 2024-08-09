
# Crie um sistema simples de gerenciamento de contatos que permita adicionar novos
# contatos, remover contatos e listar todos os contatos com seus detalhes. O
# sistema deve utilizar variáveis e operações diretamente, sem a utilização de
# funções.

contatos = {
          "pessoa1": {"nome" : "Ana", "telefone":"159183338" , "email":"aninha@dazueira.com"}
          }

#adicionar contatos:
contatos ['pessoa2'] = ('Guilherme','1185938491','gui@zuado.com')
contatos ['pessoa3'] = ('karen','118985311','kar@vakinha.com')
contatos ['pessoa4'] = ('AlHalb','1159134677','galbah@zureta.com')
#deletar contatos:
del contatos['pessoa4']
print(contatos)

for chave, valor in contatos.items():
  print(f"Nome:{valor['nome']} telefone:{valor['telefone']} email:{valor['email']}")

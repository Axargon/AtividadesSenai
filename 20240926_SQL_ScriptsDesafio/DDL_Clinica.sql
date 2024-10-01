CREATE DATABASE db_clinica;
USE db_clinica;

/*
1. Tabela: Veterinários
o Campos:
 id_veterinario (int, chave primária)
 nome (varchar)
 especialidade (varchar)
 telefone (varchar)
*/
CREATE TABLE tb_veterinario(
	id_vet INT(10) NOT NULL
    ,nome VARCHAR(100) NOT NULL
    ,especialidade VARCHAR(100) NOT NULL
    ,telefone VARCHAR(100) NOT NULL
    ,PRIMARY KEY(id_vet)
);
  
/*2. Tabela: Clientes
o Campos:
 id_cliente (int, chave primária)
 nome (varchar)
 endereco (varchar)
 telefone (varchar)*/
CREATE TABLE tb_cliente(
	id_cliente INT(10) NOT NULL
    ,nome VARCHAR(100) NOT NULL
    ,endereco VARCHAR(300) NOT NULL
    ,telefone VARCHAR(60) NOT NULL
    ,PRIMARY KEY(id_cliente)
);

/*3. Tabela: Pets
o Campos:
 id_pet (int, chave primária)
 nome (varchar)
 tipo (varchar)
 raca (varchar)
 data_nascimento (date)
 id_cliente (int, chave estrangeira que referencia Clientes(id_cliente))*/
CREATE TABLE tb_pet(
	id_pet INT(10) NOT NULL
    ,nome VARCHAR(100) NOT NULL
    ,tipo VARCHAR(100) NOT NULL
    ,raca VARCHAR(100) NOT NULL
    ,dt_nasc DATE NOT NULL
    ,id_cliente INT(10) NOT NULL
    ,PRIMARY KEY (id_pet)
    ,FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
);

/*4. Tabela: Atendimentos
o Campos:
 id_atendimento (int, chave primária)
 id_pet (int, chave estrangeira que referencia Pets(id_pet))
 id_veterinario (int, chave estrangeira que referencia
Veterinarios(id_veterinario))
 data_atendimento (date)
 descricao (varchar)
*/
CREATE TABLE tb_atendimento(
	id_atendimento INT(10) NOT NULL
    ,id_pet INT(10) NOT NULL
    ,id_veterinario INT (10) NOT NULL
    ,dt_atendimento DATE NOT NULL
    ,descricao VARCHAR(500) NOT NULL
    ,PRIMARY KEY(id_atendimento)
    ,FOREIGN KEY(id_pet) REFERENCES tb_pet(id_pet)
    ,FOREIGN KEY(id_veterinario) REFERENCES tb_veterinario(id_vet)
);
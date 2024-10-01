CREATE DATABASE db_biblioteca;
USE db_biblioteca;
-- DDL
CREATE TABLE tb_autores(
	id_autor INT(10) NOT NULL
    ,nome VARCHAR(100) NOT NULL
    ,data_nascimento DATE NOT NULL
    ,PRIMARY KEY(id_autor)
	);
    
CREATE TABLE tb_livros(
	id_livro INT(10) NOT NULL
    ,titulo VARCHAR(100) NOT NULL
    ,ano_publicacao INT(10) NOT NULL
    ,id_autor INT(10)
    ,PRIMARY KEY(id_livro)
    ,FOREIGN KEY(id_autor) REFERENCES tb_autores(id_autor)
);

CREATE TABLE tb_membros(
	id_membro INT(10) NOT NULL
    ,nome VARCHAR(100) NOT NULL
    ,data_adesao DATE NOT NULL
    ,PRIMARY KEY(id_membro)
);

CREATE TABLE tb_emprestimos(
	id_emprestimo INT(10) NOT NULL
    ,id_membro INT(10) NOT NULL
    ,id_livro INT(10) NOT NULL
    ,dt_emprestimo DATE
    ,dt_devolucao DATE
    ,PRIMARY KEY(id_emprestimo)
    ,FOREIGN KEY(id_membro) REFERENCES tb_membros(id_membro)
    ,FOREIGN KEY(id_livro) REFERENCES tb_livros(id_livro)
);

-- DML EXERCICIO 3. Inserir ao menos 3 valores em cada tabela
INSERT INTO tb_autores VALUES(
	'1','Agatha Christe','1939-08-03'
);

);
INSERT INTO tb_autores VALUES(
	'3','Miguel Servantes','1914-07-28'
);

INSERT INTO tb_livros VALUES(
	'1','O misterio dos 7 relogios','1929','1'
);

INSERT INTO tb_livros VALUES(
	'2','O crime e o castigo','1'
/*

*/
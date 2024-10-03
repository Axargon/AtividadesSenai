CREATE DATABASE db_biblioteca;
USE db_biblioteca;

SET @@autocommit = ON;
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
INSERT INTO tb_autores VALUES(
	'3','Miguel Servantes','1914-07-28'
);
INSERT INTO tb_autores VALUES(
	'2','Fedor Dostoyevsky','1839-03-11'
);
INSERT INTO tb_autores VALUES(
	'4','Jane Austin','1775-12-16'
);

UPDATE tb_autores SET nome = "Jane Austin"  WHERE id_autor = 4;


INSERT INTO tb_livros VALUES(
	'1','O misterio dos 7 relogios','1929','1'
);
INSERT INTO tb_livros VALUES(
	'2','O crime e o castigo','1861','2'
);
INSERT INTO tb_livros VALUES(
	'3','Dom Quixote','1919','3'
);
INSERT INTO tb_livros VALUES(
	'4','Orgulho e Preconceito','1813','4'
);

INSERT INTO tb_membros VALUES(
	'10','Richardson Celeveu','2024-01-01'
);
INSERT INTO tb_membros VALUES(
	'12','Andreleuza Gerevis','2024-01-02'
);
INSERT INTO tb_membros VALUES(
	'14','Hesveralda Sincleir','2024-01-03'
);
INSERT INTO tb_membros VALUES(
	'16','Chulifina Doronha','2024-01-04'
);

INSERT INTO tb_emprestimos VALUES(
	'100','10','1','2024-06-02','2024-06-17'
);
INSERT INTO tb_emprestimos VALUES(
	'101','12','1','2024-07-01','2024-07-16'
);
INSERT INTO tb_emprestimos VALUES(
	'102','14','3','2024-07-05','2024-07-20'
);
INSERT INTO tb_emprestimos VALUES(
	'104','10','2','2024-07-08','2024-07-25'
);

-- a. O livro com a data de publicação mais antigo
(SELECT
	*
FROM 
	tb_livros
WHERE
	ano_publicacao = (SELECT MIN(ano_publicacao) FROM tb_livros)
);
    
-- b. O livro com a data de publicação mais recente
(SELECT
	*
FROM 
	tb_livros
WHERE
	ano_publicacao = (SELECT MAX(ano_publicacao) FROM tb_livros)
);
-- c. A quantidade de livros cadastrados no banco de dados

(SELECT
	count(id_livro)
FROM 
	tb_livros
);
-- d. Consulte apenas os livros que possuam a data de devolução em 18-07-2024

(SELECT
	*
FROM 
	tb_emprestimos
WHERE
	dt_devolucao = '2024-06-17'
);
-- e. Ordene o nome dos autores em ordem crescente

(SELECT
	*
FROM 
	tb_autores
ORDER BY nome ASC
);

-- f. Ordene o nome dos livros em ordem decrescente
(SELECT
	*
FROM 
	tb_livros
ORDER BY titulo ASC
);

/*EXERCÍCIO 5. Utilize subqueries para realizar as seguintes consultas:*/
-- a. Liste os autores que possuem livros com ano de publicação maior que a média de anos de publicao dos livros calculasos
/*SELECT
	aut.nome
FROM
	tb_autores aut
    INNER JOIN tb_livros lvr
			ON aut.id_autor = lvr.id_autor
WHERE
	ano_publicacao > (SELECT AVG(ano_publicacao) FROM tb_livros);
 */
(SELECT
	nome
 FROM 
	tb_autores
 WHERE
	id_autor IN (SELECT 
					id_autor
				 FROM 
					 tb_livros 
				 WHERE 
                     ano_publicacao > (SELECT 
										  AVG(ano_publicacao) 
									   FROM 
										   tb_livros
									)
				 )
);

-- b. Encontre os membros que realizaram mais de um empréstimo.
(SELECT
	nome
FROM
	tb_membros
WHERE 
	id_membro IN (SELECT
					  id_membro
				  FROM
					  tb_emprestimos
				  GROUP BY
					  id_membro 
				  HAVING
                      COUNT(id_membro) >1
				  )
);

-- c. Liste os livros que foram emprestados ao menos uma vez.    
(SELECT
	titulo
FROM
	tb_livros
WHERE 
	id_livro IN (SELECT
					  id_livro
				  FROM
					  tb_emprestimos
				  )
);

-- d. Consulte os livros que ainda não foram emprestados.
(SELECT
	titulo
FROM
	tb_livros
WHERE 
	id_livro NOT IN (SELECT
					  id_livro
				  FROM
					  tb_emprestimos
				  )
);

SELECT 
	aut.id_autor
    ,aut.nome
    ,lvr.id_livro
    ,lvr.titulo
    ,lvr.ano_publicacao
FROM
	tb_autores aut
	RIGHT JOIN tb_livros lvr
            ON aut.id_autor = lvr.id_autor
UNION    
SELECT 
	lvr.id_autor
    ,mbr.nome
    ,lvr.id_livro
    ,lvr.titulo
    ,lvr.ano_publicacao
FROM
	tb_emprestimos emp
    LEFT JOIN tb_livros lvr
		   ON emp.id_livro = lvr.id_livro
	LEFT JOIN tb_membros mbr
		   ON mbr.id_membro = emp.id_membro
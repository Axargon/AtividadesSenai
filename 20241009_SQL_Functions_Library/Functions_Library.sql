/*BIBLIOTECA
Exercicio 1. Crie uma função que recebe o id_autor e retorna a idade do autor
com base na data de nascimento.
Exercicio 2. Crie uma função que recebe o id_autor e retorna a quantidade de
livros escritos por esse autor.
Exercicio 3. Crie uma função que recebe duas datas e retorna o total de
empréstimos realizados nesse período.
Exercicio 4. Crie uma função que retorna a média de dias em que os livros
foram emprestados.*/
USE db_biblioteca;
-- Exercicio 01
DELIMITER $$
CREATE FUNCTION IdadeAutor (id INT(10))
RETURNS DECIMAL (10)
READS SQL DATA
	BEGIN
		DECLARE idade DECIMAL(10,2);
		SELECT TIMESTAMPDIFF(YEAR,NEW.data_nascimento, CURDATE()) INTO idade FROM tb_autores WHERE id_autor = id;
        RETURN idade;
    END $$
DELIMITER ;

-- Exercicio 02
DELIMITER $$
CREATE FUNCTION QtdLivro (id INT(10))
RETURNS INT (10)
READS SQL DATA
	BEGIN
		DECLARE qtd DECIMAL(10,2);
		SELECT COUNT(id_livro) INTO qtd FROM tb_livros WHERE id_autor = id;
        RETURN qtd;
    END $$
DELIMITER ;

-- Exercicio 3.
DELIMITER $$
CREATE FUNCTION livrosEntreDatas (inicio DATE, fim DATE)
RETURNS INT (10)
READS SQL DATA
	BEGIN
		DECLARE qtd INT(10);
		SELECT COUNT(id_livro) INTO qtd FROM tb_emprestimos WHERE dt_emprestimo >= inicio AND dt_emprestimo <= fim;
        RETURN qtd;
    END $$
DELIMITER ;

-- Exercicio 4.
DELIMITER $$
CREATE FUNCTION MediaDiasEmprestimo()
RETURNS DECIMAL(10,2)
READS SQL DATA
	BEGIN
		DECLARE media DECIMAL(10,2);
		SELECT AVG(TIMESTAMPDIFF(DAY, dt_emprestimo, dt_devolucao)) INTO media FROM tb_emprestimos;
		RETURN media;
	END $$
DELIMITER ;

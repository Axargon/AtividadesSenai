USE db_biblioteca;
/*EXERCICIO 1. Crie uma stored procedure que insira um novo autor na tabela Autores.*/
DELIMITER $$
CREATE PROCEDURE InserirAutor(IN id_p INT(10), IN nome_p VARCHAR(100) , IN data_nascimento_p DATE)
    BEGIN
		INSERT INTO tb_autores(id, nome, data_nascimento)
        VALUES (id_p, nome_p , data_nascimento_p);
    END $$
DELIMITER ;

/*EXERCICIO 2. Crie uma stored procedure para atualizar a data de devolução de um empréstimo já registrado.*/
DELIMITER $$
CREATE PROCEDURE ConfigurarDataDevolucao (IN id_emprestimo_p INT(10), IN dt_emprestimo_p DATE)
	BEGIN
		UPDATE tb_emprestimo SET dt_devolucao = ADDDATE(NEW.dt_emprestimo, INTERVAL 15 DAY) WHERE id_emprestimo = id_emprestimo_p;
	END $$
DELIMITER ;

/*EXERCICIO 3. Crie uma stored procedure que consulte todos os livros emprestados por um determinado membro, 
retornando os títulos dos livros e as datas de
empréstimo.*/
DELIMITER $$
CREATE PROCEDURE consultaCapivara (IN id_membro_p INT(10))
	BEGIN
		SELECT 
			lv.titulo
            ,emp.dt_emprestimo
        FROM
			tb_emprestimos emp
            INNER JOIN tb_livros lv
					ON lv.id_livro = emp.id_livro
        WHERE
			emp.id_membro = id_membro_p;
	END $$
DELIMITER ;

/*EXERCICIO 4. Crie uma stored procedure que registre um novo empréstimo, verificando se o membro e o livro existem.*/
DELIMITER $$
CREATE PROCEDURE RegistraEmprestimo (IN id_emprestimo_p INT(10),IN id_membro_p INT(10), IN id_livro_p INT(10))
	BEGIN
		IF	id_membro_p IN (SELECT id_membro FROM tb_membros) AND id_livro_p IN (SELECT id_livro FROM tb_livros) 
				THEN 
					INSERT INTO tb_emprestimo VALUES(id_emprestimo_p,id_membro_p,id_livro_p,NOW(), ADDDATE(NOW(), INTERVAL 15 DAY));
				ELSE
					SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'O membro ou livro inexistentes ';
		END IF;
	END $$
DELIMITER ;

--                                           CLINICA                
USE db_clinica;

/*EXERCICIO 1. Crie uma stored procedure que adicione um novo veterinário na tabela Veterinarios.*/
DELIMITER $$
CREATE PROCEDURE InserirVet(IN id_vet_p INT(10), IN nome_p VARCHAR(100) ,IN especialidade_p VARCHAR(30), IN telefone_p INT (20))
    BEGIN
		INSERT INTO tb_autores(id_vet, nome , especialidade, telefone)
        VALUES (id_p, nome_p , especialisade_p,telefone_p);
    END $$
DELIMITER ;

/*EXERCICIO 2. Crie uma stored procedure para atualizar os dados de um cliente, como nome, endereço e telefone.*/
DELIMITER $$
CREATE PROCEDURE AtualizaCliente (IN id_cliente_p INT(10), IN nome_p VARCHAR (30), IN endereco_p VARCHAR (255), IN telefone_p INT (20))
	BEGIN
		UPDATE 
			tb_cliente
		SET 
			nome = nome_p
            ,endereco = endereco_p
            ,telefone = telefone_p
		WHERE 
			id_cliente = id_cliente_p;
	END $$
DELIMITER ;

/*EXERCICIO 3. Crie uma stored procedure que registre um novo atendimento de um pet, verificando se o veterinário e o pet existem.*/
DELIMITER $$
CREATE PROCEDURE RegistraAtendimento (IN id_atendimento_p INT(10),IN id_pet_p INT(10), IN id_veterinario_p INT(10),IN descricao_p VARCHAR(500))
	BEGIN
		IF	id_pet_p IN (SELECT id_pet FROM tb_pet) AND id_veterinario_p IN (SELECT id_vet FROM tb_veterinario) 
				THEN 
					INSERT INTO tb_atendimento VALUES(id_atendimento_p,id_pet_p,id_veterinario_p,NOW(), descricao_p);
				ELSE
					SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'ID pet ou id veterinario inexistente ';
		END IF;
	END $$
DELIMITER ;


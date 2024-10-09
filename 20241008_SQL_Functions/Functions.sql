/*CLINICA VETERINÁRIA
Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de
pets que esse cliente possui.
Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última
consulta do pet.
Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total
de atendimentos feitos por ele.
Exercicio 4. Crie uma função que receba o id_pet e retorne o nome do dono
(cliente) desse pet.*/
USE db_clinica;
-- Exercicio 1.
DELIMITER $$
CREATE FUNCTION TotalPets (id INT (10))
RETURNS INT (10)
READS SQL DATA
	BEGIN
		DECLARE total INT(10);
        SELECT COUNT(id_pet) INTO total FROM tb_pet WHERE id_cliente= id;
        RETURN total;
    END $$
DELIMITER ;

-- Exercicio 2.
DELIMITER $$
CREATE FUNCTION ultmConsul (id INT(10))
RETURNS DATE
READS SQL DATA
	BEGIN
		DECLARE dt_UltmCOns DATE;
        SELECT MAX(dt_atendimento) INTO dt_UltmCOns FROM tb_atendimento WHERE id_pet = id;
        RETURN dt_UltmCOns;
    END $$
DELIMITER ;

-- Exercicio 3.
DELIMITER $$
CREATE FUNCTION TotalConsultas (id INT(10))
RETURNS INT(10)
READS SQL DATA
	BEGIN
		DECLARE totalConsulta INT (10);
        SELECT COUNT(id_atendimento) INTO totalConsulta FROM tb_atendimento WHERE id_veterinario = id;
        RETURN totalConsulta;
    END $$
DELIMITER ;

-- Exercicio 4.
DELIMITER $$
CREATE FUNCTION nomeCliente (id INT (10))
RETURNS VARCHAR(30)
READS SQL DATA
	BEGIN
		DECLARE cliente VARCHAR (30);
			SELECT 
				cl.nome INTO cliente
			FROM 
				tb_cliente cl
				INNER JOIN tb_pet pt
						ON cl.id_cliente = pt.id_cliente
			WHERE
				pt.id_pet = id;
		RETURN 	cliente;	
    END $$



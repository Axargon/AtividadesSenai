CREATE DEFINER=`root`@`localhost` TRIGGER `tb_proprietario_BEFORE_INSERT` BEFORE INSERT ON `tb_proprietario` FOR EACH ROW 
BEGIN
	SET NEW.idade = TIMESTAMPDIFF(YEAR,NEW.data_nascimento, CURDATE());
END;

CREATE DEFINER=`root`@`localhost` TRIGGER `tb_autores_BEFORE_INSERT` BEFORE INSERT ON `tb_autores` FOR EACH ROW BEGIN
	IF TIMESTAMPDIFF(YEAR,NEW.data_nascimento, CURDATE()) < 18
		THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Proibido a inserção de autores menores que 18 anos';
	END IF;	
END;

/*Exercicio 2. Criar uma trigger que atualize automaticamente a data de devolução para 15 dias após a data de empréstimo. */

CREATE DEFINER=`root`@`localhost` TRIGGER `tb_emprestimos_BEFORE_INSERT` BEFORE INSERT ON `tb_emprestimos` FOR EACH ROW BEGIN
	SET NEW.dt_devolucao = ADDDATE(NEW.dt_emprestimo, INTERVAL 15 DAY);
END;

/*Exercicio 5. Criar uma trigger que impeça a inserção de autores com nomes duplicados.*/

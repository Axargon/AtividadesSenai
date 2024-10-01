USE db_clinica;
--  EXERCICIO 4. Realize as seguintes consultas:

-- a. O pet com a data de nascimento mais antigo
(SELECT 
	* 
FROM 
	tb_pet
WHERE 
	dt_nasc = (SELECT min(dt_nasc) FROM tb_pet)
);
-- b. O pet com a data de nascimento mais recente
(SELECT 
	* 
FROM 
	tb_pet
WHERE 
	dt_nasc = (SELECT max(dt_nasc) FROM tb_pet)
);
-- c. A quantidade de pets cadastrados no banco de dados
(SELECT
	count(id_pet)
 FROM 
	tb_pet
);
 -- d. Ordene o nome dos pets em ordem crescente
(SELECT
	nome
 FROM 
	tb_pet
 ORDER BY 
    nome ASC
);
-- e. Ordene o nome dos pets em ordem decrescente
(SELECT
	nome
 FROM 
	tb_pet
 ORDER BY 
    nome DESC
);
-- f. Ordene o nome dos veterinários em ordem crescente
(SELECT
	nome
 FROM 
	tb_veterinario
 ORDER BY 
    nome ASC
);
-- g. Ordene o nome dos veterinários em ordem decrescente
(SELECT
	nome
 FROM 
	tb_veterinario
 ORDER BY 
    nome DESC
);
-- h. A data de atendimento mais antiga
(SELECT
	min(dt_atendimento)
 FROM
	tb_atendimento
);
-- i. A data de atendimento mais recente
(SELECT
	MAX(dt_atendimento)
 FROM
	tb_atendimento
);

USE db_clinica;

/*INNER JOIN*/
-- 1) LISTE os nomes dos clientes e os nomes dos pets que pertencem a eles
(SELECT 
	cl.nome
    ,pt.nome
FROM 
	tb_pet pt
	INNER JOIN tb_cliente cl
			 ON pt.id_cliente = cl.id_cliente
);

-- 2) Liste os veterinarios e os atendimentos realizados
(SELECT 
	vt.nome
    ,dt_atendimento
    ,descricao
FROM 
	tb_atendimento atm
    INNER JOIN tb_veterinario vt
			ON vt.id_vet = atm.id_veterinario
);

-- 3) Liste todos os pets e os detalhes de seus atentimentos (incluindo o nome do veterinario
(SELECT
	pt.nome nome_pet
    ,cl.nome nome_dono
    ,vt.nome nome_veter
    ,atm.dt_atendimento
    ,atm.descricao
FROM
	tb_atendimento atm
    INNER JOIN tb_pet pt
			ON pt.id_pet = atm.id_pet
	INNER JOIN tb_veterinario vt
            ON atm.id_veterinario = vt.id_vet
	INNER JOIN tb_cliente cl
            ON cl.id_cliente = pt.id_cliente
);

-- 4) Liste o nome dos pets, seus donos e o veterinario responsavel pelos seus ultimos atendimentos
(SELECT
	pt.nome nome_pet
    ,cl.nome nome_dono
    ,vt.nome nome_veter
	,atm.descricao
    ,MAX(atm.dt_atendimento)
FROM
	tb_atendimento atm
    INNER JOIN tb_pet pt
            ON pt.id_pet = atm.id_pet
	INNER JOIN tb_veterinario vt
            ON atm.id_veterinario = vt.id_vet
	INNER JOIN tb_cliente cl
            ON cl.id_cliente = pt.id_cliente
GROUP BY
	1,2,3,4
);

/*RIGHT JOIN*/
-- 1) Liste todos os veterinarios e os atendimentos que realizaram, incluindo aqueles que ainda náo realizaram nenhum atendimento
(SELECT
	*
FROM 
	tb_atendimento atm
    RIGHT JOIN tb_veterinario vt
			ON vt.id_vet = atm.id_veterinario
);

-- 2) Liste todos os clientes e os pets que possuem incluindo clientes que ainda náo tem pets
(SELECT
	*
FROM
	tb_cliente cl
	LEFT JOIN tb_pet pt
		   ON cl.id_cliente = pt.id_cliente
);

-- 3) Liste todos os veterinarios e atendimentos que ainda não realizaram atendimentos e atendimentos que não tem veterinarios
(SELECT
	*
FROM 
	tb_atendimento atm
    RIGHT JOIN tb_veterinario vt
			ON vt.id_vet = atm.id_veterinario
);

-- 4)Liste todos os pets e atendimentos realizados que não foram atentidos e atendimentos sem pets associados
(SELECT
	* 
FROM
	tb_atendimento atm
    RIGHT JOIN tb_pet pt
			ON atm.id_pet = pt.id_pet
);

/*OUTER JOIN*/
-- 1)Liste todos os pets e seus clientes incluindo pets que náo tem clientes associados e clientes que náo tem pets cadastrados
(SELECT
	*
FROM
	tb_cliente cl
    RIGHT JOIN tb_pet pt
            ON pt.id_cliente = cl.id_cliente
UNION
SELECT
	*
FROM
	tb_cliente cl
    LEFT JOIN tb_pet pt
            ON pt.id_cliente = cl.id_cliente	
);

-- 2) Liste todos os atendimentos e os pets, incluindo atendimento que náo tem pets associados e pets que náo tem atendimentoregistrados
(SELECT
	*
FROM
	tb_atendimento atm
    LEFT JOIN tb_pet pt
           ON pt.id_pet = atm.id_pet
UNION
SELECT
	*
FROM
	tb_atendimento atm
    RIGHT JOIN tb_pet pt
           ON pt.id_pet = atm.id_pet
);

-- 3) LISTE todos os veterinarios e atendimentos, incluindo veterinarios que ainda nao realizaram atendimento e atensimentos que nao tem veterinarios associados
(SELECT
	*
FROM
	tb_atendimento atm
    LEFT JOIN tb_veterinario vt
		   ON atm.id_veterinario = vt.id_vet
UNION
SELECT
	*
FROM
	tb_atendimento atm
    RIGHT JOIN tb_veterinario vt
		   ON atm.id_veterinario = vt.id_vet
);

-- 4 Liste todos os pets e atendimentos realizados, incluindo pets que náo foram atendidos e atendimentos sem pets associados
(SELECT
	*
FROM
	tb_atendimento atm
    LEFT JOIN tb_pet pt
            ON pt.id_pet=atm.id_pet
UNION
SELECT
	*
FROM
	tb_atendimento atm
    RIGHT JOIN tb_pet pt
            ON pt.id_pet=atm.id_pet
);
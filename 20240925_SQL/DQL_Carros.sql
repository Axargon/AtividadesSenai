USE bd_carros;

SELECT
	id
    ,marca
    ,modelo
FROM
	tb_carro;
    
SELECT
	max(valor)
FROM 
	tb_carro;
-- WHERE;

(SELECT 
	marca
    ,modelo
    ,ano
    ,valor
FROM
	tb_carro
WHERE
	valor=(SELECT 
			  min(valor)
		   FROM
			  tb_carro
		    )
);

(SELECT
	*
FROM
	tb_carro
WHERE
	valor >60000);

(SELECT
	COUNT(id)
FROM
	tb_carro
);

(SELECT
	COUNT(DISTINCT marca)
FROM
	tb_carro
);
(SELECT 
	SUM(valor)
FROM
	tb_carro
);

(SELECT
	*
FROM
	tb_carro
ORDER BY
	modelo ASC -- DESC
);

(SELECT
	marca
    ,count(id) AS qtd_carros
FROM
	tb_carro
WHERE
	ano BETWEEN 2000 and 2018
GROUP BY
	1
);
	
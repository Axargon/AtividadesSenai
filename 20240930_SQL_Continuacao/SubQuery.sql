USE bd_carro;

(SELECT
	* 
FROM
	tb_carro
WHERE 
	valor > (SELECT AVG(valor) FROM tb_carro));

(SELECT 
	*
FROM 
	tb_proprietario
WHERE
	id_carro = (SELECT id FROM tb_carro WHERE marca = 'Hunday'));
    


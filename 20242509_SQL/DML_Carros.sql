USE bd_carrro;

SELECT * FROM tb_carro;

INSERT INTO tb_carro VALUES(
	'1'
    ,'Fiat'
    ,'Uno'
    ,'20000.00'
    ,'Verde'
    ,'50000'
    ,'1990' 
);
INSERT INTO tb_carro VALUES(
	'2'
    ,'Toyota'
    ,'Corola'
    ,'60000.00'
    ,'Cinza'
    ,'20000'
    ,'2005' 
);
INSERT INTO tb_carro VALUES(
	'3'
    ,'Honda'
    ,'Civic'
    ,'40000.00'
    ,'Preto'
    ,'1500'
    ,'2001' 
);
INSERT INTO tb_carro VALUES(
	'4'
    ,'Ford'
    ,'Ka'
    ,'35000.00'
    ,'Vermelho'
    ,'200'
    ,'1999' 
);
INSERT INTO tb_carro VALUES(
	'5'
    ,'Wolksvagen'
    ,'Gol'
    ,'65000.00'
    ,'Prata'
    ,'80000'
    ,'2008' 
);
INSERT INTO tb_carro VALUES(
	'6'
    ,'Chevrolet'
    ,'Onix'
    ,'70000.00'
    ,'Branco'
    ,'2000'
    ,'2015' 
);
INSERT INTO tb_carro VALUES(
	'7'
    ,'Hunday'
    ,'HB20'
    ,'85000.00'
    ,'Azul'
    ,'300'
    ,'2018' 
);
INSERT INTO tb_carro VALUES(
	'8'
    ,'GM'
    ,'Equinox'
    ,'90000.00'
    ,'Preto'
    ,'800'
    ,'2020' 
);
INSERT INTO tb_carro VALUES(
	'9'
    ,'Wolksvagen'
    ,'Polo'
    ,'80000.00'
    ,'Vermelho'
    ,'500'
    ,'2016' 
);
INSERT INTO tb_carro VALUES(
	'10'
    ,'WolksVagen'
    ,'Jetta'
    ,'75000.00'
    ,'Vermelho'
    ,'1200'
    ,'2021' 
);

-- DELETE FROM tb_carro WHERE id = 9;

INSERT INTO tb_proprietario VALUES(
	'1'
    ,'Scott Summers'
    ,'8'
    ,35
);
INSERT INTO tb_proprietario VALUES(
	'2'
    ,'Jean Grey'
    ,'4'
    ,26
);
INSERT INTO tb_proprietario VALUES(
	'3'
    ,'Charles Xavier'
    ,'3'
    ,62
);
INSERT INTO tb_proprietario VALUES(
	'4'
    ,'James Logan'
    ,'7'
    ,240
);
INSERT INTO tb_proprietario VALUES(
	'5'
    ,'Ororo Munroe'
    ,'10'
    ,30
);

SELECT * FROM tb_proprietario;

UPDATE tb_proprietario SET id_carro = 2 WHERE id = 1;


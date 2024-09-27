USE db_clinica;

INSERT INTO tb_veterinario VALUES (
	'1'
    ,'Ferdinandison'
    ,'Cardiopatia'
	,'1190003241'
);
INSERT INTO tb_veterinario VALUES (
	'2'
    ,'Marinelsa'
    ,'Nefrologia'
	,'1198123241'
);
INSERT INTO tb_veterinario VALUES (
	'3'
    ,'Sigfrid'
    ,'Neurologia'
	,'11928341716'
);

INSERT INTO tb_cliente VALUES (
	'21'
    ,'Scott Summers'
    ,'1407 Graymalkin Lane, Westchester, NY '
    ,'1(601)822438576'
);
INSERT INTO tb_cliente VALUES (
	'22'
    ,'Peter Parker'
    ,'20 Ingram ST, Queens, NY'
    ,'1(601)921432798'
);
INSERT INTO tb_cliente VALUES (
	'23'
    ,'Stephen Strange'
    ,'177A Bleecker Street,Greenwich Village, NY'
    ,'1(601)134894676'
);

INSERT INTO tb_pet VALUES(
	'100'
    ,'wolvie'
    ,'dog'
    ,'bulldog'
    ,'1999-01-21'
    ,'21'
);
INSERT INTO tb_pet VALUES(
	'101'
    ,'ipsu-bitsy'
    ,'spider'
    ,'tarantula'
    ,'2005-06-17'
    ,'22'
);
INSERT INTO tb_pet VALUES(
	'102'
    ,'agatha'
    ,'cat'
    ,'persian'
    ,'2006-06-13'
    ,'23'
);

INSERT INTO tb_atendimento VALUES(
	'1000'
    ,'101'
    ,'2'
    ,'2024-06-01'
    ,'checkup de rotina'
);
INSERT INTO tb_atendimento VALUES(
	'1001'
    ,'102'
    ,'1'
    ,'2024-06-01'
    ,'Atropelamento, sem dano nos orgaos internos, perna quebrada'
);
INSERT INTO tb_atendimento VALUES(
	'1003'
    ,'100'
    ,'3'
    ,'2024-06-03'
    ,'Comportamento agressivo demais, encontrada ferida infeccionada na pata traseira esquerda'
);
INSERT INTO tb_atendimento VALUES(
	'1004'
    ,'101'
    ,'3'
    ,'2024-06-04'
    ,'Esta muito letárgico'
);

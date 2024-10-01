-- TCL TRASACT CONTROL LANGUAGE

-- ACID
/*
- Atomicidade -> deve ser executada de forma completa. Ou acontece por inteiro ou náo acontece
- Consistência -> qualidade e integridade das informações armazenadas
- Isolamento -> garante que as transações sejam executadas de forma a não interferir umas outras
- Durabilidade -> garante que uma vez que a transaçõa é confirmada, suas alterações são permanentes
*/

-- COMMIT
-- Salvar as alterações no banco de dados. CONSOLIDAR A TRANSAÇÃO

-- ROLLBACK
-- Quando houver uma falha no processo, ele não salva nada. TRANSAÇÃO TOTALMENTE DESFEITA

SELECT @@autocommit;
-- desativar
SET @@autocommit = OFF;

-- ROLLBACK SIMPLES
-- INSERT

INSERT INTO tb_proprietario VALUES(
	'6'
    ,'Juscelino'
    ,'4'
    ,'35'
);

ROLLBACK;

DELETE FROM tb_proprietario WHERE id = 1;

ROLLBACK;

SELECT * FROM tb_proprietario;

-- UPDATE 
UPDATE tb_proprietario SET nome = "Magnus Maximiliof"  WHERE id = 3;
ROLLBACK;

SELECT * FROM tb_proprietario;

START TRANSACTION;
INSERT INTO tb_proprietario VALUES(
    '6'
    ,'Carol'
    ,'3'
    ,'30'
    );
COMMIT;

select * from tb_proprietario;
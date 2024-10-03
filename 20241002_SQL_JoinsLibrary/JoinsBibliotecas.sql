USE db_biblioteca;
 -- 1. INNER JOIN
/*Exercício 1: Liste os nomes dos membros que pegaram livros emprestados e o título dos livros que eles emprestaram.*/
(SELECT
	mb.nome
    ,lv.titulo
FROM 
	tb_emprestimos emp
    INNER JOIN  tb_membros mb
			ON  mb.id_membro=emp.id_membro
	INNER JOIN  tb_livros lv
            ON  emp.id_livro=lv.id_livro
);
/*Exercício 2: Liste os autores e os livros que foram emprestados.*/
(SELECT
	aut.nome
    ,lv.titulo
FROM 
	tb_emprestimos emp
	INNER JOIN  tb_livros lv
            ON  emp.id_livro = lv.id_livro
    INNER JOIN  tb_autores aut
			ON  aut.id_autor=lv.id_autor
);
-- 2. RIGHT JOIN
/* 1: Liste todos os membros, incluindo aqueles que não realizaram nenhum empréstimo.*/
(SELECT
	mb.id_membro
    ,mb.nome
    ,emp.id_emprestimo
FROM
	tb_emprestimos emp
    RIGHT JOIN tb_membros mb
			ON emp.id_membro = mb.id_membro
);
/*Exercício 2: Liste todos os autores e seus livros, incluindo livros que não foram emprestados.*/
(SELECT
	lv.titulo
    ,aut.nome
FROM
	tb_emprestimos emp
    RIGHT JOIN tb_livros lv
            ON emp.id_livro=lv.id_livro
	INNER JOIN tb_autores aut
            ON aut.id_autor = lv.id_autor			
WHERE 
	emp.id_emprestimo IS NULL
);	
-- 3. UNION
/* Exercício 1: Liste todos os livros e seus autores, incluindo livros que não têm 
autores associados e autores que não têm livros cadastrados.*/
(SELECT 
	* 
FROM 
	tb_autores aut
    RIGHT JOIN tb_livros lv
            ON lv.id_autor = aut.id_autor
UNION
	SELECT 
	* 
FROM 
	tb_autores aut
    LEFT JOIN tb_livros lv
            ON lv.id_autor = aut.id_autor
);

/*Exercício 2: Liste todos os membros e livros emprestados, incluindo membros
que não pegaram livros e livros que não foram emprestados.*/

SELECT
	*
FROM
	tb_emprestimos emp
    LEFT JOIN tb_livros lv
            ON emp.id_livro = lv.id_livro
	LEFT JOIN tb_membros mb
            ON mb.id_membro = emp.id_membro
;
		

SELECT
	mb.nome
    ,lv.titulo
FROM
	tb_emprestimos emp
    RIGHT JOIN  tb_membros mb
            ON emp.id_membro = mb.id_membro
	RIGHT JOIN tb_livros lv
            ON  lv.id_livro = emp.id_livro


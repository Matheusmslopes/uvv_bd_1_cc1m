WITH RECURSIVE tabela_pai AS (
SELECT 
codigo,
nome,
codigo_pai,
1 AS nivel,
CAST(nome AS TEXT) AS niv_relacao
FROM classificacao
WHERE codigo_pai IS NULL 
UNION ALL
SELECT 
c.codigo,
tp.nome,
c.codigo_pai,
tp.nivel + 1 AS nivel,
CAST(tp.niv_relacao || ' -->> ' || c.nome AS TEXT) AS niv_relacao
FROM classificacao c
INNER JOIN tabela_pai tp 
ON c.codigo_pai = tp.codigo)
SELECT 
nivel AS "Nível",
niv_relacao AS "Relação",
codigo_pai AS "Código do produto Pai"
FROM tabela_pai tp
ORDER BY niv_relacao;

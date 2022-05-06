SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
TIMESTAMPDIFF(year, f.data_nascimento,CURDATE()) "idade",
CASE
WHEN f.sexo = 'M' THEN 'Masculino'
WHEN f.sexo = 'F' THEN 'Feminino'
END "sexo"
FROM funcionario f 
UNION 
SELECT dp.nome_dependente,
TIMESTAMPDIFF(year, dp.data_nascimento,CURDATE()) "idade",
CASE
WHEN dp.sexo = 'M' THEN 'Masculino'
WHEN dp.sexo = 'F' THEN 'Feminino'
END "sexo"
FROM dependente dp
ORDER BY idade;

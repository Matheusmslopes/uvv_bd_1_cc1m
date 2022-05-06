SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
TIMESTAMPDIFF(year, f.data_nascimento,CURDATE()) "Idade",
CASE
WHEN f.sexo = 'M' THEN 'Masculino'
WHEN f.sexo = 'F' THEN 'Feminino'
END "Sexo"
FROM funcionario f 
UNION 
SELECT dp.nome_dependente,
TIMESTAMPDIFF(year, dp.data_nascimento,CURDATE()) "Idade",
CASE
WHEN dp.sexo = 'M' THEN 'Masculino'
WHEN dp.sexo = 'F' THEN 'Feminino'
END "Sexo"
FROM dependente dp
ORDER BY Idade DESC;

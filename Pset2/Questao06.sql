SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
CONCAT(d.nome_departamento,",n°", d.numero_departamento) "Departamento",
CASE
WHEN f.sexo = 'M' THEN 'Masculino'
WHEN f.sexo = 'F' THEN 'Feminino'
END "Sexo do funcionario",
nome_dependente "Nome do dependente",
TIMESTAMPDIFF(year, dp.data_nascimento,CURDATE()) "Idade",
CASE
WHEN dp.sexo = 'M' THEN 'Masculino'
WHEN dp.sexo = 'F' THEN 'Feminino'
END "Sexo do dependente"
FROM funcionario f
INNER JOIN dependente dp
ON f.cpf = dp.cpf_funcionario
INNER JOIN departamento d
ON f.numero_departamento = d.numero_departamento
ORDER BY f.numero_departamento, 
f.primeiro_nome;

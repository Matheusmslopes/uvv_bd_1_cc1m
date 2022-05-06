SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
p.nome_projeto "Projeto",
d.nome_departamento "Departamento"
FROM funcionario f
INNER JOIN departamento d 
ON f.numero_departamento = d.numero_departamento 
INNER JOIN projeto p
ON p.numero_departamento = d.numero_departamento 
INNER JOIN trabalha_em t
ON t.cpf_funcionario = f.cpf 
WHERE t.horas IS NULL;

SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
CONCAT(d.nome_departamento,",n°", d.numero_departamento) "Departamento",
p.nome_projeto "projeto",
t.horas
FROM funcionario f
INNER JOIN departamento d 
ON f.numero_departamento = d.numero_departamento
INNER JOIN trabalha_em t
ON f.cpf = t.cpf_funcionario
INNER JOIN projeto p
ON t.numero_projeto = p.numero_projeto 
ORDER BY d.numero_departamento, f.primeiro_nome;

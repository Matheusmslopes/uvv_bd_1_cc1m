SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
d.nome_departamento "Nome do departamento",
p.nome_projeto "Nome do projeto"
FROM trabalha_em t
LEFT OUTER JOIN funcionario f 
ON t.cpf_funcionario = f.cpf
INNER JOIN departamento d 
ON f.numero_departamento = d.numero_departamento
LEFT OUTER JOIN projeto p 
ON t.numero_projeto = p.numero_projeto
ORDER BY f.numero_departamento;

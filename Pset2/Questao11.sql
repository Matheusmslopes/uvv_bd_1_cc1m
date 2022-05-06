SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
p.nome_projeto "Nome do projeto",
50*t.horas "Valor total"
FROM funcionario f
INNER JOIN trabalha_em t
ON f.cpf = t.cpf_funcionario 
INNER JOIN projeto p 
ON t.numero_projeto = p.numero_projeto
ORDER BY f.primeiro_nome;

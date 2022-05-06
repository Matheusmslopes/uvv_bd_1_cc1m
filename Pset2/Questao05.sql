SELECT CONCAT(d.nome_departamento,",n°", d.numero_departamento) "Departamento",
CASE
WHEN f.cpf = d.cpf_gerente THEN CONCAT(f.primeiro_nome," ", f.nome_meio," ", f.ultimo_nome)
ELSE "-"
END "Gerência",
CASE
WHEN f.cpf != d.cpf_gerente THEN CONCAT(f.primeiro_nome," ", f.nome_meio," ", f.ultimo_nome)
ELSE "-"
END "Funcionário"
FROM funcionario f
INNER JOIN departamento d
ON f.numero_departamento = d.numero_departamento
ORDER BY d.nome_departamento ASC,
f.salario DESC;

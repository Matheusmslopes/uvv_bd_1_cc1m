SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
CONCAT(d.nome_departamento,",n°", d.numero_departamento) "Departamento",
salario "Salário"
FROM funcionario f
INNER JOIN departamento d
ON f.numero_departamento = d.numero_departamento
LEFT OUTER JOIN dependente dp
ON f.cpf = dp.cpf_funcionario 
WHERE dp.cpf_funcionario IS NULL
ORDER BY f.numero_departamento;

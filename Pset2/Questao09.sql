SELECT CONCAT(d.nome_departamento,",n°", d.numero_departamento) "Departamento",
p.nome_projeto "Nome do projeto",
SUM(t.horas) "Horas trabalhadas"
FROM trabalha_em t
INNER JOIN projeto p 
ON t.numero_projeto = p.numero_projeto 
INNER JOIN departamento d 
ON d.numero_departamento = p.numero_departamento
GROUP BY p.nome_projeto
ORDER BY d.numero_departamento;

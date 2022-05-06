SELECT d.numero_departamento "número do departamento", COUNT(f.numero_departamento) "número de funcionários"
FROM funcionario f
INNER JOIN departamento d
ON f.numero_departamento  = d.numero_departamento
GROUP BY d.numero_departamento;

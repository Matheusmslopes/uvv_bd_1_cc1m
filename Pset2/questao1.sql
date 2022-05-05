SELECT round(avg(salario),2) "Média salarial", d.numero_departamento
FROM funcionario f
INNER JOIN departamento d
ON f.numero_departamento = d.numero_departamento
GROUP BY d.numero_departamento
ORDER BY d.numero_departamento;

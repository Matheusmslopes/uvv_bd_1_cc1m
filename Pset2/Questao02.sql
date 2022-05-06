SELECT round(avg(salario), 2) "Média salarial", 
sexo
FROM funcionario
GROUP BY sexo;

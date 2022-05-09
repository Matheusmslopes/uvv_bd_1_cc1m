SELECT round(avg(salario), 2) "Média salarial", 
sexo "Sexo"
FROM funcionario
GROUP BY sexo;

SELECT round(avg(salario), 2) "media salarial", sexo
FROM funcionario
GROUP BY sexo;

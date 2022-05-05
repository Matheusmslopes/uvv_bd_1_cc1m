SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo", 
data_nascimento, 
timestampdiff(year, data_nascimento,CURDATE()) "idade", 
salario, 
d.nome_departamento, 
d.numero_departamento
FROM funcionario f
INNER JOIN departamento d
ON f.numero_departamento = d.numero_departamento
ORDER BY numero_departamento;

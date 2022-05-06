SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo", 
data_nascimento "Data de nascimento", 
timestampdiff(year, data_nascimento,CURDATE()) "Idade", 
salario "Salário", 
d.nome_departamento "Nome do departamento", 
d.numero_departamento "Número do departamento"
FROM funcionario f
INNER JOIN departamento d
ON f.numero_departamento = d.numero_departamento
ORDER BY d.numero_departamento;

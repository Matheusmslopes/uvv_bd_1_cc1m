SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) "Nome completo",
TIMESTAMPDIFF(year, data_nascimento,CURDATE()) "Idade",
salario "Salário atual",
CASE
WHEN salario <35000 THEN salario*1.2
ELSE salario*1.15
END "Novo salário"
FROM funcionario;

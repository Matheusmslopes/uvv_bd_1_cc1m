# Pset1

## Este é o primeiro pset proposto pelo professor, no qual temos que desenvolver um projeto que está nos capítulos 5 e 6 do livro texto de referência da disciplina, que é o *sistema de banco de dados* dos autores Elmasri e Navathe.

### Aluno: Matheus Muruci de Souza Lopes

### Professor: Abrantes Araujo Silva Filho

### Monitora: Suellen Miranda Amorim

Serão utilizados alguns sistemas de gerenciamneto de banco de dados **(SGBD)**, como o **PostgreSQL** e o **MySQL/MariaDB**.

Para realizar este trabalho, foram disponibilizados algumas ferramentas, tais como:

* SQL Power Architect;
* Oracle VM VirtualBox;
* DBeaver.

### Oracle VM VirtualBox

É a principal ferramenta disponibilizada, uma vez que ela já vem configurada com alguns dos principais SGBD do mundo e com o SQL Power Architect.

### SQL Power Architect

No SQL Power Architect comecei fazendo o projeto lógico do Pset. Depois de pronto, eu posso extrair os scripts do MariaDB/MySQL e PostgreSQL.

>**OBS:**  foi necessário alterar a precisão do campo `funcionario.endereco` de *varchar(30)* para *varchar(50)* para que os dados fossem corretamente preenchidos. Já que alguns enderecos estavam passando de 30 caracteres.

### DBeaver

É o local em que usamos os SGBD do **PostgreSQL** e do **MariaDB**. Também será o local em que vou usar os scripts salvos do power architect. A partir do script do power architect, tenho que passar todos os comandos de insert que estão no **Pset**.

>**OBS:**  foram necessárias fazer 2 alterações nos dados do insert do projeto original do Elmasri. <br><br>
> **Supervisor dos supervisores**: Diferentemente do dado funcionario.cpf_supervisor do modelo do Elmasri,  aqui eu não consegui inserir um dado nulo. Para resolver esta situação, percebi que ele é o "supervisor dos supervisores", logo  tive a ideia de colocar o seu próprio cpf neste campo. <br><br>
> **Horas**: Aqui foi feita uma adaptação em "trabalha_em.horas" do último funcionário, que é o "Jorge", o supervisor dos supervisores.
No Elmasri temos a condição NULL, mas como a restrição é NOT NULL, tive a ideia de inserir 0.



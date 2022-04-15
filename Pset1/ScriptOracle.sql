
CREATE TABLE elmasri.funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR2(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR2(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR2(50),
                sexo CHAR(1),
                salario NUMBER(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento NUMBER NOT NULL,
                CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (cpf)
);
COMMENT ON TABLE elmasri.funcionario IS 'Tabela que armazenará as informações dos funcionários.';
COMMENT ON COLUMN elmasri.funcionario.cpf IS 'CPF do funcionário. Será a PK da tabela.';
COMMENT ON COLUMN elmasri.funcionario.primeiro_nome IS 'Primeiro nome do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.nome_meio IS 'Inicial do nome do meio do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.ultimo_nome IS 'Ultimo nome do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.data_nascimento IS 'Data de nascimento do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.endereco IS 'Endereço do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.sexo IS 'Sexo do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.salario IS 'Salário do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.cpf_supervisor IS 'CPF do supervisor.  É a FK para a própria tabela.';
COMMENT ON COLUMN elmasri.funcionario.numero_departamento IS 'Número do departamento do func.  É a FK de departamento.';


CREATE TABLE elmasri.dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR2(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR2(15),
                CONSTRAINT PK_DEPENDENTE PRIMARY KEY (cpf_funcionario, nome_dependente)
);
COMMENT ON TABLE elmasri.dependente IS 'Tabela que armazenará as informações dos dependentes dos funcionários.';
COMMENT ON COLUMN elmasri.dependente.cpf_funcionario IS 'CPF do funcionário. PK desta tabela e FK de funcionário.';
COMMENT ON COLUMN elmasri.dependente.nome_dependente IS 'Nome do dependente. Faz parte da PK desta tabela.';
COMMENT ON COLUMN elmasri.dependente.sexo IS 'Sexo do dependente.';
COMMENT ON COLUMN elmasri.dependente.data_nascimento IS 'Data de nascimento do dependente.';
COMMENT ON COLUMN elmasri.dependente.parentesco IS 'É o de parentesco do dependente com o funcionário.';


CREATE TABLE elmasri.departamento (
                numero_departamento NUMBER NOT NULL,
                nome_departamento VARCHAR2(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (numero_departamento)
);
COMMENT ON TABLE elmasri.departamento IS 'Tabela que armazenará as informaçoẽs dos departamentos.';
COMMENT ON COLUMN elmasri.departamento.numero_departamento IS 'Número do departamento. Esta é a PK dessa tabela.';
COMMENT ON COLUMN elmasri.departamento.nome_departamento IS 'Nome do departamento. Tem que ser único.';
COMMENT ON COLUMN elmasri.departamento.cpf_gerente IS 'É o CPF do gerente do departamento.FK de funcionários.';
COMMENT ON COLUMN elmasri.departamento.data_inicio_gerente IS 'É a data do início do gerente no departamento.';


CREATE UNIQUE INDEX elmasri.departamento_idx
 ON elmasri.departamento
 ( nome_departamento );

CREATE TABLE elmasri.projeto (
                numero_projeto NUMBER NOT NULL,
                nome_projeto VARCHAR2(15) NOT NULL,
                local_projeto VARCHAR2(15),
                numero_departamento NUMBER NOT NULL,
                CONSTRAINT PK_PROJETO PRIMARY KEY (numero_projeto)
);
COMMENT ON TABLE elmasri.projeto IS 'Tabela que armazenará as informações sobre os projetos dos departamentos.';
COMMENT ON COLUMN elmasri.projeto.numero_projeto IS 'Número do projeto.Esta é a PK dessa tabela.';
COMMENT ON COLUMN elmasri.projeto.nome_projeto IS 'Nome do projeto. Tem que ser único.';
COMMENT ON COLUMN elmasri.projeto.local_projeto IS 'Localização do projeto.';
COMMENT ON COLUMN elmasri.projeto.numero_departamento IS 'Número do departamento. É uma FK de departamento.';


CREATE UNIQUE INDEX elmasri.projeto_idx
 ON elmasri.projeto
 ( nome_projeto );

CREATE TABLE elmasri.trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto NUMBER NOT NULL,
                horas NUMBER(3,1) NOT NULL,
                CONSTRAINT PK_TRABALHA_EM PRIMARY KEY (cpf_funcionario, numero_projeto)
);
COMMENT ON TABLE elmasri.trabalha_em IS 'Tabela que servirá para armazenar quais funcionários trabalham em quais projetos.';
COMMENT ON COLUMN elmasri.trabalha_em.cpf_funcionario IS 'CPF do funcionário.  É a PK dessa tabela e  a FK de func.';
COMMENT ON COLUMN elmasri.trabalha_em.numero_projeto IS 'Número do projeto.  É a PK desta tabela e  a FK de projeto.';
COMMENT ON COLUMN elmasri.trabalha_em.horas IS 'Horas trabalhadas pelo funcionário no projeto.';


CREATE TABLE elmasri.localizacoes_departamento (
                numero_departamento NUMBER NOT NULL,
                local VARCHAR2(15) NOT NULL,
                CONSTRAINT PK_LOCALIZACOES_DEPARTAMENTO PRIMARY KEY (numero_departamento, local)
);
COMMENT ON TABLE elmasri.localizacoes_departamento IS 'localizacoes_departamento IS ''Tabela que armazenará as localizações dos departamentos.';
COMMENT ON COLUMN elmasri.localizacoes_departamento.numero_departamento IS 'É a PK desta tabela e  a FK de depart. Número do depart.';
COMMENT ON COLUMN elmasri.localizacoes_departamento.local IS 'É a localização do depart. Faz parte da PK dessa tabela.';


ALTER TABLE elmasri.departamento ADD CONSTRAINT FUNCIONARIO_DEPARTAMENTO_FK
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.funcionario ADD CONSTRAINT FUNCIONARIO_FUNCIONARIO_FK
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.dependente ADD CONSTRAINT FUNCIONARIO_DEPENDENTE_FK
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT FUNCIONARIO_TRABALHA_EM_FK
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.localizacoes_departamento ADD CONSTRAINT DEPARTAMENTO_LOCALIZACOES_D323
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
NOT DEFERRABLE;

ALTER TABLE elmasri.projeto ADD CONSTRAINT DEPARTAMENTO_PROJETO_FK
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT PROJETO_TRABALHA_EM_FK
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.projeto (numero_projeto)
NOT DEFERRABLE;

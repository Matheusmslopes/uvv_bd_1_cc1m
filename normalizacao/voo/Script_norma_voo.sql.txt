
CREATE TABLE idioma (
                cod_idioma INT NOT NULL,
                idioma VARCHAR(40) NOT NULL,
                PRIMARY KEY (cod_idioma)
);


CREATE TABLE cidade (
                cod_cidade INT NOT NULL,
                nome_cidade VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_cidade)
);


CREATE TABLE bairro (
                cod_bairro INT NOT NULL,
                nome_bairro VARCHAR(150) NOT NULL,
                PRIMARY KEY (cod_bairro)
);


CREATE TABLE uf (
                sigla_uf CHAR(2) NOT NULL,
                nome_estado VARCHAR NOT NULL,
                PRIMARY KEY (sigla_uf)
);


CREATE TABLE cep (
                cep CHAR(8) NOT NULL,
                PRIMARY KEY (cep)
);


CREATE TABLE tripulantes (
                cod_tripulante INT NOT NULL,
                nome_completo_trip VARCHAR NOT NULL,
                num_passaporte CHAR(8) NOT NULL,
                numero_log VARCHAR(10) NOT NULL,
                logradouro VARCHAR(150) NOT NULL,
                complemento VARCHAR(150),
                cep CHAR(8) NOT NULL,
                sigla_uf CHAR(2) NOT NULL,
                cod_bairro INT NOT NULL,
                cod_cidade INT NOT NULL,
                cod_idioma INT NOT NULL,
                PRIMARY KEY (cod_tripulante)
);


CREATE TABLE piloto (
                cod_tripulante INT NOT NULL,
                numero_brevet CHAR NOT NULL,
                data_exp_brevet DATE NOT NULL,
                PRIMARY KEY (cod_tripulante)
);


CREATE TABLE comissario (
                cod_tripulante INT NOT NULL,
                PRIMARY KEY (cod_tripulante)
);


CREATE TABLE aeroportos (
                cod_aeroporto INT NOT NULL,
                cod_cidade INT NOT NULL,
                PRIMARY KEY (cod_aeroporto)
);


CREATE TABLE tel_contato (
                cod_tel INT NOT NULL,
                numero_tel VARCHAR(9) NOT NULL,
                ddd CHAR(2) NOT NULL,
                cod_aeroporto INT NOT NULL,
                PRIMARY KEY (cod_tel)
);


CREATE TABLE voos (
                codigo_voo INT NOT NULL,
                horario_partida TIME NOT NULL,
                data_partida DATE NOT NULL,
                cod_aero_origem INT NOT NULL,
                cod_aero_destino INT NOT NULL,
                PRIMARY KEY (codigo_voo)
);


CREATE TABLE voo_trip (
                codigo_voo INT NOT NULL,
                cod_tripulante INT NOT NULL,
                PRIMARY KEY (codigo_voo, cod_tripulante)
);


CREATE TABLE passageiros (
                cod_passageiro INT NOT NULL,
                nome_completo_pass VARCHAR NOT NULL,
                data_nascimento DATE NOT NULL,
                sexo VARCHAR NOT NULL,
                PRIMARY KEY (cod_passageiro)
);


CREATE TABLE bagagens (
                cod_bagagem INT NOT NULL,
                cod_passageiro INT NOT NULL,
                peso DECIMAL(4,2) NOT NULL,
                fragil CHAR(3) NOT NULL,
                codigo_voo INT NOT NULL,
                PRIMARY KEY (cod_bagagem, cod_passageiro)
);


CREATE TABLE reservam (
                codigo_voo INT NOT NULL,
                cod_passageiro INT NOT NULL,
                data_inicio DATE NOT NULL,
                data_fim DATE NOT NULL,
                PRIMARY KEY (codigo_voo, cod_passageiro)
);


ALTER TABLE tripulantes ADD CONSTRAINT idioma_tripulantes_fk
FOREIGN KEY (cod_idioma)
REFERENCES idioma (cod_idioma)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT cidade_tripulantes_fk
FOREIGN KEY (cod_cidade)
REFERENCES cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE aeroportos ADD CONSTRAINT cidade_aeroportos_fk
FOREIGN KEY (cod_cidade)
REFERENCES cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT bairro_tripulantes_fk
FOREIGN KEY (cod_bairro)
REFERENCES bairro (cod_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT uf_tripulantes_fk
FOREIGN KEY (sigla_uf)
REFERENCES uf (sigla_uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT cep_tripulantes_fk
FOREIGN KEY (cep)
REFERENCES cep (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comissario ADD CONSTRAINT tripulantes_comissario_fk
FOREIGN KEY (cod_tripulante)
REFERENCES tripulantes (cod_tripulante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE piloto ADD CONSTRAINT tripulantes_piloto_fk
FOREIGN KEY (cod_tripulante)
REFERENCES tripulantes (cod_tripulante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voo_trip ADD CONSTRAINT tripulantes_voo_trip_fk
FOREIGN KEY (cod_tripulante)
REFERENCES tripulantes (cod_tripulante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tel_contato ADD CONSTRAINT aeroportos_tel_contato_fk
FOREIGN KEY (cod_aeroporto)
REFERENCES aeroportos (cod_aeroporto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voos ADD CONSTRAINT aeroportos_voos_fk
FOREIGN KEY (cod_aero_origem)
REFERENCES aeroportos (cod_aeroporto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voos ADD CONSTRAINT aeroportos_voos_fk1
FOREIGN KEY (cod_aero_destino)
REFERENCES aeroportos (cod_aeroporto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE reservam ADD CONSTRAINT voos_reservam_fk
FOREIGN KEY (codigo_voo)
REFERENCES voos (codigo_voo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE bagagens ADD CONSTRAINT voos_bagagens_fk
FOREIGN KEY (codigo_voo)
REFERENCES voos (codigo_voo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voo_trip ADD CONSTRAINT voos_voo_trip_fk
FOREIGN KEY (codigo_voo)
REFERENCES voos (codigo_voo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE reservam ADD CONSTRAINT passageiros_reservam_fk
FOREIGN KEY (cod_passageiro)
REFERENCES passageiros (cod_passageiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE bagagens ADD CONSTRAINT passageiros_bagagens_fk
FOREIGN KEY (cod_passageiro)
REFERENCES passageiros (cod_passageiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

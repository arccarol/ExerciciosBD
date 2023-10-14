CREATE DATABASE exercicios

Use master
GO
DROP DATABASE exercicios

CREATE TABLE especialidade(
id             INT      NOT NULL,
especialidade     VARCHAR(100)    NOT NULL
PRIMARY KEY (id)
)
GO
CREATE TABLE medico(
codigo   INT   NOT NULL,
nome    VARCHAR(100)   NOT NULL,
logradouro   VARCHAR(200)   NOT NULL,
numero    INT    NOT NULL,
cep    CHAR(8)     NOT NULL,
complemento   VARCHAR(255)  NOT NULL,
contato    VARCHAR(11)  NOT NULL,
id          INT         NOT NULL
PRIMARY KEY (codigo)
FOREIGN KEY (id) REFERENCES especialidade(id)
)
GO
CREATE TABLE consulta(
data_hora DATETIME  NOT NULL,
observacao  VARCHAR(255)  NOT NULL,
num_beneficiario INT  NOT NULL,
codigo   INT   NOT NULL
PRIMARY KEY (data_hora)
FOREIGN KEY (num_beneficiario) REFERENCES paciente(num_beneficiario),
FOREIGN KEY (codigo) REFERENCES   medico(codigo)
)
GO 
CREATE TABLE paciente(
num_beneficiario INT  NOT NULL,
nome   VARCHAR(100)  NOT NULL,
logradouro VARCHAR(200)  NOT NULL,
numero   INT  NOT NULL,
cep  CHAR(8)   NOT NULL,
complemento  VARCHAR(255),
telefone   VARCHAR(11)  NOT NULL
PRIMARY KEY (num_beneficiario)
)

EXEC sp_help especialidade

INSERT INTO especialidade VALUES 
(1 ,'Otorrinolaringologista'),
(2 , 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')

SELECT *
FROM especialidade

INSERT INTO medico VALUES 
(1000001 ,'Ana Paula', 'R. 7 de Setembro', 256, 03698000, 'Casa', 915689456, 1),
(1000002 , 'Maria Aparecida', 'Av. Brasil', 32, 02145070, 'Casa', 923235454, 1),
(1000003, 'Lucas Borges', 'Av. do Estado', 3210, 05241000, 'Apto 205', 963698585, 2),
(1000004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, 03145000, 'Apto 602', 932458745, 3)

SELECT *
FROM medico

INSERT INTO consulta VALUES
('2021-09-04 13:20', 'Infecção Urina', 99901, 1000002),
('2021-09-04 13:15','Gripe', 99902, 1000003),
('2021-09-04 12:30', 'Infecção Garganta', 99901, 1000001)

SELECT *
FROM consulta

INSERT INTO paciente VALUES 
(99901 ,'Washington Silva', 'R. Anhaia', 150, 02345000, 'Casa', 922229999),
(99902 , 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, 03254010, 'Bloco B.Apto 25', 923450987),
(99903, 'Maria Elisa', 'Av.Aguia de Haia', 1188, 06987020, 'Apto 1208', 912348765),
(99904, 'José Araujo', 'R. XV de Novembro', 18, 03678000, 'Casa', 945674312),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, 01214000, 'Conjunto 3 - Apto 801', 912095674)

SELECT *
FROM paciente

ALTER TABLE medico
ADD dia_atendimento  VARCHAR(30);

UPDATE medico
SET dia_atendimento = 'Segunda-feira'
WHERE codigo = 1000001

UPDATE medico
SET dia_atendimento = 'Quarta-feira'
WHERE codigo = 1000002

UPDATE medico
SET dia_atendimento = 'Segunda-feira'
WHERE codigo = 1000003

UPDATE medico
SET dia_atendimento = 'Quinta-feira'
WHERE codigo = 1000004

DELETE especialidade
WHERE id = 4

EXEC sp_rename 'medico.dia_atendimento', 'dia_semana_atendimento', 'COLUMN';

UPDATE medico
SET logradouro = 'Av. Bras Leme', numero = 870, complemento = 'Apto 504', cep = 02122000
WHERE codigo = 1000003

ALTER TABLE consulta
ALTER COLUMN observacao VARCHAR(200) NOT NULL
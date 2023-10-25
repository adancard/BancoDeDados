create database escola;

use escola;

CREATE TABLE info_pessoais_aluno (
	cpf VARCHAR(15) PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	tel_celular_resp VARCHAR(15) NOT NULL,
	tel_residencial_resp VARCHAR(15),
    email_resp VARCHAR(40) NOT NULL,
    status_info BOOL DEFAULT 1
);

CREATE TABLE aluno (
	num_matricula_aluno BIGINT AUTO_INCREMENT PRIMARY KEY,
    data_inicio_aluno DATE NOT NULL,
	cpf_aluno VARCHAR(15) UNIQUE NOT NULL,
    email_aluno VARCHAR(40),
    status_aluno BOOL DEFAULT 1,
    CONSTRAINT fk_cpf_aluno FOREIGN KEY (cpf_aluno) REFERENCES info_pessoais_aluno(cpf)
);

CREATE TABLE curso (
	codigo_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(50) NOT NULL,
    duracao_curso INT NOT NULL CHECK (duracao_curso >= 0),
    curso_status BOOL DEFAULT 1
);

CREATE TABLE turma (
	codigo_tur BIGINT AUTO_INCREMENT PRIMARY KEY,
    qtd_alunos_tur INT NOT NULL CHECK (qtd_alunos_tur >= 0),
    periodo_tur VARCHAR(30) NOT NULL,
    semestre_tur VARCHAR(30) NOT NULL,
    status_tur BOOL DEFAULT 1
);

CREATE TABLE professor (
	codigo_prof BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_prof VARCHAR(40) NOT NULL,
    especialidade_prof VARCHAR(50) NOT NULL,
    data_admissao_prof DATE NOT NULL,
    status_prof BOOL DEFAULT 1
);

CREATE TABLE disciplina (
	codigo_disc BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome_disc VARCHAR(50) NOT NULL,
	ementa_disc TEXT NOT NULL,
	status_disc BOOL DEFAULT 1
);

CREATE TABLE matricula (
	numero_matricula BIGINT AUTO_INCREMENT,
	codigo_curso BIGINT,
	codigo_turma BIGINT,
	matricula_status BOOL DEFAULT 1,
    CONSTRAINT pk_matricula PRIMARY KEY (numero_matricula, codigo_curso, codigo_turma),
    CONSTRAINT fk_curso_matricula FOREIGN KEY (codigo_curso) REFERENCES curso(codigo_curso),
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (numero_matricula) REFERENCES aluno(num_matricula_aluno),
    CONSTRAINT fk_matricula_turma FOREIGN KEY (codigo_turma) REFERENCES turma(codigo_tur)
);

CREATE TABLE aula (
	codigo_aula BIGINT AUTO_INCREMENT PRIMARY KEY,
    codigo_professor BIGINT NOT NULL,
    codigo_disciplina BIGINT NOT NULL,
    codigo_turma BIGINT NOT NULL,
    data_aula DATE NOT NULL,
    status_aula BOOL DEFAULT 1,
    CONSTRAINT fk_professor_aula FOREIGN KEY (codigo_professor) REFERENCES professor(codigo_prof),
    CONSTRAINT fk_disciplina_aula FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disc),
    CONSTRAINT fk_turma_aula FOREIGN KEY (codigo_turma) REFERENCES turma(codigo_tur)
);

insert into disciplina(nome_disc,ementa_disc) values
('Programação Web para Back-End','Tal disciplina aborda conceitos e técnicas para desenvolvimento de aplicativos web no lado do servidor, com foco em back-end'),
(' Programação Web para Front-End','Esta disciplina explora as tecnologias e práticas para desenvolvimento de aplicações web e com foco em front-end'),
('Interface para Dispositivos Móveis','A disciplina aborda projetar e desenvolver interfaces de usuário para aplicativos móveis, com foco nos princípios de design e usabilidade'),
('Banco de Dados','Tal disciplina contempla conceitos fundamentais de bancos de dados, modelagem de dados e linguagens de consulta SQL'),
('Redes de Computadores','Esta disciplina aborda conceitos introdutórios sobre redes de computadores, topologias e padrões que definem como os computadores irão se comunicar'),
('Sistemas Operacionais','A disciplina contempla conceitos fundamentais sobre sistemas operacionais, apresentando as funcionalidades dos sistemas operacionais baseados nas plataformas Windows e Linux');

insert into curso(nome_curso,duracao_curso) values
('Técnico em Analise de Desenvolvimento de Sistemas',18),
('Técnico em Analise de Desenvolvimento de Sistemas',18),
('Técnico em Mecatrônica',24),
('Técnico em Eletrônica',24),
('Técnico em Administração',18),
('Técnico em Mecânica',20);

insert into info_pessoais_aluno(cpf,nome,tel_celular_resp,tel_residencial_resp, email_resp) values
('123.456.789-01','Fernando Pereira','016995678901','01633610098','fernando1@email.com'),
('987.654.321-02','Juliana Santos Silva','016995432102','','juliana22@email.com'),
('456.789.123-03','Mariana Silva Almeida','016995432102','','mariana32@email.com'),
('789.123.456-04','Marcelo Mendes','016997891234','01633710212','marcelo11@email.com'),
('234.567.890-05','Luana Oliveira','016992345678','','luana123@email.com');

insert into aluno(data_inicio_aluno,cpf_aluno,email_aluno) values
('2022-01-10','123.456.789-01',''),
('2022-06-01','987.654.321-02',''),
('2021-01-15','456.789.123-03',''),
('2023-01-10','789.123.456-04',''),
('2023-06-01','234.567.890-05','');

insert into turma(qtd_alunos_tur,periodo_tur,semestre_tur) values 
(35,'manhã','2º semestre'),
(35,'tarde','2º semestre'),
(35,'manhã','2º semestre'),
(18,'tarde','4º semestre'),
(20,'tarde','1º semestre'),
(36,'tarde','2º semestre');

insert into professor(nome_prof,especialidade_prof,data_admissao_prof) values 
('Eduardo Nascimento','Tecnologia da Informação','2023-01-15'),
('Matheus Michilino','Mecatrônica e Interfaces Robóticas','2020-01-01'),
('Rafael Selvagio','Tecnologia da Informação','2023-06-01'),
('Rafael Rizzi','Eng. Elétrica','2022-01-01');

insert into matricula(codigo_curso,codigo_turma) values 
(1,2),
(1,2);

insert into aula(codigo_professor,codigo_disciplina,codigo_turma,data_aula) values
(3,1,1,'2023-10-10'),
(1,2,2,'2023-10-11'),
(2,3,1,'2023-10-12'),
(1,2,1,'2023-10-13'),
(2,3,2,'2023-10-15'),
(3,1,2,'2023-10-16');


select * from disciplina where nome_disc like '%Web%';

Update disciplina 
set status_disc = 0
where codigo_disc = 2;

select * from disciplina where nome_disc like '%Web%' and status_disc = 1;

select nome_curso from curso where codigo_curso in (select codigo_curso from matricula where codigo_turma in (select codigo_turma from turma where qtd_alunos_tur > 30));

Update turma 
set status_tur = 0
where codigo_tur = 6;

create view aluno_view as select
i.nome,
a.email_aluno,
m.numero_matricula
from info_pessoais_aluno i
join aluno a on i.cpf = a.cpf_aluno
join matricula m on a.num_matricula_aluno = m.numero_matricula;

select nome,email_aluno from aluno_view where numero_matricula = 1;

select * from turma;


create view professor_view as select
p.nome_prof,
d.nome_disc as nome_disciplina
from professor p 
join aula a on p.codigo_prof = codigo_professor
join disciplina d on d.codigo_disc = codigo_disciplina;

select distinct * from professor_view where nome_prof like 'Matheus Michilino%';


create view matricula_view as select
i.nome,
t.codigo_tur
from info_pessoais_aluno i 
join aluno a on i.cpf = a.cpf_aluno
join matricula m on a.num_matricula_aluno = m.numero_matricula
join turma t on m.codigo_turma = t.codigo_tur;

select count(nome) as quantidade_de_aluno_por_turma from matricula_view;

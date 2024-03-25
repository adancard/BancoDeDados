CREATE SCHEMA meu_banco;
USE meu_banco;

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

CREATE TABLE competencia (
    id_competencia INT primary key,
    tipo ENUM ('tecnica', 'basica', 'sociemocional'),
    nome VARCHAR(100) not null,
    descricao TEXT not null
);


CREATE TABLE capacidade (
    id_capacidade INT AUTO_INCREMENT PRIMARY KEY,
    num_matricula_aluno_capacidade BIGINT not null,
    id_competencia int NOT NULL,
    tipo ENUM ('critica', 'desejada'),
    nome VARCHAR(100) not null,
    nota_obtida ENUM ('sim', 'nao', 'reavaliar'),
    descricao TEXT,
	constraint fk_aluno_capacidade foreign key (num_matricula_aluno_capacidade) references aluno (num_matricula_aluno),
    constraint fk_competencia_capacidade foreign key(id_competencia) references competencia (id_competencia)
);

select nome from capacidade where id_competencia in(select id_competencia from competencia where tipo = 'basica');

INSERT INTO info_pessoais_aluno (cpf, nome, tel_celular_resp, email_resp)
VALUES
('123.456.789-01', 'Fernando Pereira', '016995678901', 'fernando@email.com'),
('987.654.321-02', 'Juliana Santos Silva', '016995432102', 'juliana@email.com'),
('456.789.123-03', 'Mariana Silva Almeida', '016998912303', 'mariana@email.com'),
('789.123.456-04', 'Marcelo Mendes', '016997891234', 'marcelo@email.com'),
('234.567.890-05', 'Luana Oliveira', '016992345678', 'luana@email.com');

INSERT INTO aluno (data_inicio_aluno, cpf_aluno, email_aluno)
VALUES
('2022-01-10', '123.456.789-01', 'fernando1@emaileduc.com'),
('2022-06-01', '987.654.321-02', 'juliana22@emaileduc.com'),
('2021-01-15', '456.789.123-03', 'mariana32@emaileduc.com'),
('2023-01-10', '789.123.456-04', 'marcelo11@emaileduc.com'),
('2023-06-01', '234.567.890-05', 'luana123@emaileduc.com');

INSERT INTO disciplina (nome_disc, ementa_disc)
VALUES
('Programação Web para Back-End', 'Tal disciplina aborda conceitos e técnicas para desenvolvimento de aplicativos web no lado do servidor, com foco em back-end.'),
('Programação Web para Front-End', 'Esta disciplina explora as tecnologias e práticas para desenvolvimento de aplicações web e com foco em front-end.'),
('Interface para Dispositivos Móveis', 'A disciplina aborda projetar e desenvolver interfaces de usuário para aplicativos móveis, com foco nos princípios de design e usabilidade.'),
('Banco de Dados', 'Tal disciplina contempla conceitos fundamentais de bancos de dados, modelagem de dados e linguagens de consulta SQL.'),
('Redes de Computadores', 'Esta disciplina aborda conceitos introdutórios sobre redes de computadores, topologias e padrões.'),
('Sistemas Operacionais', 'A disciplina contempla conceitos fundamentais sobre sistemas operacionais, apresentando as funcionalidades dos sistemas operacionais baseados nas plataformas Windows e Linux');

INSERT INTO professor (nome_prof, especialidade_prof, data_admissao_prof)
VALUES
('Eduardo Nascimento', 'Tecnologia da Informação', '2023-01-15'),
('Matheus Michilino', 'Mecatrônica e Interfaces Robóticas', '2020-01-01'),
('Rafael Selvagio', 'Tecnologia da Informação', '2023-06-01'),
('Rafael Rizzi', 'Eng. Elétrica', '2022-01-01');

INSERT INTO curso (nome_curso, duracao_curso)
VALUES
('Técnico em Analise de Desenvolvimento de Sistemas', 18),
('Técnico em Mecatrônica', 24),
('Técnico em Eletrônica', 24),
('Técnico em Administração', 18),
('Técnico em Mecânica', 20);

INSERT INTO turma (qtd_alunos_tur, periodo_tur, semestre_tur)
VALUES
(35, 'Manhã', '2 Semestre'),
(35, 'Tarde', '2 Semestre'),
(18, 'Manhã', '2 Semestre'),
(20, 'Tarde', '4 Semestre'),
(20, 'Tarde', '1 Semestre'),
(36, 'Tarde', '2 Semestre');

INSERT INTO aula (codigo_professor, codigo_disciplina, codigo_turma, data_aula)
VALUES
(3, 1, 1, '2023-10-10'),
(1, 2, 2, '2023-10-11'),
(2, 3, 1, '2023-10-12'),
(1, 2, 1, '2023-10-13'),
(2, 3, 2, '2023-10-15'),
(3, 1, 2, '2023-10-16');

INSERT INTO matricula (codigo_curso, codigo_turma)
VALUES
(1, 1),	
(2, 2),
(1, 3),
(1, 4),
(2, 1);

insert into professor(nome_prof,especialidade_prof,data_admissao_prof)
values
('Clara Almeida','Mecatrônica','2023-06-11'),
('João Gomes','Elêtrica','2021-10-10'),
('Fernando da Silva','Mecânica','2023-01-01'),
('Bento Ramos','Elêtrica','2022-02-02');

insert into competencia(id_competencia,tipo,nome,descricao)
values(2,'basica','Fazer Programa em ','O aluno soube desenvolver uma aplicação em java');

insert into capacidade(num_matricula_aluno_capacidade,id_competencia,tipo,nome,nota_obtida)
values(2,2,'desejada','desenvolver uma aplicaçao em java','sim');

commit;

select * from professor;

update professor 
set nome_prof = 'Clara de Almeida'
where codigo_prof = 5; 

select * from professor;

delete from professor where codigo_prof = 7;

commit;

INSERT INTO disciplina (nome_disc, ementa_disc)
VALUES
('Portugues', 'Voce aprender a ler e escrever'),
('Matematica', 'Voce aprende a fazer conta');

savepoint savepoint_insert_disc;

INSERT INTO disciplina (nome_disc, ementa_disc)
VALUES
('Portugues2', 'Voce aprender a ler e escrever'),
('Matematica2', 'Voce aprende a fazer conta'),
('Matematica3', 'Voce aprende a fazer conta'),
('Matematica4', 'Voce aprende a fazer conta'),
('Matematica5', 'Voce aprende a fazer conta');

select * from disciplina;

update disciplina
set nome_disc = 'Pogramção Web para Front-And'
where codigo_disc = 2;

delete from disciplina where codigo_disc = 13;

rollback;

savepoint savepoint_antes_inserts;

INSERT INTO info_pessoais_aluno (cpf, nome, tel_celular_resp, email_resp)
VALUES
('456.098.250-01', 'Adan', '016995678901', 'Adan@email.com'),
('569.789.537-02', 'Felipe', '016995432102', 'Felipe@email.com'),
('490.384.542-03', 'Leo', '016998912303', 'Leo@email.com'),
('423.493.320-04', 'Miguel', '016997891234', 'Miguel@email.com');

INSERT INTO aluno (data_inicio_aluno, cpf_aluno, email_aluno)
VALUES
('2022-01-10', '456.098.250-01', 'Adan@emaileduc.com'),
('2022-06-01', '569.789.537-02', 'Felipe@emaileduc.com'),
('2021-01-15', '490.384.542-03', 'Leo@emaileduc.com'),
('2023-01-10', '423.493.320-04', 'Miguel@emaileduc.com');

select * from aluno;

update aluno 
set email_aluno = 'Adan@meudomio.com'
where num_matricula_aluno = 6;

delete from aluno where num_matricula_aluno = 8;

rollback;


INSERT INTO curso (nome_curso, duracao_curso)
VALUES
('Ingles', 30),
('Espanhol', 10);

savepoint savepoint_inserts_curso;

INSERT INTO curso (nome_curso, duracao_curso)
VALUES
('Ingles2', 30),
('Espanhol2', 10),
('Frances', 50);

select * from curso;

savepoint savepoint_inserts_turma;

INSERT INTO turma (qtd_alunos_tur, periodo_tur, semestre_tur)
VALUES
(30, 'Manhã', '4 Semestre'),
(25, 'Tarde', '5 Semestre'),
(10, 'Manhã', '2 Semestre'),
(25, 'Tarde', '1 Semestre');

select * from turma;

delete from turma where codigo_tur = 7;

rollback to savepoint_inserts_turma;

commit;


DELIMITER //
create function QtdAlunoTurma (codigo_turma_function int)
returns int deterministic
begin
	declare QTD_Aluno int;
	select COUNT(*) into QTD_Aluno from matricula
    where codigo_turma = codigo_turma_function;
	return QTD_Aluno;
end //
DELIMITER ;


select QtdAlunoTurma(1);


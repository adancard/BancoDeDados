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

CREATE TABLE competencia (
    id_competencia INT primary key,
    tipo ENUM ('tecnica', 'basica', 'sociemocional'),
    nome VARCHAR(100) not null,
    descricao TEXT not null
);


CREATE TABLE criticas (
    id_capacidade INT AUTO_INCREMENT PRIMARY KEY,
    num_matricula_aluno_capacidade BIGINT not null,
    id_competencia int NOT NULL,
    tipo ENUM ('critica', 'desejada'),
    nome VARCHAR(100) not null,
	Avaliado Enum('SIM','NAO','AVALIAR'),
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

insert into competencia(id_competencia,tipo,nome,descricao)
values(2,'basica','Fazer Programa em ','O aluno soube desenvolver uma aplicação em java');

insert into capacidade(num_matricula_aluno_capacidade,id_competencia,tipo,nome,avaliado)
values(1,2,'desejada','desenvolver uma aplicaçao em java','SIM');

select nome,avaliado From capacidade where num_matricula_aluno_capacidade in(select num_matricula_aluno from aluno where num_matricula_aluno = 1);



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





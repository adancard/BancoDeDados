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

-- exercicio 1
DELIMITER //
create procedure Turma_id(
 in p_codigo_turma bigint
)
begin
    select i.nome from info_pessoais_aluno i
    join aluno a on i.cpf = a.cpf_aluno
    join matricula m on a.num_matricula_aluno = m.numero_matricula
    where m.codigo_turma = p_codigo_turma;
end
// DELIMITER ;
call turma_id(3);


-- exercicio 2
delimiter //
create procedure atualiza_aluno(in p_num_matricula_aluno bigint,  in p_status_aluno Bool)
begin 
update aluno set status_aluno = p_status_aluno where num_matricula_aluno = p_num_matricula_aluno;
select * from aluno where status_aluno = 1;
end
// delimiter ;

call atualiza_aluno(1,0);


-- exercicio 3
delimiter //
create procedure Diciplina_Professor(in p_codigo_diciplina bigint)
begin
select distinct p.nome_prof from professor p
join aula al on p.codigo_prof = al.codigo_professor
join disciplina d on al.codigo_disciplina = d.codigo_disc
where d.codigo_disc = p_codigo_diciplina;
end
// delimiter ;

call Diciplina_professor(1);


-- exercicio 4
delimiter //
create procedure insert_turma(
in p_quantidade_aluno bigint,
in p_periodo_tur varchar(30),
in p_semestre_tur varchar(30))
begin 
INSERT INTO turma (qtd_alunos_tur, periodo_tur, semestre_tur)
VALUES
(p_quantidade_aluno,p_periodo_tur,p_semestre_tur);
end
// delimiter ;

call insert_turma(201,'tarde','4 semestre');


-- exercicio 5
delimiter //
create procedure update_professor(
in p_codigo_prof int,
in p_especialidade_prof varchar(50))
begin 
update professor set especialidade_prof = p_especialidade_prof where codigo_prof = p_codigo_prof;
end
 // delimiter ;
 
 call update_professor(1,'');


-- exercicio 6
delimiter //
create procedure aluno_ativo_curso(
in p_codigo_curso int)
begin 
select i.nome from info_pessoais_aluno i
join aluno a on i.cpf = a.cpf_aluno
join matricula m on a.num_matricula_aluno = m.numero_matricula
join curso c on m.codigo_curso = c.codigo_curso
where c.codigo_curso = p_codigo_curso and a.status_aluno = 1;
end
// delimiter ;

call aluno_ativo_curso(1);


-- exercicio 7
delimiter //
create procedure professor_aluno(
in p_codigo_prof int)
begin
select i.nome from info_pessoais_aluno i
join aluno a on i.cpf = a.cpf_aluno
join matricula m on a.num_matricula_aluno = m.numero_matricula
join aula al on m.codigo_turma = al.codigo_turma
join professor p on al.codigo_professor = p.codigo_prof
where p.codigo_prof = p_codigo_prof;
end
// delimiter ;

call professor_aluno(2);


-- exercicio 8
delimiter //
create procedure alunos_matriculados(
in p_codigo_cur int)
begin 	
select count(i.nome) as quantidade_alunos from info_pessoais_aluno i
join aluno a on i.cpf = a.cpf_aluno
join matricula m on a.num_matricula_aluno = m.numero_matricula
join curso c on c.codigo_curso = m.codigo_curso
where c.codigo_curso = p_codigo_cur;
end
// delimiter ;

call alunos_matriculados(1);


-- exercicio 9
delimiter //
create procedure update_diciplina(
in p_codigo_dis int,
in p_ementa_dis varchar(50))
begin 
update disciplina set ementa_disc = p_ementa_dis where codigo_disc = p_codigo_dis;
end
 // delimiter ;
 
 call update_diciplina(1,'');
 
 
 -- exercicio 10
 delimiter //
create procedure insert_professor(
in p_nome_prof varchar(30),
in p_especialidade_prof varchar(30),
in p_data_admissao date)
begin 
INSERT INTO professor (nome_prof, especialidade_prof,data_admissao_prof)
VALUES
(p_nome_prof,p_especialidade_prof,p_data_admissao);
end
// delimiter ;

call insert_professor('adan','ser gamer ser jogador','2020-01-01');
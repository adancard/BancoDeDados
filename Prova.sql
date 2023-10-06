create database banco_avaliativo;
use banco_avaliativo;

create table disciplina(
cod_disciplina varchar(10) primary key,
nome varchar(50) not null,
ementa varchar(255) not null
);

create table professor(
cod_professor varchar(10),
nome varchar(30) not null,
cod_disciplina varchar(10),
especialidade varchar(100) not null,
data_admissao date not null,
primary key (cod_professor, cod_disciplina),
constraint fk_professor_disciplina foreign key (cod_disciplina) references disciplina(cod_disciplina) on update cascade
);


INSERT INTO disciplina (cod_disciplina, nome, ementa) 
VALUES	
('PWFE','programação web front end','Esta disciplina explora as
tecnologias e práticas para desenvolvimento de aplicações web e com foco
em front-end.'),

('IDM','interface dispositivos moveis','A disciplina, aborda projetar e
desenvolver interfaces de usuário para aplicativos móveis, com foco nos
princípios de design e usabilidade.'),

('PWBE', 'programação web back end','Tal disciplina aborda conceitos
e técnicas para desenvolvimento de aplicativos web no lado do servidor, com
foco em back-end.'),

('SO','sistemas operacionais','A disciplina contempla conceitos fundamentais
sobre sistemas operacionais, apresentando as funcionalidades dos sistemas
operacionais baseados nas plataformas Windows e Linux.'),

('BD','banco de dados','disciplina contempla conceitos fundamentais de
bancos de dados, modelagem de dados e linguagens de consulta SQL.'),

('REDES','redes de computadores','Esta disciplina aborda conceitos
introdutórios sobre redes de computadores, topologias e padrões.');
 
INSERT INTO professor(cod_professor, nome, cod_disciplina, especialidade, data_admissao) 
VALUES
	 ('101', 'Eduardo Nascimento', 'PWFE', 'TI', '2023-01-15'),
	('101', 'Eduardo Nascimento', 'BD', 'TI', '2023-01-15'),
   	 ('102', 'Matheus Michilino', 'IDM', 'Mecatrônica e Interfaces Robóticas', '2020-01-01'),
   	 ('103', 'Rafael Selvagio', 'PWBE', 'TI', '2023-06-01'),
   	 ('104', 'Rafael Rizzi', 'REDES', 'Eng.Elétrica', '2022-01-01');


-- exercicio 1
select distinct nome from professor where especialidade like '%TI';

-- exercicio 2
select nome from disciplina where nome like '%web%';

-- exercicio 3
select nome from professor order by data_admissao asc limit 1;

-- exercicio 4
select nome from disciplina where cod_disciplina in (select cod_disciplina from professor where especialidade like '%TI');

-- exercicio 5
select professor.especialidade,disciplina.nome
from professor join disciplina 
on professor.cod_disciplina = disciplina.cod_disciplina order by nome;




create table Notas(

nro_matricula int primary key,
nome_aluno varchar(120) not null,
nota int not null

);

insert into Notas (nro_matricula,nome_aluno,nota)
values (100,'gabrielly',10),
(200,'leonardo',5),
(300,'felipe',4),
(400,'adan',10),
(500,'joao',1),
(600,'isadora',0),
(700,'nicole',7),
(800,'joao',8),
(900,'gabriel',9),
(1000,'maria',6);


update Notas set nome_aluno = 'gabrielly'
where nro_matricula = 100;

SET SQL_SAFE_UPDATES = 1;


select nome_aluno,nota from Notas where nota > 7
create table Departamento(
SiglaDepto varchar(50),
NomeDepto varchar(80) not null,
QtdFunc int check(QtdFunc >= 0) not null,
primary key(SiglaDepto, NomeDepto)
);

create table CargoFuncionario(
IdCargo int primary key,
NomeCargo varchar(50) not null,
Descricao varchar(80) not null
);

create table Funcionario(
NomeFunc varchar(50),
CodigoFunc int,
IdCargo int,
SiglaDepto varchar(20) not null,
primary key(CodigoFunc,NomeFunc),
foreign key(SiglaDepto) references Departamento(SiglaDepto),
foreign key(IdCargo) references CargoFuncionario(IdCargo)
);

create table Projeto(
SiglaProj varchar(20),
NomeProj varchar (50),
CodigoFunc int not null,
SiglaDepto varchar(50) not null,
primary key(SiglaProj, NomeProj),
foreign key(SiglaDepto) references Departamento(SiglaDepto),
foreign key(CodigoFunc) references Funcionario(CodigoFunc)
);

alter table Departamento
modify column SiglaDepto varchar(50);

insert into Departamento (SiglaDepto,NomeDepto,QtdFunc)
value ('TI','Tecnologia da Informação','3'),
('SSQNS','So Sei Que Nada Sei','20'),
('MEC','Mac Donald','50'),
('BK','Burguer King','50'),
('SW','Subway','50');

insert into CargoFuncionario (IdCargo,NomeCargo,Descricao)
values ('10','Tecnico de TI','a'),
('20','Naosei','b'),
('30','Cozinheiro','c'),
('40','Chapeiro','d'),
('50','Atendente','e');

insert into funcionario (CodigoFunc,NomeFunc,IdCargo,SiglaDepto)
values ('1','leo','10','TI'),
('2','Felipe','20','SSQNS'),
('3','adan','30','MEC'),
('4','Jorge','40','BK'),
('5','Roberto','50','SW');

insert into Projeto (SiglaProj,NomeProj,CodigoFunc,SiglaDepto)
values ('PC','porque nao funciona','1','TI'),
('NS','Não Sei','2','SSQNS'),
('HM','Hamburguer do bão','3','MEC'),
('HMM','Hambutger Melhor','4','BK'),
('GH','Hamburguer Grande','5','SW');

update Departamento set NomeProj = 'Montador de PC'
where SiglaDepto = "TI";

SET FOREIGN_KEY_CHECKS = 0;

select * from departamento;
select * from funcionario;
select * from cargofuncionario;
select * from projeto;


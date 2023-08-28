create table Departamento(
SiglaDepto varchar(50),
NomeDepto varchar(80) unique,
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
IdCargo int not null,
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








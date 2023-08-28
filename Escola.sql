create table Diciplina(
CodDiciplina int primary key,
NomeDiciplina varchar(50) not null,
Descricao varchar(80) not null
);

create table Curso(
NomeCurso varchar(50) not null,
SiglaCurso varchar(20) primary key,
CargaHoraria int not null,
Descricao varchar(80) not null
);

create table Matricula(
NomeAluno varchar(50) not null,
NroMatricula int primary key,
SiglaCurso varchar(20) not null,
Ano int not null,
Semestre int not null,
foreign key(SiglaCurso) references Curso(SiglaCurso)
);

create table Professor(
Nome varchar(50) not null,
NroRegistroProf int primary key,
CodTurma int not null,
Periodo varchar(20) not null,
CodDiciplina int not null,
foreign key (CodDiciplina) references Diciplina(CodDiciplina)
);

create table Turma(
CodTurma int primary key,
NroAlunos int not null,
SiglaCurso varchar(20) not null,
NroRegistroProf int not null,
foreign key(SiglaCurso) references Curso(SiglaCurso),
foreign key(NroRegistroProf) references Professor(NroRegistroProf)
);


create table Aluno(
CodigoTurma int not null,
NomeAluno varchar(50) not null,
NroChamada int not null,
NroMatricula int primary key,
DataNasc int not null,
Periodo varchar(20) not null,
foreign key(CodigoTurma) references Turma(CodTurma),
foreign key(NroMatricula) references Matricula(NroMatricula)
);

create table Representante(
NomeAluno varchar(50),
NroChamada int,
CodTurma int,
primary key(NomeAluno, NroChamada, CodTurma),
foreign key(CodTurma) references Turma(CodTurma)
);
create table Cliente(
CPFCliente int check(CPFCliente <= 11) primary key,
NomeCliente varchar(30) not null,
CEP int not null,
Telefone int not null,
foreign key (CEP) references clienteendereco(CEP),
foreign key (Telefone) references TelefoneCliente(Telefone)
);

create table ClienteEndereco(
CEP int primary key,
NomeRua varchar(50) not null,
NomeBairro varchar(50) not null,
NumeroDaCasa int not null
);

create table TelefoneCliente(
Telefone int primary key,
TelefoneFixo int not null,
TelefoneCelular int not null
);

create table Medicamento(

CodMedicamento int primary key,
NomeMedicamento varchar(50) not null,
Fabricante varchar(50) not null,
DataValidade date not null
);

create table Venda(
CodVenda int primary key,
DataVenda date not null,
CPFCliente int not null,
CodMedicamento int not null,
foreign key (CPFCliente) references Cliente(CPFCliente),
foreign key (CodMedicamento) references Medicamento(CodMedicamento)
);


create table ItensVenda(
CodVenda int null,
CodMedicamento int not null,
Quantidade int not null,
DataVenda date not null,
foreign key (CodVenda) references Venda(CodVenda),
foreign key (CodMedicamento) references Medicamento(CodMedicamento)
);


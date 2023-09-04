create table Produtos(

codigo int primary key,
nome varchar(80) not null,
preco int not null

);

insert into Produtos (codigo,nome,preco)
values (10,'arroz',50),
(20,'feijao',20),
(30,'macarrao',30),
(40,'chocolate',100),
(50,'salgado',10),
(60,'temperos',20);


select * from Produtos where preco > 50
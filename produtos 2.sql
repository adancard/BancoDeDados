create table Produtos2(

codigo int primary key,
nome varchar (60) not null,
preco int not null,
descricao varchar(120) not null

);



insert into Produtos2 (codigo,nome,preco,descricao)
values (10,'arroz',50,'Arroz seu jao'),
(20,'feijao',30,'feijao broto legal'),
(30,'chocolate',100,'chocolate 100% cacau'),
(40,'agua de rico',90,'So pra quem pode'),
(50,'panela',200,'Panela inox'),
(60,'tempero',10,'Kit tempero'),
(70,'sal',20,'Sal');


select * from Produtos2 where preco >= 50 and preco <= 100
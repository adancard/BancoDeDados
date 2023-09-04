create table Produtos3(

codigo int primary key,
nome varchar(120) not null,
preco int not null,
descricao varchar(200) not null

);

insert into Produtos3 (codigo,nome,preco,descricao)
values (10,'arroz',50,'promoção'),
(20,'feijao',30,'feijao broto legal'),
(30,'chocolate',100,'promoção'),
(40,'agua de rico',90,'So pra quem pode'),
(50,'panela',200,'promoção'),
(60,'tempero',10,'Kit tempero'),
(70,'sal',20,'promoção'),
(80,'agua','10','agua para probre');


select * from Produtos3 
where descricao like "promo%";

select * from Produtos3;
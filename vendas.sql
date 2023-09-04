create table Vendedores(

id int primary key,
nome varchar(80) not null,
vendas_mensais int not null

);

insert into Vendedores (id,nome,vendas_mensais)
values (10,'Joao',500),
(20,'Roberto',1200),
(30,'leonardo',1001),
(40,'Felipe',999),
(50,'Luiz',200),
(60,'Miguel',50);


update Vendedores set nome = 'roberto'
where nome = 'feijao';

SET SQL_SAFE_UPDATES = 1;

select * from Vendedores where vendas_mensais > 1000
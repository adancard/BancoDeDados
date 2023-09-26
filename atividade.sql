create database Farmacia;
use Farmacia;

create table cliente(
cliente_cpf varchar(11),
nome varchar(80) not null,
email varchar(80) not null,
data_Nascimento date not null,
constraint pk_cliente primary key(cliente_cpf)
);

create table cliente_telefone(
cliente_cpf varchar(11) not null,
telefone_Celular bigint not null,
telefone_Fixo bigint not null,
telefone_comercial bigint not null,
constraint fk_cliente_telefone foreign key(cliente_cpf) references cliente(cliente_cpf) on delete cascade
on update cascade
);

create table cliente_endereco(
cliente_cpf varchar(11) not null,
estado varchar(2) not null,
cidade varchar(20) not null,
bairro varchar(50) not null,
rua varchar(50) not null,
numero int not null,
cep varchar(12) not null,
constraint fk_cliente_endereco foreign key (cliente_cpf) references cliente(cliente_cpf) on delete cascade 
on update cascade
);

create table fabricante(
codigo_fabricante varchar(10),
nome_fantasia varchar(80) not null,
razao_social varchar(50) not null,
email varchar(50) not null,
constraint pk_fabricante primary key(codigo_fabricante)
);

create table medicamento(
codigo_medicamento varchar(10),
nome varchar(50) not null,
codigo_fabricante varchar(10),
data_validade date not null,
constraint pk_medicamento primary key(codigo_medicamento),
constraint fk_fabricante_codigo foreign key(codigo_fabricante) references fabricante(codigo_fabricante)
);


create table venda(
codigo_venda varchar(10),
quantidade int not null,
data_venda date not null,
cliente_cpf varchar(11) not null,
codigo_medicamento varchar(10) not null,
constraint pk_venda primary key(codigo_venda),
constraint fk_venda_cliente foreign key (cliente_cpf) references cliente (cliente_cpf),
constraint fk_venda_medicamento foreign key (codigo_medicamento) references medicamento(codigo_medicamento)
);

-- Inserts para Clientes
INSERT INTO cliente (cliente_cpf, nome, email, data_nascimento)
VALUES
    ('12345678901', 'Euclidis da Cunha', 'euclidis@email.com', '1980-05-15'),
    ('23456789012', 'Fernando Pessoa', 'fernando@email.com', '1982-02-28'),
    ('34567890123', 'Joana de Almeida', 'joana@email.com', '1985-09-10'),
    ('45678901234', 'Carlos da Silva', 'carlos@email.com', '2008-12-20'),
    ('56789012345', 'Bianca Nunes', 'bianca@email.com', '1995-04-05'),
    ('67890123456', 'Gilberto Pessoa', 'gilberto@email.com', '2000-07-12'),
    ('78901234567', 'Fabiana de Almeida', 'fabiana@email.com', '1999-11-30'),
    ('89012345678', 'Ana Pessoa', 'ana@email.com', '2007-03-25'),
	('11890023414', 'Daniel Abrantes', 'daniel@email.com', '1991-04-11'),
    ('33301034101', 'Fabio Cortes', 'fabio@email.com', '1989-01-30'),
    ('29022345222', 'Cleber Amaral', 'camaral@email.com', '1998-09-23'),
	('12057845231', 'Amaral Cleber', 'xamaral@email.com', '2000-10-24'),
	('21957216780', 'Joger Cleber', 'jorger@email.com', '2004-10-20');
    

-- Inserts para Fabricantes
INSERT INTO fabricante (codigo_fabricante, nome_fantasia, razao_social, email)
VALUES
    ('F001', 'Nossa Farma Farmacêutica', 'FarmA', 'nossafarma@farma.com'),
    ('F002', 'Saúde Farmacêutica', 'FarmB', 'contatosaude@farma.com'),
    ('F003', 'Quimica Boa Farmacêutica', 'FarmC', 'quimicaboa@farma.com'),
    ('F004', 'Melhora Farmacêutica', 'FarmD', 'melhora@farma.com'),
    ('F005', 'CEMAC Farmacêutica', 'FarmE', 'cemac@farma.com'),
    ('F006', 'Quimio Farmacêutica', 'FarmF', 'quimeiofarma@farma.com'),
    ('F007', 'Quimera Farmacêutica', 'FarmG', 'quimerafarma@farma.com'),
	('F008', 'Cooperativa Farmacêutica', 'FarmH', 'coopfarma@farma.com'),
    ('F009', 'Vitta Farmacêutica', 'FarmI', 'vittafarma@farma.com'),
	('F010', 'Vital Medical Farmacêutica', 'FarmJ', 'vmedical@farma.com'),
	('F011', 'SANS Farmacêutica', 'FarmL', 'sansfarma@farma.com'),
    ('F012', 'Drogaria sao carlos', 'DROG', 'droganca@farma.com'),
    ('F013', 'Drogaria sao paulo', 'DROGS', 'drogsaop@farma.com');

-- Inserts para Medicamentos
INSERT INTO medicamento (codigo_medicamento, nome, codigo_fabricante, data_validade)
VALUES
    ('M001', 'Paracetamol', 'F001', '2025-12-31'),
    ('M002', 'Ibuprofeno', 'F002', '2024-06-30'),
    ('M003', 'Amoxicilina', 'F003', '2026-09-15'),
    ('M004', 'Dipirona', 'F004', '2023-12-20'),
    ('M005', 'Omeprazol', 'F005', '2024-11-30'),
    ('M006', 'Ranitidina', 'F006', '2026-08-25'),
    ('M007', 'Losartana', 'F001', '2024-07-10'),
    ('M008', 'Metformina', 'F001', '2025-11-05'),
	('M009', 'Dorflex', 'F007', '2028-11-05'),
	('M010', 'Metformina', 'F002', '2023-10-05');


-- Inserts para Endereços (cliente_endereco)
INSERT INTO cliente_endereco (cliente_cpf, estado, cidade, bairro, rua, numero, cep)
VALUES
    ('12345678901', 'SP', 'São Paulo', 'Centro', 'Rua XV de Novembro', 123, '01234-567'),
    ('23456789012', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Beira Rio', 456, '04567-890'),
    ('34567890123', 'MG', 'Belo Horizonte', 'Savassi', 'Avenida Tiradentes', 789, '05678-901'),
    ('45678901234', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Avenida Dom Pedro', 801, '06789-012'),
    ('56789012345', 'PR', 'Curitiba', 'Batel', 'Rua Emiliano Costa', 202, '07890-123'),
	('67890123456', 'SP', 'São Paulo', 'Vila Madalena', 'Rua Das Alamedas', 303, '08901-234'),
    ('78901234567', 'SP', 'São Paulo', 'Ipiranga', 'Avenida Getulio Vargas', 585, '09012-345'),
    ('89012345678', 'SP', 'São Paulo', 'Liberdade', 'Rua Coronel Leonidas', 757, '09123-456');
    

-- Inserts para Números de Telefone (cliente_telefone)
INSERT INTO cliente_telefone (cliente_cpf, telefone_Celular, telefone_Fixo, telefone_comercial)
VALUES
    ('12345678901', 1198765421, 1123456789, 1133334411),
    ('23456789012', 2199998881, 2145678901, 2112345678),
    ('34567890123', 3198800771, 3123456789, 3155556600),
    ('45678901234', 5199996662, 5123456789, 5133334488),
    ('56789012345', 4199811771, 4123456789, 4144499556),
    ('67890123456', 1199777662, 7123456789, 1133399441),
    ('78901234567', 1199622555, 8123456789, 1133300442),
    ('89012345678', 1199711440, 6123456789, 1133322443);

-- Inserts para Vendas
INSERT INTO venda (codigo_venda, quantidade, data_venda, cliente_cpf, codigo_medicamento)
VALUES
    ('V001', 2, '2023-01-15', '12345678901', 'M001'),
    ('V002', 3, '2023-02-20', '23456789012', 'M002'),
    ('V003', 3, '2023-02-25', '34567890123', 'M003'),
    ('V004', 3, '2023-04-30', '45678901234', 'M004'),
    ('V005', 4, '2023-02-10', '56789012345', 'M005');
    
    
    -- CONSULTAS
    
    select * from cliente where data_Nascimento > '1990-01-01';
    
    select * from medicamento where year(data_validade) = 2024;
    
    select * from cliente where nome like '%Pessoa';
    
	select nome,email from cliente where year(data_Nascimento) > 2000 order by nome desc limit 5;
    
    -- SUBCONSULTAS
    
    select nome,cliente_cpf from cliente where cliente_cpf in(select cliente_cpf from cliente_endereco where cidade like 'São Paulo');
    
    select nome from cliente where cliente_cpf in 
    (select cliente_cpf from venda where codigo_medicamento in(select codigo_medicamento from medicamento where nome like 'Paracetamol'));
    
    select nome from medicamento where year(data_validade) < 2024;
    
	select codigo_fabricante, count(*) as codigo_medicamento from medicamento group by codigo_fabricante;
    
    -- INNER JOIN
    
    select medicamento.nome, fabricante.nome_fantasia
    from medicamento join fabricante
    on medicamento.codigo_fabricante = fabricante.codigo_fabricante;
    
    select venda.data_venda,cliente.nome
    from venda join cliente
    on venda.cliente_cpf = cliente.cliente_cpf;
    
    select nome,cliente_telefone.*,cliente_endereco.* from cliente 
    join cliente_telefone on cliente_telefone.cliente_cpf = cliente.cliente_cpf
    join cliente_endereco on cliente_endereco.cliente_cpf = cliente.cliente_cpf;
    
    
    -- LEFT JOIN
    
	select f.codigo_fabricante, f.nome_fantasia,email,m.nome from fabricante f left join medicamento m
    on f.codigo_fabricante = m.codigo_fabricante order by f.codigo_fabricante;
    
    select c.nome, c.cliente_cpf ,cliente_endereco.*, cliente_telefone.* from cliente c 
    left join cliente_endereco on c.cliente_cpf = cliente_endereco.cliente_cpf
    left join cliente_telefone on c.cliente_cpf = cliente_telefone.cliente_cpf;

    
    -- RIGHT JOIN
    
    select m.nome, f.nome_fantasia from medicamento m right join fabricante f 
    on m.codigo_fabricante = f.codigo_fabricante;
    
    select v.codigo_venda, c.nome from venda v right join cliente c 
    on v.cliente_cpf = c.cliente_cpf;
    
    -- FULL JOIN
    
    select cliente.nome, concat(estado," ",cidade," ",bairro," ",rua," ",numero," ",cep) as endereco from cliente left join cliente_endereco on
    cliente.cliente_cpf = cliente_endereco.cliente_cpf
    union
    select  cliente.nome, concat(estado," ",cidade," ",bairro," ",rua," ",numero," ",cep) as endereco from cliente right join cliente_endereco on
    cliente.cliente_cpf = cliente_endereco.cliente_cpf;
    
    select cliente.nome, venda.codigo_venda from cliente left join venda on cliente.cliente_cpf = venda.cliente_cpf
    union
	select cliente.nome, venda.codigo_venda from cliente right join venda on cliente.cliente_cpf = venda.cliente_cpf;
    
    -- CROSS JOIN
    
    select medicamento.*, fabricante.* from medicamento cross join fabricante;
    
    -- SELF JOIN
     
    select  c1.cliente_cpf as cliente1,
			c2.cliente_cpf as cliente2,
            c1.cidade  as cidade
	from cliente_endereco as c1 join cliente_endereco as c2
    on  c1.cidade = c2.cidade
    where c1.cliente_cpf < c2.cliente_cpf
    
    
    

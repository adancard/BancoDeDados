CREATE DATABASE banco_modelo01;

USE banco_modelo01;

CREATE TABLE departamento (
    sigla_depto VARCHAR(15),
    nome_depto VARCHAR(50),
    qtd_funcionarios_depto INT NOT NULL CHECK(qtd_funcionarios_depto >= 0),
    CONSTRAINT pk_departamento PRIMARY KEY (sigla_depto, nome_depto)
);

CREATE TABLE funcionario (
    codigo_funcionario INT CHECK(codigo_funcionario >= 0),
    nome_funcionario VARCHAR(50) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    sigla_depto VARCHAR(15) NOT NULL,
    CONSTRAINT pk_funcionario PRIMARY KEY (codigo_funcionario, nome_funcionario),
    CONSTRAINT fk_departamento_funcionario FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto) ON DELETE CASCADE
);

CREATE TABLE projeto (
    sigla_projeto VARCHAR(15),
    nome_projeto VARCHAR(50),
    codigo_funcionario INT NOT NULL CHECK(codigo_funcionario >= 0),
    sigla_depto VARCHAR(15) NOT NULL,
    CONSTRAINT pk_projeto PRIMARY KEY (sigla_projeto, nome_projeto),
    CONSTRAINT fk_departamento_projeto FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto) ON DELETE CASCADE,
    CONSTRAINT fk_funcionario_projeto FOREIGN KEY (codigo_funcionario) REFERENCES funcionario(codigo_funcionario) ON DELETE CASCADE
);

INSERT INTO departamento (sigla_depto, nome_depto, qtd_funcionarios_depto)
VALUES
    ('RH', 'Recursos Humanos', 10),
    ('TI', 'Tecnologia da Informação', 20),
    ('VENDAS', 'Vendas', 15),
    ('ADM', 'Administrativo', 11),
    ('MKT', 'Marketing', 4);

INSERT INTO funcionario (codigo_funcionario, nome_funcionario, cargo, sigla_depto)
VALUES
    (100, 'Fernanda Lima', 'Vendas', 'VENDAS'),
    (101, 'Fabio Santos', 'Desenvolvedor', 'TI'),
    (102, 'Bianca Costa', 'Desenvolvedora', 'TI'),
    (103, 'Carlos Oliveira', 'Vendedor', 'VENDAS'),
    (104, 'Thiago Pereira', 'Contador', 'ADM'),
    (105, 'Luiza Costa', 'Secretaria', 'RH'),
    (106, 'João Nascimento', 'Promotor', 'MKT'),
    (107, 'Ana Alencar', 'Secretaria', 'RH'),
    (108, 'Vanessa Gomes', 'Contadora', 'ADM'),
    (109, 'Jonas da  Silva', 'Promotor', 'MKT'),
    (110, 'Romeu de Nobrega', 'Desenvolvedor', 'TI'),
    (111, 'Romeu de Nobrega', 'Desenvolvedor', 'MKT'),
    (112, 'Bianca Costa', 'Desenvolvedora', 'TI');

INSERT INTO projeto (sigla_projeto, nome_projeto, codigo_funcionario, sigla_depto)
VALUES
    ('VENDAS01', 'Vendas em Atacado', 100, 'VENDAS'),
    ('TI01', 'Desenvolvimento de Software', 101, 'TI'),
    ('TI02', 'Atualização do Banco de Dados', 102, 'TI'),
    ('VENDAS02', 'Expansão de Mercado', 103, 'VENDAS'),
    ('ADM01', 'Balanço Semestral', 104, 'ADM'),
    ('RH01', 'Melhoria de Processos', 105, 'RH'),
    ('MKT01', 'Propaganda de Varejo', 106, 'MKT'),
    ('RH02', 'Reunião da Gerência', 107, 'RH'),
    ('ADM02', 'Treinamento de Novos Funcionários', 108, 'ADM'),
    ('MKT02', 'Propaganda de Atacado', 109, 'MKT'),
    ('TI03', 'Atualização de Versão', 110, 'TI');
    
    # mostra a tabela sem ter nomes duplicados 
    select distinct nome_funcionario,sigla_depto from funcionario;
    
    select distinct sigla_depto,nome_depto from departamento;
    
    select nome_depto from departamento where qtd_funcionarios_depto < 11; 
    
    select nome_depto from departamento where qtd_funcionarios_depto >= 15; 
    
    select nome_funcionario from funcionario where sigla_depto = 'TI';
    
    select nome_funcionario,cargo from funcionario order by nome_funcionario desc;
    
    select nome_depto,sigla_depto from departamento order by nome_depto asc;
    
    select * from projeto order by nome_projeto asc;    
    
    alter table funcionario
    add data_admissao date,
    add salario decimal (10,2);
    
    alter table projeto
    add duração int;
    
	UPDATE funcionario SET data_admissao = '2017-09-21', salario = 4000.00 WHERE codigo_funcionario = 100; 
	UPDATE funcionario SET data_admissao = '2019-05-29', salario = 3000.00 WHERE codigo_funcionario = 101; 
	UPDATE funcionario SET data_admissao = '2015-01-01', salario = 6500.00 WHERE codigo_funcionario = 102; 
	UPDATE funcionario SET data_admissao = '2020-11-15', salario = 3400.00 WHERE codigo_funcionario = 103; 
	UPDATE funcionario SET data_admissao = '2021-07-10', salario = 3600.00 WHERE codigo_funcionario = 104;
	UPDATE funcionario SET data_admissao = '2018-02-01', salario = 3000.00 WHERE codigo_funcionario = 105;
	UPDATE funcionario SET data_admissao = '2018-02-01', salario = 4100.00 WHERE codigo_funcionario = 106;
	UPDATE funcionario SET data_admissao = '2020-03-12', salario = 5200.00 WHERE codigo_funcionario = 107;
	UPDATE funcionario SET data_admissao = '2020-03-18', salario = 4900.00 WHERE codigo_funcionario = 108;
	UPDATE funcionario SET data_admissao = '2020-03-02', salario = 3700.00 WHERE codigo_funcionario = 109;
	UPDATE funcionario SET data_admissao = '2021-04-22', salario = 4600.00 WHERE codigo_funcionario = 110;
	UPDATE funcionario SET data_admissao = '2021-04-22', salario = 4600.00 WHERE codigo_funcionario = 111;
	UPDATE funcionario SET data_admissao = '2015-01-01', salario = 6500.00 WHERE codigo_funcionario = 112;

	-- 14) b) Agora faça as alterações necessárias para deixar os campos data_admissao e salario como itens obrigatórios para futuros inserts.
	ALTER TABLE funcionario
	MODIFY COLUMN data_admissao DATE NOT NULL,
	MODIFY COLUMN salario DECIMAL(10, 2) NOT NULL;

	
	-- SELECT 2
    
    -- tarefa 1
	select nome_depto from departamento where qtd_funcionarios_depto > 15;
    
    -- tarefa 2
    select nome_funcionario from funcionario where salario >= 4.000;
    
    -- tarefa 3
    select round(avg(salario),2) as Salario_Medio from funcionario;
    
    -- tarefa 4
    select nome_funcionario from funcionario 
    where nome_funcionario like '%Silva';
    
    -- tarefa 5
    select round(avg(salario),2) as salarioDuasCasas from funcionario;
    
    -- tarefa 6
	select nome_funcionario from funcionario 
    where nome_funcionario like '%Gomes';
    
    -- tarefa 7
    select nome_funcionario,(salario*12) as Salario_Anual from funcionario;

    -- tarefa 8
	select max(salario) as Salario_Mais_alto from funcionario;
    
    -- tarefa 9
    select salario from funcionario order by salario desc limit 2;
    
    -- tarefa 10
    select * from funcionario;
    
    -- tarefa 11
    select nome_funcionario, cargo, max(data_admissao) as Data_admissao from funcionario
    group by nome_funcionario, cargo
    order by data_admissao;
    
	-- tarefa 12
   select nome_depto from departamento
   where exists (
   select 1 from funcionario 
   where( funcionario.sigla_depto = departamento.sigla_depto) and ( funcionario.salario > 5000)
);
   
   -- tarefa 13
   select d.nome_depto from departamento d
   where exists (
   select 1 from funcionario f where(
   (f.sigla_depto = d.sigla_depto) and salario >(select avg(salario) from funcionario)
   )
   );
   
   
   -- SUBQUERY
   -- tarefa 1
	select f.nome_funcionario from funcionario f
    where f.sigla_depto in (select d.nome_depto from departamento d where d.nome_depto like '%Vendas');
    
	-- tarefa 2
    select f.nome_funcionario,f.sigla_depto from funcionario f 
    where f.codigo_funcionario in (select p.codigo_funcionario from projeto p where p.sigla_depto like '%MKT' or '%RH');
    
	-- tarefa 3 
	select d.nome_depto, (select sum(f.salario) from funcionario f where f.sigla_depto = d.sigla_depto) as Salario_Total from  departamento d;
    
    -- tarefa 4
    select distinct f.nome_funcionario, f.salario from funcionario f 
    where f.sigla_depto in ( select p.sigla_depto from projeto p where p.sigla_depto like 'TI' and f.salario > (select avg(f.salario) from funcionario f)); 
    
    -- tarefa 5
    select d.nome_depto, (select count(sigla_depto) from funcionario where sigla_depto = d.sigla_depto) from departamento d;
    
    -- tarefa 6
	select distinct f.nome_funcionario, f.salario from funcionario f 
	where f.sigla_depto in ( select p.sigla_depto from projeto p where p.sigla_depto like 'RH' and f.salario > (select avg(f.salario) from funcionario f)); 
    
    -- tarefa 7
    select d.nome_depto, (  select group_concat(nome_funcionario) from funcionario where sigla_depto = d.sigla_depto) as Nome_Funcionarios from departamento d;

-- Grupo 01
-- Nomes : Adan, Leonardo Amaral, Ricardo, Fabricio

create database meu_banco;

use meu_banco;

create table info_pessoais_funcionario(
cpf varchar(15),
nome varchar(40) not null,
tel_celular varchar(15) not null,
tel_residencial varchar(15),
email_pessoal varchar(40) not null,
status_info boolean default(1),
constraint pk_info_funcionario primary key(cpf)
);

create table departamento(
codigo_depto bigint auto_increment,
sigla_depto varchar(15) not null,
nome_depto varchar(50) not null,
descricao text not null,
quantidade_funcionarios_depto int not null,
status_depto boolean default(1),
constraint pk_departamento primary key(codigo_depto)
);

create table funcionario(
codigo_funcionario bigint auto_increment,
cargo varchar(100),
data_admissao date not null,
data_demissao date,
cpf_funcionario varchar(15) not null,
email_funcionario varchar(40) not null,
codigo_depto_funcionario bigint not null,
status_funcionario boolean default(1),
index idx_cargo (cargo),
constraint pk_funcionario primary key(codigo_funcionario),
constraint fk_funcinario foreign key (cpf_funcionario) references info_pessoais_funcionario(cpf) on delete cascade on update cascade,
constraint fk_funcionario_departamento foreign key(codigo_depto_funcionario) references departamento(codigo_depto)
);

create table projeto(
codigo_projeto bigint auto_increment,
nome_projeto varchar(50) not null,
duracao_horas_pojeto int not null,
descricao_depto text not null,
codigo_funcionario bigint not null,
codigo_depto_projeto bigint not null,
status_projeto boolean default(1),
index idx_nome_projeto (nome_projeto),
constraint pk_Projeto primary key(codigo_projeto),
constraint fk_Projeto_funcionario foreign key(codigo_funcionario) references funcionario(codigo_funcionario),
constraint fk_projeto_departamento foreign key(codigo_depto_projeto) references departamento(codigo_depto)
);

INSERT INTO info_pessoais_funcionario (cpf, nome, tel_celular, tel_residencial, email_pessoal)
VALUES
('123.456.789-01', 'Carlos da Silva', '987654321', '33347788', 'carlos@meuemail.com'),
('213.416.889-08', 'Fernando de Morais', '997654312', '33221766', 'fernando@meuemail.com'),
('321.425.189-09', 'Pedro Sales', '997654312', '34422700', 'pedro@meuemail.com'),
('431.421.289-01', 'Jonas Rocha', '998644914', '34258877', 'jonas@meuemail.com'),
('337.555.551-06', 'Mario Antumes', '987659300', '33416182', 'mario@meuemail.com'),
('177.774.121-11', 'Fabiana Maia', '997651122', '33226131', 'fabiana@meuemail.com'),
('456.789.123-03', 'Angela Santos', '987551355', '33678912',  'angela@meuemail.com'),
('109.222.444-99', 'Bruno Portugal', '9789123456', '33698810', 'bruno@meuemail.com'),
('201.122.332-68', 'Cintia Costa', '9889663355', '33002211', 'cintia@meuemail.com'),
('787.123.556-01', 'Jorge Azevedo', '9989123451', '33569871', 'jorge@meuemail.com'),
('223.121.757-54', 'Gabriel Diniz', '9989111488', '33441711', 'gabriel@meuemail.com'),
('981.829.858-04', 'Jessica Almeida', '9889121400', '33456912', 'jessica@meuemail.com'),
('414.067.390-15', 'Paulo Moreira', '998117811', '33422198', 'paulo@meuemail.com');

INSERT INTO departamento (sigla_depto, nome_depto, descricao, quantidade_funcionarios_depto)
VALUES
('TI', 'Tecnologia da Informação', 'Setor responsável pelo desenvolvimento de software.', 5),
('RH', 'Recursos Humanos', 'Setor responsável por questões relacionadas a pessoal e recursos humanos.', 2),
('VEND', 'Vendas', 'Setor responsável por negociação e fechamento de contratos.', 3),
('ADM', 'Administração', 'Setor responsável por questões internas da empresa.', 1),
('FIN', 'Financeiro', 'Setor responsável por controle de finanças e contabilidade.', 2);

INSERT INTO funcionario (cargo, data_admissao, cpf_funcionario, email_funcionario, codigo_depto_funcionario)
VALUES
('Desenvolvedor', '2022-01-10', '123.456.789-01', 'carlos@meuemail.com', 1),
('Analista de Sistemas', '2022-05-15', '213.416.889-08', 'fernando@meuemail.com', 1),
('Programador', '2022-03-20', '321.425.189-09', 'pedro@meuemail.com', 1),
('Engenheiro de Software', '2023-01-10', '431.421.289-01', 'jonas@meuemail.com', 1),
('Analista de TI', '2023-07-01', '337.555.551-06', 'mario@meuemail.com', 1),
('Analista de RH', '2022-09-05', '177.774.121-11', 'fabiana@meuemail.com', 2),
('Assistente de RH', '2023-03-15', '456.789.123-03', 'angela@meuemail.com', 2),
('Vendedor Sênior', '2023-02-10', '109.222.444-99', 'bruno@meuemail.com', 3),
('Assistente de Vendas', '2022-12-01', '201.122.332-68', 'cintia@meuemail.com', 3),
('Gerente de Vendas', '2023-04-05', '787.123.556-01', 'jorge@meuemail.com', 3),
('Assistente Administrativo', '2023-06-20', '223.121.757-54', 'gabriel@meuemail.com', 4),
('Analista Financeiro', '2023-02-15', '981.829.858-04', 'jessica@meuemail.com', 5),
('Contador', '2022-11-10', '414.067.390-15', 'paulo@meuemail.com', 5);


INSERT INTO projeto (nome_projeto, duracao_horas_pojeto, descricao_depto, codigo_funcionario, codigo_depto_projeto)
VALUES
('Desenvolvimento de Software', 300, 'Setor de TI responsável pelo desenvolvimento de software.', 1, 1),
('Manutenção de Sistemas', 120, 'Setor de TI responsável pela manutenção de sistemas.', 2, 1),
('Implementação de Novas Tecnologias', 180, 'Setor de TI implementando novas tecnologias.', 3, 1),
('Treinamento de Novos Funcionários', 50, 'Setor de RH treinando novos funcionários.', 4, 2),
('Melhoria de Processos Internos', 25, 'Setor de RH melhorando processos internos.', 5, 2),
('Expansão para Novos Mercados', 30, 'Setor de Vendas buscando expansão para novos mercados.', 6, 3),
('Campanha de Vendas Online', 40, 'Setor de Vendas realizando campanha online.', 7, 3),
('Treinamento de Equipe de Vendas', 50, 'Setor de Vendas treinando a equipe de vendas.', 8, 3),
('Reestruturação Administrativa', 30, 'Setor Administrativo passando por reestruturação.', 9, 4),
('Controle Financeiro Mensal', 30, 'Setor Financeiro cuidando do controle financeiro.', 10, 5),
('Auditoria Contábil Anual', 12, 'Setor Financeiro realizando auditoria contábil.', 11, 5);

-- 3) Faça o soft delete do funcionário de código 2.

UPDATE funcionario
SET status_funcionario = 0
WHERE codigo_funcionario = 2;


/*5) Adicione 2 índices:
- O primeiro deve ser adicionado em cargo na tabela de Funcionário
- O segundo deve ser adicionado em nome na tabela de Projeto
index idx_cargo (cargo)
index idx_nome_projeto (nome_projeto)
*/
select * from funcionario where cargo = 'Contador';
select * from projeto where nome_projeto = 'Implementação de Novas Tecnologias';

/* Nessa parte usaria o savepoint pelo motivo de se der errado eu dar rollback e tentar refazer e depois dar commit */

/*6) Crie as seguintes Views
a) Faça uma view apenas com o código, nome e e-mail da tabela Funcionário.*/
create view view_info_funcionario as 
select ipf.nome as nome_funcionario, ipf.email_pessoal as email_funcionario, f.codigo_funcionario
from funcionario f join info_pessoais_funcionario ipf on f.cpf_funcionario = ipf.cpf;

select * from view_info_funcionario;

/* Nessa parte usaria o savepoint pelo motivo de se der errado eu dar rollback e tentar refazer e depois dar commit */

/*b) Faça uma view com código e nome da tabela Funcionário, que contenha
também o código e nome da tabela Projeto e pôr fim a sigla e o nome da tabela
Departamento.*/
create view view_info as select 
ipf.nome as nome_funcionario,
f.codigo_funcionario,
p.nome_projeto, p.codigo_projeto,
d.codigo_depto, d.sigla_depto 
from funcionario f
join info_pessoais_funcionario ipf on f.cpf_funcionario = ipf.cpf
join departamento d on d.codigo_depto = d.codigo_depto
join projeto p on d.codigo_depto = p.codigo_projeto;

select * from view_info;

/* Nessa parte usaria o savepoint pelo motivo de se der errado eu dar rollback e tentar refazer e depois dar comit */

-- 7 A
Delimiter //
    Create Procedure atualizar_funcionario(
    In f_novo_cargo_funcionario varchar(50),
    In f_codigo_funcionario bigint
    )
    Begin
   UPDATE funcionario SET cargo  = f_novo_cargo_funcionario
   WHERE codigo_funcionario = f_codigo_funcionario ;
    end
// Delimiter ;

/* Nessa parte eu usaria o savepoint pela causa que aqui iria testar se mudaria o cargo do funcionario pelo codigo  */
call atualizar_funcionario('Gerente',1);	
/* Se caso desse errado/certo eu daria rollback para que ele nao modificace o codigo padrao e depois daria um comit */



/* Nessa parte usaria o savepoint pelo motivo de se der errado eu dar rollback e tentar refazer e depois dar commit */

-- 7 B
Delimiter //
  Create procedure projeto(
  in p_codigo_depto_funcionario bigint
  )
  begin
  Select * from funcionario
  where codigo_funcionario IN
  (select codigo_funcionario from projeto where 
  codigo_depto_funcionario = p_codigo_depto_funcionario);
  end
// Delimiter ;

call projeto(1);

/* Nessa parte usaria o savepoint pelo motivo de se der errado eu dar rollback e tentar refazer e depois dar commit */

-- exercicio 8 letra A
 DELIMITER //
 CREATE FUNCTION FuncionariosPorProjeto(codigo_projeto_func int) 
 RETURNS INT deterministic
 BEGIN
	declare quatidade_funcinario_func int;
    select count(*) into quatidade_funcinario_func from info_pessoais_funcionario where cpf in
    (select cpf_funcionario from funcionario where codigo_depto_funcionario in 
    (select codigo_depto from departamento where codigo_depto in
    (select codigo_depto_projeto from projeto where codigo_projeto = codigo_projeto_func)));
    
    return quatidade_funcinario_func;
 END //
 DELIMITER ;

select FuncionariosPorProjeto(1);

/* Nessa parte usaria o savepoint pelo motivo de se der errado eu dar rollback e tentar refazer e depois dar commit */

-- exercicio 8 Letra B
DELIMITER //
 CREATE FUNCTION ClassificarDuracaoDoProjeto(codigo_projeto_func int) 
 RETURNS varchar(10) deterministic
 BEGIN
	declare duracao_projeto_func int;
    declare classificacao_projeto varchar(30);
    
    select duracao_horas_pojeto into duracao_projeto_func from projeto where codigo_projeto = codigo_projeto_func limit 1;
    
    if duracao_projeto_func < 50 then
			set classificacao_projeto = 'Curta';
	elseif duracao_projeto_func >= 50 and duracao_projeto_func <=100 then
			set classificacao_projeto = 'Média';
	else 
			set classificacao_projeto = 'Longa';
	end if;
    return classificacao_projeto;
 END //
 DELIMITER ;
 
select ClassificarDuracaoDoProjeto(1) classificacao_projeto;

-- desafio
create view view_funcionario_ativo as select nome_depto from departamento 
join funcionario on codigo_depto = codigo_depto_funcionario and status_funcionario = 1 and quantidade_funcionarios_depto > 3 ;

select distinct * from view_funcionario_ativo;
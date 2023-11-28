DELIMITER //
create function ObterNomeAluno (numero_matricula_func int)
returns varchar(200) deterministic
begin
	declare nome_aluno_func varchar(80);
	select nome into nome_aluno_func from info_pessoais_aluno 
    where cpf in(select cpf_aluno from aluno 
    where num_matricula_aluno in(select numero_matricula from matricula 
    where numero_matricula = numero_matricula_func));
	return nome_aluno_func;
end //
DELIMITER ;

select ObterNomeAluno(1);
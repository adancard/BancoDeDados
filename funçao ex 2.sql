DELIMITER //
create function QtdAlunoTurma (codigo_turma_function int)
returns int deterministic
begin
	declare QTD_Aluno int;
	select COUNT(*) into QTD_Aluno from matricula
    where codigo_turma = codigo_turma_function;
	return QTD_Aluno;
end //
DELIMITER ;


select QtdAlunoTurma(1);
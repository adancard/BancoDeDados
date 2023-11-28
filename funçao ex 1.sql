DELIMITER //
create function StatusProfessor(codigo int)
returns bool deterministic
begin
	declare status_professor bool;
	select status_prof into status_professor from professor where codigo_prof = codigo;
    return status_professor;
end // 
DELIMITER ;

select StatusProfessor(1);
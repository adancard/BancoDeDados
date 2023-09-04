CREATE TABLE Aluno  (
    Matricula INT PRIMARY KEY NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    DataNascimento DATE NOT NULL,
    Email VARCHAR(100) 
 );
 
 CREATE TABLE Matricula (
    idMatricula INT PRIMARY KEY NOT NULL,
    NomeAluno VARCHAR(50) NOT NULL,
    SiglaCurso VARCHAR(10) NOT NULL,
    DataInicio DATE NOT NULL,
    FOREIGN KEY (idMatricula) REFERENCES Aluno(Matricula)
 );
 
 select * from aluno;

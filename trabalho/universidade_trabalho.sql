CREATE SCHEMA universidade;
USE universidade;

CREATE TABLE curso(
codigo INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cargaHoraria INT DEFAULT 3600);

CREATE TABLE professor(
matricula INT(4) ZEROFILL PRIMARY KEY,
email VARCHAR(150) NOT NULL UNIQUE,
cursoCoordenado INT,
FOREIGN KEY (cursoCoordenado) REFERENCES curso(codigo));

CREATE TABLE materia(
codMateria INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cargaHoraria INT NOT NULL CHECK(cargaHoraria >= 40));

CREATE TABLE curso_has_materias(
idCurso INT NOT NULL,
idMateria INT NOT NULL,
PRIMARY KEY(idCurso, idMateria),
FOREIGN KEY (idMateria) REFERENCES materia(codMateria),
FOREIGN KEY (idCurso) REFERENCES curso(codigo));

CREATE TABLE disciplina(
idDisciplina INT PRIMARY KEY,
vagas INT NOT NULL CHECK(vagas BETWEEN 0 AND 60),
semestre ENUM("1", "2") NOT NULL,
codMateria INT NOT NULL,
professor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (professor) REFERENCES professor(matricula),
FOREIGN KEY (codMateria) REFERENCES materia(codMateria));

CREATE TABLE pre_requisitos(
idMateria INT,
idRequisito INT,
PRIMARY KEY(idMateria, idRequisito),
FOREIGN KEY (idMateria) REFERENCES materia(codMateria),
FOREIGN KEY (idRequisito) REFERENCES materia(codMateria));

CREATE TABLE alunos(
matricula INT PRIMARY KEY,
curso INT,
FOREIGN KEY (curso) REFERENCES curso(codigo));

CREATE TABLE emails_alunos(
email VARCHAR(150) PRIMARY KEY,
aluno INT NOT NULL,
FOREIGN KEY (aluno) REFERENCES alunos(matricula));

CREATE TABLE alunos_has_disciplinas(
matriculaAluno INT NOT NULL,
idDisciplina INT NOT NULL,
PRIMARY KEY(matriculaAluno, idDisciplina),
FOREIGN KEY (matriculaAluno) REFERENCES alunos(matricula),
FOREIGN KEY (idDisciplina) REFERENCES disciplina(idDisciplina));

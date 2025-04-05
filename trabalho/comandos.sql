INSERT INTO professor(matricula, email, cursoCoordenado)
VALUES (1, "roberto@gmail.com", 1),
(2, "claudia@hotmail.com", 2),
(3, "pedro@outlook.com", 3);

INSERT INTO materia(codMateria, nome, cargaHoraria)
VALUES (10, "Cálculo I", 80),
(14, "Banco de Dados I", 40),
(12, "Cálculo II", 80),
(13, "Anatomia", 60);

INSERT INTO curso_has_materias(idCurso, idMateria)
VALUES (1, 10),
(1, 14),
(5, 10),
(3, 12),
(3, 10);

INSERT INTO disciplina(idDisciplina, vagas, semestre, codMateria, professor)
VALUES (100, 50, "1", 10, 0001),
(101, 54, "2", 14, 0002);

INSERT INTO pre_requisitos(idMateria, idRequisito)
VALUES (12, 10),
(10, 14),
(14, 12),
(12, 14);

INSERT INTO alunos(matricula, curso)
VALUES (111, 1),
(112, 2),
(113, 3),
(114, 1),
(115, 4),
(116, 2),
(117, 5),
(118, 3),
(119, 1),
(120, 1);

INSERT INTO emails_alunos(email, aluno)
VALUES ("pedropascal@gmail.com", 111),
("bradpitt@gmail.com", 112),
("pedro2@gmail.com", 111),
("robertocarlos", 113),
("laracroft@gmail.com", 114);

INSERT INTO alunos_has_disciplinas(matriculaAluno, idDisciplina)
VALUES (111, 100),
(112, 101),
(113, 100),
(114, 100),
(112, 100),
(115, 101),
(116, 100),
(117, 101);

# CONSULTAS

# 1. Número de alumnos, caracter de las asignaturas y nota media, mínima y máxima de la nota media de los tres trimestres ordenados en primer lugar por Curso de forma ascendente y después por Nota Media de forma descendente
SELECT Curso, Nombre, Carácter, COUNT(NotaMedia) AS Alumnos, ROUND(MIN(NotaMedia), 2) AS NotaMin, ROUND(MAX(NotaMedia), 2) AS NotaMax, ROUND(AVG(NotaMedia),2) AS NotaMedia 
FROM Asignatura, Matricula
WHERE Asignatura.idAsignatura = Matricula.idAsignatura
GROUP BY Nombre, Curso, Carácter
ORDER BY Curso ASC, NotaMedia DESC; 

# 2. Asignaturas con nota media inferior a 5
SELECT Curso, Nombre, ROUND(AVG(NotaMedia),2) AS NotaMedia
FROM Asignatura, Matricula
WHERE Asignatura.idAsignatura = Matricula.idAsignatura
GROUP BY Curso, Nombre
HAVING NotaMedia < 5.00
ORDER BY Curso ASC, nombre ASC;

# 3. Mostramos aquellos alumnos que tienen una media superior a 8.00, lo ordenamos por Nota Media de forma descendente
SELECT Concat(Nombre," ",Apellido1," ",Apellido2," ") AS Alumno, ROUND(AVG(NotaMedia),2) AS NotaMed
FROM Alumno INNER JOIN Matricula ON Alumno.idAlumno = Matricula.idAlumno
GROUP BY Alumno.idAlumno
HAVING NotaMed > 8.00
ORDER BY NotaMed DESC;

# 4. Obtenemos aquellas asignaturas que no tienen ningún alumno matriculado
SELECT Asignatura.Nombre, COUNT(Matricula.idAlumno) AS Alumnos
FROM Asignatura LEFT JOIN Matricula ON Asignatura.idAsignatura = Matricula.idAsignatura
GROUP BY Asignatura.Nombre
HAVING Alumnos = 0;

# 5. Obtenemos el número de Alumnos de 4 de la ESO que tienen que recuperar alguna asignatura y ordenamos el número de alumnos suspensos de forma descendiente
SELECT Nombre, COUNT(idAlumno) AS AlumnosSuspensos
FROM Asignatura INNER JOIN Matricula ON Asignatura.idAsignatura = Matricula.idAsignatura
WHERE NotaMedia < 5.00 AND CURSO = "4A" AND "4B" AND "4C"
GROUP BY Nombre
ORDER BY AlumnosSuspensos DESC;

# 6. En la anterior consulta fueron 10 alumnos los que suspendieron Matemáticas Académicas. Queremos saber que alumnos han sido y con que nota han suspendido la asignatura.
SELECT CONCAT (Alumno.Nombre," ",Apellido1," ",Apellido2," ") AS Alumno, Matricula.NotaMedia
FROM Alumno 
INNER JOIN Matricula ON Alumno.idAlumno = Matricula.idAlumno 
INNER JOIN Asignatura ON Asignatura.idAsignatura = Matricula.idAsignatura 
WHERE NotaMedia < 5.00 AND Asignatura.Nombre = "Matematicas Academicas"
ORDER BY NotaMedia DESC;

# 7. Queremos conocer cuales son los 10 profesores con mayor nota media en las asignaturas que imparten
SELECT Profesor.idProfesor, CONCAT(Profesor.Nombre," ",Apellido1," ",Apellido2," ") AS Profesor, ROUND(AVG(NotaMedia),2) AS NotaMedia
FROM Profesor 
LEFT JOIN Impartir ON Profesor.idProfesor = Impartir.idProfesor 
LEFT JOIN Asignatura ON Impartir.idAsignatura = Asignatura.idAsignatura
LEFT JOIN Matricula ON Asignatura.idAsignatura = Matricula.idAsignatura
GROUP BY Profesor.idProfesor
ORDER BY AVG(NotaMedia) DESC
LIMIT 10;

# 8. Queremos conocer cuales son los mejores alumnos de 3 de la ESO que han sacado un 10
SELECT Curso, Asignatura.Nombre, CONCAT(Alumno.Nombre," ",Apellido1," ",Apellido2," ") AS Alumno, NotaMedia
FROM Matricula 
INNER JOIN Alumno ON Alumno.idAlumno = Matricula.idAlumno
INNER JOIN Asignatura ON Asignatura.idAsignatura = Matricula.idAsignatura
WHERE NotaMedia = (SELECT MAX(NotaMedia) FROM Matricula) AND Curso = "3A" AND "3B" AND "4C"
ORDER BY Asignatura.Nombre ASC;




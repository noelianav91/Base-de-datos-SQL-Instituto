# Iniciamos creando la database que vamos a utilizar
CREATE DATABASE Instituto;

#Seleccionamos la database
USE Instituto;

# Creamos las tablas que vamos a necesitar
CREATE TABLE IF NOT EXISTS Profesor(
idProfesor VARCHAR(5) NOT NULL,
NIF VARCHAR(9) NOT NULL,
Nombre TEXT(50) NOT NULL,
Apellido1 TEXT(50) NOT NULL,
Apellido2 TEXT(50) NOT NULL,
Email VARCHAR(255) NOT NULL,
Dirección VARCHAR(100) NOT NULL,
CodigoPostal INT(5) NOT NULL,
Municipio TEXT(50) NOT NULL,
Provincia  TEXT(50) NOT NULL,
PRIMARY KEY(idProfesor)
);
CREATE TABLE IF NOT EXISTS Alumno(
idAlumno INT(5) NOT NULL,
NIF VARCHAR(9) NOT NULL,
Nombre TEXT(50) NOT NULL,
Apellido1 TEXT(50) NOT NULL,
Apellido2 TEXT(50) NOT NULL,
Direccion VARCHAR(100) NOT NULL,
CódigoPostal INT(5) NOT NULL,
Municipio TEXT(50) NOT NULL,
Provincia  TEXT(50) NOT NULL,
PRIMARY KEY(IdAlumno)
);
CREATE TABLE IF NOT EXISTS Curso(
idCurso	VARCHAR(5) NOT NULL,
Grado TEXT(30) NOT NULL,
Grupo VARCHAR(5) NOT NULL,
Nasignaturas INT(2) NOT NULL,
Tutor VARCHAR(5) NOT NULL,
PRIMARY KEY(idCurso),
FOREIGN KEY(Tutor) REFERENCES profesor(idProfesor)
);
CREATE TABLE IF NOT EXISTS Asignaturas(
idAsignatura VARCHAR(5) NOT NULL,
Curso INT(1) NOT NULL,
EtapaFormativa VARCHAR(15) NOT NULL,
Nombre TEXT(50) NOT NULL,
Carácter VARCHAR(15) NOT NULL,
Horas INT(5) NOT NULL,
Profesor VARCHAR(5) NOT NULL,
PRIMARY KEY(idAsignatura),
FOREIGN KEY(Profesor) REFERENCES Profesor(idProfesor)
);
CREATE TABLE IF NOT EXISTS Matricula(
idAlumno INT(5) NOT NULL,
idProfesor VARCHAR(5) NOT NULL,
PTrimestre REAL NOT NULL,
STrimestre REAL NOT NULL,
TTrimestre REAL NOT NULL,
NotaMedia REAL NOT NULL,
FOREIGN KEY(idAlumno) REFERENCES Alumno(idAlumno),
FOREIGN KEY(idProfesor) REFERENCES Profesor(idProfesor)
);
CREATE TABLE IF NOT EXISTS Impartir(
IdAsignatura VARCHAR(5),
IdProfesor VARCHAR(5),
FOREIGN KEY(idAsignatura) REFERENCES Asignaturas(idAsignatura),
FOREIGN KEY(idProfesor) REFERENCES Profesor(idProfesor)
);

# Añadimos los datos de cada tabla
SELECT @@GLOBAL.secure_file_priv;
#En primer lugar vamos hacer la carga de las tablas con mayor volumen a través de la siguiente sentencia donde establecemos
# donde establecemos ";" como separador de líneas, \n como salto de línea y ignoramos la primera fila puesto que ya tenemos creadas las tablas. 
LOAD DATA INFILE '/Users/noelia/Desktop/Base de datos Secundaria/Alumno.csv'
INTO TABLE Alumno 
FIELDS TERMINATED BY ';'
LINES terminated by '\n'
ignore 1 rows;

LOAD DATA INFILE '/Users/noelia/Desktop/Base de datos Secundaria/Matricula.csv'
INTO TABLE Alumno 
FIELDS TERMINATED BY ';'
LINES terminated by '\n'
ignore 1 rows;

SELECT * FROM MATRICULA;









# Iniciamos creando la database que vamos a utilizar
CREATE DATABASE Instituto;

#Seleccionamos la database
USE Instituto;

# Creamos las tablas que vamos a necesitar
CREATE TABLE IF NOT EXISTS Alumno(
idAlumno INT NOT NULL,
NIF VARCHAR(9) NOT NULL,
Nombre TEXT(50) NOT NULL,
Apellido1 TEXT(50) NOT NULL,
Apellido2 TEXT(50) NOT NULL,
PRIMARY KEY(idAlumno)
);

CREATE TABLE IF NOT EXISTS ContactoAlumno(
idAlumno INT NOT NULL, 
Dirección VARCHAR(100) NOT NULL,
CodigoPostal INT NOT NULL,
Municipio TEXT(50) NOT NULL,
Provincia  TEXT(50) NOT NULL,
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Profesor(
idProfesor VARCHAR(5) NOT NULL,
NIF VARCHAR(9) NOT NULL,
Nombre TEXT(50) NOT NULL,
Apellido1 TEXT(50) NOT NULL,
Apellido2 TEXT(50) NOT NULL,
Email VARCHAR(255) NOT NULL,
PRIMARY KEY(idProfesor)
);

CREATE TABLE IF NOT EXISTS ContactoProfesor(
idProfesor VARCHAR(5) NOT NULL,
Dirección VARCHAR(100) NOT NULL,
CodigoPostal INT NOT NULL,
Municipio TEXT(50) NOT NULL,
Provincia  TEXT(50) NOT NULL,
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Curso(
idCurso	VARCHAR(5) NOT NULL,
Grado TEXT(30) NOT NULL,
Nasignaturas INT NOT NULL,
Tutor VARCHAR(5) NOT NULL,
PRIMARY KEY(idCurso),
FOREIGN KEY(Tutor) REFERENCES Profesor(idProfesor)
);

CREATE TABLE IF NOT EXISTS Asignatura(
idAsignatura VARCHAR(5) NOT NULL,
Curso VARCHAR(5) NOT NULL,
EtapaFormativa VARCHAR(15) NOT NULL,
Nombre TEXT(50) NOT NULL,
Carácter VARCHAR(15) NOT NULL,
Horas INT(5) NOT NULL,
Profesor VARCHAR(5) NOT NULL,
PRIMARY KEY(idAsignatura)
);

CREATE TABLE IF NOT EXISTS Matricula(
idAlumno INT NOT NULL,
idAsignatura VARCHAR(5) NOT NULL,
PTrimestre FLOAT NOT NULL,
STrimestre FLOAT NOT NULL,
TTrimestre FLOAT NOT NULL,
NotaMedia FLOAT NOT NULL,
FOREIGN KEY(idAlumno) REFERENCES Alumno(idAlumno),
FOREIGN KEY(idAsignatura) REFERENCES Asignatura(idAsignatura),
CHECK (NotaMedia > 0)
);

CREATE TABLE IF NOT EXISTS Impartir(
IdProfesor VARCHAR(5) NOT NULL, 
IdAsignatura VARCHAR(5) NOT NULL,
FOREIGN KEY(idProfesor) REFERENCES Profesor(idProfesor),
FOREIGN KEY(idAsignatura) REFERENCES Asignatura(idAsignatura)
);

# Añadimos los datos de cada tabla 
# Solicitamos donde vamos alojar los archivos que queremos importar
SELECT @@GLOBAL.secure_file_priv;

#En primer lugar vamos hacer la carga de las tablas con mayor volumen a través de la siguiente sentencia donde establecemos
# donde establecemos ";" como separador de líneas, \n como salto de línea y ignoramos la primera fila puesto que ya tenemos creadas las tablas. 
LOAD DATA INFILE '/Base de datos Secundaria/Alumno.csv'
INTO TABLE Alumno 
FIELDS TERMINATED BY ';'
LINES terminated by '\n'
ignore 1 rows;


LOAD DATA INFILE '/Base de datos Secundaria/Contacto Alumnos.csv'
INTO TABLE ContactoAlumno
FIELDS TERMINATED BY ';'
LINES terminated by '\n'
ignore 1 rows;

# Cargamos manualmente los datos de profesor 
INSERT INTO Profesor VALUES("HCM","74662617V","Hilda","Cordero","Melendes","hcm@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("TMS","92879969N","Tania","Morales","Sainz","tms@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("EDS","89824464B","Ester","Duran","Sarmiento","eds@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("VCT","98245487K","Veronica","Castillo","Toxqui","vct@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("PLH","76901432N","Paulina","Lopez","Herdez","plh@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("ATT","14545281N","Adela","Tepale","Tecojote","att@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("CTS","74258664J","Carmen","Tepox","Sanchez","cts@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("EGM","82588943Z","Erica","Gonzales","Martinez","egm@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("GVR","97691458Q","Guadalupe","Vazquez","Romano","gvr@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("ALR","34011691G","Amanda","López","Romero","alr@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("PGR","88462406J","Pedro","Galvez","Ruiz","pgr@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("ASD","02299894D","Antonio","Sabalete","Duque","asd@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("FGM","26066827F","Fernando","Gutierrez","Moya","fgm@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("LSR","81636420J","Lola","Saperas","Ruiz","lsr@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("FAD","20579353B","Francisco","Aguayo","Ducros","fad@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("LLP","22895232C","Lourdes","Lara","Perez","llp@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("ATC","77236372A","Alberto","Toledano","Castro","atc@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("HJB","80562782S","Humberto","Janeiro","Blanco","hjb@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("MSA","62124435D","Marta","Sanchez","Armenteros","msa@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("CPR","86902780V","Carmen","Pulido","Reca","cpr@iesvirgendelacabeza.com");
INSERT INTO Profesor VALUES("JMA","84621893V","Juan Andrés","Muguruza","Alcaraz","jma@iesvirgendelacabeza.com");

LOAD DATA INFILE '/Base de datos Secundaria/Contacto Profesores.csv'
INTO TABLE ContactoProfesor
FIELDS TERMINATED BY ';'
LINES terminated by '\n'
ignore 1 rows;

# Carga con insercción manual de los datos de curso 
INSERT INTO Curso VALUES("1A","ESO","12","HCM");
INSERT INTO Curso VALUES("1B","ESO","12","TMS");
INSERT INTO Curso VALUES("1C","ESO","12","EDS");
INSERT INTO Curso VALUES("2A","ESO","13","VCT");
INSERT INTO Curso VALUES("2B","ESO","13","PLH");
INSERT INTO Curso VALUES("2C","ESO","13","ATT");
INSERT INTO Curso VALUES("3A","ESO","13","CTS");
INSERT INTO Curso VALUES("3B","ESO","13","EGM");
INSERT INTO Curso VALUES("3C","ESO","13","GVR");
INSERT INTO Curso VALUES("4A","ESO","17","ALR");
INSERT INTO Curso VALUES("4B","ESO","17","PGR");
INSERT INTO Curso VALUES("4C","ESO","17","ASD");

LOAD DATA INFILE '/Base de datos Secundaria/Asignatura.csv'
INTO TABLE Asignatura
FIELDS TERMINATED BY ';'
LINES terminated by '\n'
ignore 1 rows;

LOAD DATA INFILE '/Base de datos Secundaria/Matricula.csv'
INTO TABLE Matricula
FIELDS TERMINATED BY ';'
LINES terminated by '\n'
ignore 1 rows;

#Cargamos manualmente los datos de Impartir.
INSERT INTO Impartir VALUES("HCM", "BG001");
INSERT INTO Impartir VALUES("TMS", "GH001");
INSERT INTO Impartir VALUES("PLH", "EF001");
INSERT INTO Impartir VALUES("ATT", "LL001");
INSERT INTO Impartir VALUES("CTS", "MA001");
INSERT INTO Impartir VALUES("EGM", "MU001");
INSERT INTO Impartir VALUES("GVR", "IN001");
INSERT INTO Impartir VALUES("ALR","FR001");
INSERT INTO Impartir VALUES("PGR","OD001");
INSERT INTO Impartir VALUES("TMS","CC001");
INSERT INTO Impartir VALUES("ASD","CR001");
INSERT INTO Impartir VALUES("PGR","TT001");
INSERT INTO Impartir VALUES("FGM","FQ002");
INSERT INTO Impartir VALUES("TMS","GH002");
INSERT INTO Impartir VALUES("PLH","EF002");
INSERT INTO Impartir VALUES("LSR","EP002");
INSERT INTO Impartir VALUES("ATT","LL002");
INSERT INTO Impartir VALUES("CTS","MA002");
INSERT INTO Impartir VALUES("EGM","MU002");
INSERT INTO Impartir VALUES("ASD","TE002");
INSERT INTO Impartir VALUES("GVR","IN002");
INSERT INTO Impartir VALUES("ALR","FR002");
INSERT INTO Impartir VALUES("FAD", "CS002");
INSERT INTO Impartir VALUES("TMS", "CC002");
INSERT INTO Impartir VALUES("FAD","CV002");
INSERT INTO Impartir VALUES("HCM","BG003");
INSERT INTO Impartir VALUES("FGM","FQ003");
INSERT INTO Impartir VALUES("LLP","GH003");
INSERT INTO Impartir VALUES("PLH","EF003");
INSERT INTO Impartir VALUES("ATT","LL003");
INSERT INTO Impartir VALUES("GVR","IN003");
INSERT INTO Impartir VALUES("LSR","EC003");
INSERT INTO Impartir VALUES("ASD","TE003");
INSERT INTO Impartir VALUES("ALR","FR003");
INSERT INTO Impartir VALUES("PGR","OD003");
INSERT INTO Impartir VALUES("EGM","MU003");
INSERT INTO Impartir VALUES("FAD","CC003");
INSERT INTO Impartir VALUES("PGR","PI003");
INSERT INTO Impartir VALUES("ATT","LL004");
INSERT INTO Impartir VALUES("GVR","IN004");
INSERT INTO Impartir VALUES("EDS","GH004");
INSERT INTO Impartir VALUES("PLH","EF004");
INSERT INTO Impartir VALUES("HCM","BG004");
INSERT INTO Impartir VALUES("FGM","FQ004");
INSERT INTO Impartir VALUES("ATC","MA004");
INSERT INTO Impartir VALUES("HJB","LA004");
INSERT INTO Impartir VALUES("MSA","EM004");
INSERT INTO Impartir VALUES("LSR","EP004");
INSERT INTO Impartir VALUES("VCT","CC004");
INSERT INTO Impartir VALUES("JMA","IF004");
INSERT INTO Impartir VALUES("ATC","CI004");
INSERT INTO Impartir VALUES("ALR","FR004");
INSERT INTO Impartir VALUES("CPR","FI004");
INSERT INTO Impartir VALUES("ASD","TE004");
INSERT INTO Impartir VALUES("EGM","MU004");
INSERT INTO Impartir VALUES("ATC","MP004");
INSERT INTO Impartir VALUES("ASD","TA004");
INSERT INTO Impartir VALUES("MSA","IA004");
INSERT INTO Impartir VALUES("ATC","LM004");


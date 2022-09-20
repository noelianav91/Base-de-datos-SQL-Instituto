# Base de datos SQL Instituto

## Introducción 

Diseño y creación de una base de datos para almacenar información referente a los alumnos, profesores, asignaturas y cursos del IES Virgen de la Cabeza,

Cada **curso** está formado a su vez por 3 clases de 29 alumnos cada una, por lo tanto cada curso se identifica de la siguiente forma 1A, 1B, 1C, 2A, 2B, 2C, 3A, 3B, 3C, 4A, 4B, 4C. Cada curso está formado por 3 trimestres donde se imparten las mismas asignatuas en cada uno de ellos, es decir, los alumnos tienen que tener una nota media global de los tres trimestres de un 5. Así mismo también nos interesa saber cuantas asignaturas en total tiene cada curso. 

Cada curso está formado por varias **asignaturas** con un código en formato texto con las iniciales de dicha asignatura y un código númerico que nos indica el curso en el que se imparte, ya que diferentes asignaturas podemos tenerlas en diferentes cursos. A su vez cada asignatura tiene su nombre correspondiente y el carácter en el que se imparte (obligatoria u optativa).

Un **profesor** puede impartir varias asignaturas, como mínimo tendrá una obligatoriamente. Y una asignatura puede ser impartida por diferentes profesiores. Todos los cursos a su vez tienen un tutor pero no todos los profesores son tutores. Todos los profesores están identificados por un código que es asignado por el instituto. También la información que se tiene en la base de datos de cada profesor es nombre, apellidos, email y dirección postal. 

Los **alumnos** pueden estar matriculados en varias asignaturas siempre que sean del curso que están impartiendo en ese momento. Dentro de la categoría de las asignaturas optativas podría ocurrir que ningún alumno estuviese matriculado en alguna de ellas. Cada uno de los alumnos se encuentran identificados por un código que le asigna el instituto. Además la información que tenemos guardada en las bases de datos de cada alumno es su nombre, apellidos, email y dirección postal. De cada alumno también guardamos la nota de cada uno de los trimestres y la media de los 3 trimestres cursados. 

# Pasos a seguir para realizar el diseño de la base de datos

## 1. Diseño conceptual (BBDD Diseño conceptual.pdf)

En primer lugar para saber como vamos a estructurar la base de datos y las tablas que vamos a necesitar haremos un diagrama con las entidades, sus atributos y las relaciones de cada una de ellas. 

## 2. Diagrama de tablas (BBDDDiagrama.png)

En segundo lugar definimos la estructura de las tablas en un modelo relacional.

## 3. Creación de la base de datos, las tablas y la carga de datos. (BBDDInstituto.sql)

Mediante código SQL crearemos toda la estructura que hemos diseñado en los anteriores puntos. La carga de los datos la haremos de forma manual con las tablas de Profesor, Curso e Impartir y mediante la carga de ficheros cargaremos las tablas Alumnos, Contacto Alumnos, Contacto Profesores, Matricula y Asignatura.

## 4. Consultas (BBDDConsultas.sql)

Las consultas que vamos a realizar serán:

✅ Número de alumnos, carácter de las asignaturas y nota media, mínima y máxima de la nota media de los tres trimestres ordenados en primer lugar por Curso de forma ascendente y después por Nota Media de forma descendente.

✅ Asignaturas con nota media inferior a 5.

✅ Mostramos aquellos alumnos que tienen una media superior a 8, y lo ordenamos por nota media de forma descendente.

✅ Obtenemos aquellas asignaturas que no tienen ningún alumno matriculado.

✅ Obtenemos el número de Alumnos de 4 de la ESO que tienen que recuperar alguna asignatura y ordenamos el número de alumnos suspensos de forma descendente.

✅ En la anterior consulta fueron 10 alumnos los que suspendieron Matemáticas Académicas. Queremos saber que alumnos han sido y con qué nota han suspendido la asignatura.

✅ Queremos conocer cuáles son los 10 profesores con mayor nota media en las asignaturas que imparten.

✅ Queremos conocer cuáles son los mejores alumnos de 3 de la ESO que han sacado un 10.



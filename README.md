# Base de datos SQL Instituto

# Introducción 

Diseño y creación de una base de datos para almacenar información referente a los alumnos, profesores, asignaturas y cursos del IES Virgen de la Cabeza,

Cada 𝐜𝐮𝐫𝐬𝐨 está formado a su vez por 3 clases de 29 alumnos cada una, por lo tanto cada curso se identifica de la siguiente forma 1A, 1B, 1C, 2A, 2B, 2C, 3A, 3B, 3C, 4A, 4B, 4C. Cada curso está formado por 3 trimestres donde se imparten las mismas asignatuas en cada uno de ellos, es decir los alumnos tienen que tener una nota media global de los tres trimestres de un 5. Así mismo también nos interesa saber cuantas asignaturas en total tiene cada curso. 

Cada curso está formado por varias 𝐚𝐬𝐢𝐠𝐧𝐚𝐭𝐮𝐫𝐚𝐬 que son identificadas con un código en formato texto con las iniciales de dicha asignatura y un código númerico que nos indica el curso en el que se imparte. Ya que diferentes asignaturas podemos tenerlas en diferentes cursos. A su vez cada asignatura tiene su nombre correspondiente y el carácter en el que se imparte (obligatoria u optativa).

Un 𝐩𝐫𝐨𝐟𝐞𝐬𝐨𝐫 puede impartir varias asignaturas, como mínimo tendrá una obligatoriamente. Y una asignatura puede ser impartida por diferentes profesiores. Todos los cursos a su vez tienen un tutor pero no todos los profesores son tutores. Todos los profesores están identificados por un código que es asignado por el instituto. También la información que se tiene en la base de datos de cada profesor es nombre, apellidos, email y dirección postal. 

Los 𝐚𝐥𝐮𝐦𝐧𝐨𝐬 pueden estar matriculados en varias asignaturas siempre que sean del curso que están impartiendo en ese momento. Dentro de la categoría de las asignaturas optativas podría ocurrir que ningún alumno estuviese matriculado en alguna de ellas. Cada uno de los alumnos se encuentran identificados por un código que le asigna el instituto. Además la información que tenemos guardada en las bases de datos de cada alumno es su nombre, apellidos, email y dirección postal. De cada alumno también guardamos la nota de cada uno de los trimestres y la media de los 3 trimestres cursados. 

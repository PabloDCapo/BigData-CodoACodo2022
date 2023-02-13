USE db_escuela22609;
# SHOW TABLES from db_escuela22609;
# DESCRIBE alumnos;
# DESCRIBE escuelas;

# Ejercicios para Consultas en SQL 
# SINTAXIS BÁSICA: SELECT…FROM + USO DE WHERE, AND, OR, BETWEEN
# Base de datos: escuela
# 1) Seleccionar todos los datos de la tabla alumnos:
# SELECT * from alumnos;

# 2) Seleccionar solamente el legajo y el nombre de los alumnos:
# SELECT legajo, nombre from alumnos;

# 3) Mostrar todos los datos de aquellos alumnos aprobados (con notas mayores o iguales a 7)
# SELECT * from alumnos WHERE NOTA >=7;

# 4) Mostrar el id y el nombre de aquellas escuelas cuya capacidad sea inferior a 200 (no mostrar la columna capacidad).
# SELECT id, nombre from escuelas WHERE capacidad < 200;
# 5) Mostrar el nombre y la nota de aquellos alumnos cuya nota se encuentre entre 8 y 10
# SELECT nombre, nota from alumnos WHERE nota >= 8 and nota<=10;
# 6) Repetir el ejercicio anterior, utilizando BETWEEN
# SELECT nombre, nota from alumnos WHERE nota BETWEEN 8 and 10;
# 7) Mostrar el nombre, la localidad y la provincia de aquellas escuelas situadas en Buenos Aires o Jujuy
# SELECT nombre, localidad, provincia from escuelas WHERE provincia = 'Buenos Aires' OR provincia = 'Jujuy';

# SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y %
# 8) Mostrar todos los datos de los alumnos llamados Paula Remmi
# SELECT * from alumnos WHERE nombre LIKE 'Paula Remmi';

# 9) Repetir el ejercicio anterior, pero con aquellos que no se llamen Paula Remmi
# SELECT * from alumnos WHERE nombre not LIKE 'Paula Remmi';

# 10) Mostrar todos los datos de los alumnos cuyo nombre comience con R
#SELECT * from alumnos WHERE nombre LIKE 'R%';

# 11) Mostrar todos los datos de los alumnos cuyo nombre termine con Z
# SELECT * from alumnos WHERE nombre LIKE '%z';

# 12) Mostrar todos los datos de los alumnos cuyo nombre contenga una M
# SELECT * from alumnos WHERE nombre LIKE '%m%';

/*SELECT alumnos.legajo, alumnos.nombre, escuelas.nombre
from alumnos INNER JOIN escuelas
ON alumnos.id_escuela = escuelas.id;*/

# USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS
# 13) Mostrar el legajo, el nombre del alumno y el nombre de la escuela de todos los alumnos
# ALIAS DE TABLAS
# ALIAS DE COLUMNAS
/*SELECT a.legajo, a.nombre, e.nombre
from alumnos a INNER JOIN escuelas e
ON a.id_escuela = e.id;*/
/*SELECT a.legajo, a.nombre as 'Nombre completo del alumno', e.nombre as 'Nombre del establecimiento'
from alumnos a INNER JOIN escuelas e
ON a.id_escuela = e.id;*/
# 15) Mostrar todos los alumnos, tengan o no escuela asignada.
# UPDATE alumnos SET id_escuela =NULL
# WHERE legajo=106;
# SELECT * FROM alumnos;
# 16) Mostrar todas las escuelas con el nombre de cada alumno (aunque no tengan escuela asignada).

# USO DE IS NULL / IS NOT NULL
# 17) Mostrar todos los datos de los alumnos que tengan notas.
# SELECT * FROM alumnos WHERE nota IS NOT NULL;

# 18) Mostrar todos los datos de los alumnos que no tengan notas.
# SELECT * FROM alumnos WHERE nota IS NULL;

# ALTER TABLE
# 19) Realizar lo siguiente:
#  a) Agregar a través de Alter Table una en la tabla escuelas columna llamada “Partido”, a la derecha de Localidad con una cadena vacía como valor por defecto (armar la sentencia a través de Alter Table).
# ALTER TABLE escuelas ADD COLUMN partido VARCHAR(30) NULL DEFAULT '' AFTER localidad;

#  b) Ejecutar una consulta donde se vean todos los campos para confirmar que se ha agregado el campo “partido”.
# SELECT * FROM escuelas;

#  c) Eliminar esa columna utilizando Alter Table.
# ALTER TABLE escuelas DROP COLUMN partido;
# SELECT * FROM escuelas;

# LIMIT Y ORDER BY
# 22) Obtener un ranking de las primeras 3 escuelas de mayor capacidad. */
/* SELECT nombre, capacidad FROM escuelas 
ORDER BY capacidad DESC
LIMIT 3;*/

# FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN
# 23) Contar la cantidad de alumnos de la tabla homónima. Llamar a la columna “Cantidad de alumnos”.*/
/* SELECT COUNT(*) AS 'cantidad de alumnos'
FROM alumnos;*/

# 24) Repetir la consulta anterior contando solamente los alumnos cuya nota sea menor a 7.*/
/* SELECT COUNT(*) AS 'cantidad de alumnos'
FROM alumnos WHERE nota >7;*/

# 25) Obtener la capacidad total de las escuelas de la provincia de Buenos Aires*/
/*SELECT SUM(capacidad) AS'Capacidad total'
FROM escuelas WHERE provincia LIKE 'Buenos Aires';*/

# 26) Repetir el ejercicio anterior pero solamente con las escuelas de Córdoba y Jujuy*/
/*SELECT SUM(capacidad) AS'Capacidad total'
FROM escuelas WHERE provincia IN ('Córdoba','Jujuy');*/

# 27) Obtener el promedio de notas de los alumnos aprobados con más de 7 */
# SELECT AVG(nota) AS 'Promedio' FROM alumnos WHERE nota >7;

# 28) Obtener la capacidad máxima y la capacidad mínima de alumnos*/
/* SELECT MAX(Capacidad) AS 'Capacidad máxima', MIN(Capacidad) AS 'Capacidad mínima'
FROM escuelas;+/

# 29) Obtener el total de capacidad de las escuelas por provincia */
/*SELECT Provincia AS 'Provincia', SUM(capacidad) AS 'Vacantes' FROM escuelas
GROUP BY Provincia;*/

# 30) Obtener la cantidad de alumnos por grado */
# SELECT grado AS 'Grado', COUNT(grado) 'Cantidad de alumnos' FROM alumnos GROUP BY grado;


# DIFERENCIAS ENTRE HAVING Y WHERE
# 31) Mostrar las escuelas y la nota máxima para cada una siempre y cuando sean mayores o iguales a 7.*/
SELECT e.nombre AS 'Escuela', MAX(a.Nota) AS 'Mejor nota'
/*FROM escuelas e INNER JOIN alumnos a
ON e.id = a.id_escuela
WHERE nota >=7
GROUP BY e.nombre;*/

/*FROM escuelas e INNER JOIN alumnos a
ON e.id = a.id_escuela
GROUP BY e.nombre HAVING MAX(a.nota)>=7;*/

# SUBCONSULTAS
# 32) Mostrar la información de las escuelas cuyos alumnos tengan una nota igual a 10, utilizando una subconsulta.
SELECT * FROM escuelas
WHERE id IN
(SELECT id_escuela FROM alumnos WHERE nota=10);
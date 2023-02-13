# SQL DDL - DATA DEFINITION LANGUAGE
# CREAR UNA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS audioteca22609;


# USAR UNA BD DETERMINADA
USE audioteca22609;

# CREAR TABLA artistas
CREATE TABLE IF NOT EXISTS artistas(
    id_artista INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

# CREAR TABLA temas
CREATE TABLE IF NOT EXISTS temas(
    id_tema INTEGER PRIMARY KEY,
    nombre_tema VARCHAR(50) NOT NULL,
    id_artista INTEGER,
    FOREIGN KEY(id_artista) REFERENCES
    artistas(id_artista)
);

# MOSTRAR LAS TABLAS LA BD
# SHOW TABLES FROM audioteca22609;

# MOSTRAR LA ESTRUCTURA DE LAS TABLAS
# DESCRIBE artistas;
# DESCRIBE temas;

# CREATE TABLE IF NOT EXISTS random (columna1 INTEGER);

# AGREGAR COLUMNAS
# ALTER TABLE random ADD columna2 VARCHAR(30);
# ALTER TABLE random ADD columna3 VARCHAR(150);

# ELIMINAR COLUMNAS
# ALTER TABLE random DROP COLUMN columna2;

# BORRAR TABLA
# DROP TABLE random;
# NO podemos borrar una tabla que está relacionada con otra por Foreign Key con otra tabla. Primero debo eliminar la relación o la otra tabla

ALTER TABLE temas ADD genero VARCHAR(25);
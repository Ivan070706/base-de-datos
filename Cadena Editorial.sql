-- Borra la base de datos instituto si existe
DROP DATABASE IF EXISTS Cadena_editorial;
-- Crea la base de datos instituto
CREATE DATABASE Cadena_editorial;
-- Selecciono la base de datos instituto
USE Cadena_editorial;

CREATE TABLE Sucursales(
Código VARCHAR(30) PRIMARY KEY,
Domicilio VARCHAR(50),
Teléfono CHAR(9)
);

CREATE TABLE Empleados(
Nif VARCHAR(20) PRIMARY KEY,
Nombre VARCHAR(15),
Apellidos VARCHAR(40),
Teléfono CHAR(9),
FOREIGN KEY (Código_sucursal) REFERENCES sucursales(Código)
);

CREATE TABLE Publican(
PRIMARY KEY (Código_sucursal, Nº_registro),
FOREIGN KEY (Código_sucursal) REFERENCES Empleados(Código_sucursal),
FOREIGN KEY (Nº_registro) REFERENCES Revistas(Nº_registro)
);

CREATE TABLE Revistas(
Nº_registro VARCHAR(50)PRIMARY KEY,
Titulo VARCHAR(30),
Periodicidad VARCHAR(20),
Tipo VARCHAR(20)
);

CREATE TABLE Ejemplares(
Nº_registro VARCHAR(50)PRIMARY KEY,
Fecha DATE PRIMARY KEY,
Nº_paginas VARCHAR(100),
Nº_ejemplares VARCHAR(50),
FOREIGN KEY (Nº_registro) REFERENCES Revistas (Nº_registro)
);

CREATE TABLE Secciones(
Titulo VARCHAR(30) PRIMARY KEY,
Nº_registro VARCHAR(50)PRIMARY KEY,
Extensión VARCHAR(25),
FOREIGN KEY (Nº_registro) REFERENCES Revistas (Nº_registro)
);

CREATE TABLE Periodistas(
Nif VARCHAR(25) PRIMARY KEY,
Nombre VARCHAR(15),
Apellidos VARCHAR(40),
Teléfono CHAR(9),
Especialidad VARCHAR(20)
);

CREATE TABLE Escriben(
Nº_registro VARCHAR(50)PRIMARY KEY,
Nif_periodista VARCHAR(20)PRIMARY KEY,
FOREIGN KEY (Nº_registro) REFERENCES Revistas (Nº_registro),
FOREIGN KEY (Nif_periodista) REFERENCES  Periodistas(Nif)
);



 

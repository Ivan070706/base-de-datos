-- Borra la base de datos instituto si existe
DROP DATABASE IF EXISTS instituto;
-- Crea la base de datos instituto
CREATE DATABASE instituto;
-- Selecciono la base de datos instituto
USE instituto;
-- Crea la tabla profesores
CREATE TABLE profesores (
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Telefono VARCHAR(15) NOT NULL
);

-- Crea la tabla módulos
CREATE TABLE modulos (
Codigo VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
Curso VARCHAR(10) NOT NULL,
DNI_profesor CHAR(9),
-- FOREIGN KEY (DNI_profesor) REFERENCES profesores(DNI),
-- otra manera de hacer clave foranea
CONSTRAINT dni_profesor_fk FOREIGN KEY (DNI_profesor) REFERENCES profesores(DNI)
);

-- Crea la tabla alumnos
CREATE TABLE alumnos (
numExpediente VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellidos VARCHAR(50) NOT NULL,
Fecha_Nac DATE NOT NULL,
numExpediente_delegado VARCHAR(10),
Grupo VARCHAR(10) NOT NULL,
FOREIGN KEY (numExpediente_delegado) REFERENCES alumnos(numExpediente)
ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crea la tabla matriculaciones
CREATE TABLE matriculaciones (
numExpedienteAlumno VARCHAR(10),
Codigo_modulo VARCHAR(10),
PRIMARY KEY (numExpedienteAlumno, Codigo_modulo),
FOREIGN KEY (numExpedienteAlumno) REFERENCES alumnos(numExpediente)
-- CONSTRAINT Codigo_modulo_fk FOREIGN KEY (CodigoModulo) REFERENCES modulos(Codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

-- Eliminar clave foranea dni_profesor de la tabla modulos
ALTER TABLE modulos DROP FOREIGN KEY dni_profesor_fk;

-- Eliminar la clave primaria de la tabla módulos
ALTER TABLE modulos DROP PRIMARY KEY;

-- Modificar el tipo de dato de la columna codigo de la tabla modulos
ALTER TABLE modulos MODIFY Codigo INT(4) ZEROFILL;

-- Vuelve a crear la PRIMARY KEY en la tabla modulos
ALTER TABLE modulos ADD PRIMARY KEY (Codigo);

-- Añadir clave foranea dni_profesor a la tabla modulos
ALTER TABLE modulos ADD CONSTRAINT dni_profesor_fk FOREIGN KEY (DNI_profesor) REFERENCES profesores(DNI);

-- Modificamos la columna Codigo_modulo (FK) a INT(4) ZEROFILL para que coincida el tipo de datos
ALTER TABLE matriculaciones MODIFY Codigo_modulo INT(4) ZEROFILL;

-- Crea la FOREIGN KEY Codigo_modulo en la tabla matriculaciones
ALTER TABLE matriculaciones ADD CONSTRAINT Codigo_modulo_fk FOREIGN KEY (Codigo_modulo) REFERENCES modulos(Codigo);

-- Insertar filas en la tabla profesores
INSERT INTO profesores (DNI, Nombre, Direccion, Telefono) VALUES ('37168921Q','Antonio Gomez', 'Av. Haya', '678953322');
INSERT INTO profesores (DNI, Nombre, Direccion, Telefono) VALUES ('21784543C','Juan Manuel Moreno', 'Av. Playamar', '634547789');

-- Muestro las filas de la tabla profesores
SELECT * FROM profesores;

-- Insertar filas en la tabla modulos
INSERT INTO modulos (Codigo, Nombre, Curso, DNI_profesor) VALUES ('484', 'Bases de datos','1ºDAW', '37168921Q');
INSERT INTO modulos (Codigo, Nombre, Curso, DNI_profesor) VALUES ('485', 'Programacion','1ºDAW', '21784543C');

-- Muestro las filas de la tabla modulos
SELECT * FROM modulos;

-- Insertar filas en la tabla alumnos
INSERT INTO alumnos (numExpediente, Nombre, Apellidos, Fecha_Nac, numExpediente_delegado, Grupo) VALUES ('A123','Mario', 'Martin Ortega', '2002-10-19', 'A123', '1ºDAW A');
INSERT INTO alumnos (numExpediente, Nombre, Apellidos, Fecha_Nac, numExpediente_delegado, Grupo) VALUES ('A798','Jaime', 'Lopez Puente', '2002-11-22', 'A123', '1ºDAW A');

-- Muestro las filas de la tabla alumnos
SELECT * FROM alumnos;

-- Inserta dos filas en la tabla de matriculación 
INSERT INTO matriculaciones (numExpedienteAlumno, Codigo_modulo)
VALUES
('A123',485),
('A798',485);

-- Muestra las filas de la tabla matriculaciones
SELECT*FROM matriculaciones;

-- Elimina una fila de la tabla alumnos
DELETE FROM alumnos WHERE numExpediente = 'A798';
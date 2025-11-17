-- Borra la base de datos instituto si existe
DROP DATABASE IF EXISTS Trabajo;
-- Crea la base de datos instituto
CREATE DATABASE Trabajo;
-- Selecciono la base de datos instituto
USE Trabajo;

create table Empleados(
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
Apellidos VARCHAR(25) NOT NULL,
Fecha_alta date NOT NULL,
Cuenta_ban VARCHAR(40)
);

create table Clientes(
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
Apellidos VARCHAR(25) NOT NULL,
Tarjeta_cred VARCHAR(30)
);

create table Ventas(
Cod_venta CHAR(9) PRIMARY KEY,
Fecha DATE NOT NULL,
DNI_emp CHAR(9) NOT NULL,
DNI_cliente CHAR(9) NOT NULL
);

create table Moviles(
Cod_movil CHAR(9) PRIMARY KEY,
Fabricante VARCHAR(25) NOT NULL,
Marca VARCHAR(20) NOT NULL,
Modelo VARCHAR(20) NOT NULL,
Precio_coste DECIMAL NOT NULL,
Precio_venta DECIMAL NOT NULL
);


create table Moviles_Ventas(
Cod_venta CHAR(9), 
Cod_movil CHAR(9),
Color  CHAR(9) NOT NULL,
PRIMARY KEY (Cod_venta, Cod_movil),
CONSTRAINT Cod_movil_fk FOREIGN KEY (Cod_movil) REFERENCES Moviles(Cod_movil),
CONSTRAINT Cod_venta_fk FOREIGN KEY (Cod_venta) REFERENCES Ventas(Cod_venta)
);



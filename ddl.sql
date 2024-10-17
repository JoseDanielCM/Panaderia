DROP DATABASE IF EXISTS panaderia;

CREATE DATABASE panaderia;
use panaderia;
CREATE TABLE cliente (
    id int primary key AUTO_INCREMENT,
    nombre varchar(100),
    telefono char(10),
    fecha_nacimiento date    
); -- 

CREATE TABLE empleado (
    id int primary key AUTO_INCREMENT,
    nombre varchar(100),
    salario int
); -- 

CREATE TABLE venta (
    id int primary key AUTO_INCREMENT,
    fecha date,
    total float,
    estado enum("pendiente","completada"),	
    id_cliente int,
    id_empleado int,
    foreign key (id_cliente) references cliente(id),
    foreign key (id_empleado) references empleado(id)
); -- 

CREATE TABLE categoria (
    id int primary key AUTO_INCREMENT,
    nombre varchar(100)
); -- 

CREATE TABLE producto (
    id int primary key AUTO_INCREMENT,
    id_categoria int,
    nombre varchar(100),
    precio float,
    stock int,
    id_ingrediente_principal int,
    foreign key (id_categoria) references categoria(id)
); -- 

CREATE TABLE productosVenta (
    id int primary key AUTO_INCREMENT,
    id_venta int,
    id_producto int,
    cantidad int,
    subtotal float,
    foreign key (id_venta) references venta(id),
    foreign key (id_producto) references producto(id)
); --

CREATE TABLE proveedor(
    id int primary key AUTO_INCREMENT,
    nombre varchar(100)
); --

CREATE TABLE ordenesCompra (
    id int primary key AUTO_INCREMENT,
    id_proveedor int,
    total float,
    fecha datetime,
    foreign key (id_proveedor) references proveedor(id)
); --

CREATE TABLE ordenProducto (
    id int primary key AUTO_INCREMENT,
    id_orden int,
    id_producto int,
    cantidad int,
    subtotal float,
    foreign key (id_orden) references ordenesCompra(id),
    foreign key (id_producto) references producto(id)

);

CREATE TABLE ingrediente (
    id int primary key AUTO_INCREMENT,
    nombre varchar(100),
    cantidad int
); -- 

CREATE TABLE ordenIngrediente (
    id int primary key AUTO_INCREMENT,
    id_orden int,
    id_ingrediente int,
    cantidad int,
    subtotal float,
    foreign key (id_orden) references ordenesCompra(id),
    foreign key (id_ingrediente) references ingrediente(id)
);

CREATE TABLE productoIngrediente     (
    id int primary key AUTO_INCREMENT,
    id_producto int,
    id_ingrediente int,
    porcentaje int,
    foreign key (id_producto) references producto(id),
    foreign key (id_ingrediente) references ingrediente(id)
); --

CREATE TABLE log (
    id int primary key AUTO_INCREMENT,
    accion varchar(200),
    fecha datetime
);

CREATE TABLE historico (
    id int primary key AUTO_INCREMENT,
    accion varchar(200),
    mes datetime
);
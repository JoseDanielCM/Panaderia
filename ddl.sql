CREATE TABLE cliente (
    id int primary key AUTO_INCREMENT,
    nombre varchar(100),
    telefono char(10)
    fecha_nacimiento date    
);

CREATE TABLE empleado (
    id int primary key AUTO_INCREMENT,
    nombre varchar(100),
    salario int
);

CREATE TABLE venta (
    id int primary key AUTO_INCREMENT,
    fecha date,
    id_cliente int,
    id_empleado int,
    foreign key (id_cliente) references cliente(id),
    foreign key (id_empleado) references empleado(id)
);

CREATE TABLE categoria (
    id int primary key AUTO_INCREMENT,
    nombre varchar(100)
);

CREATE TABLE producto (
    id int primary key AUTO_INCREMENT,
    id_categoria int,
    nombre varchar(100),
    id_ingrediente_principal int
    foreign key (id_categoria) references categoria(id)
);

CREATE TABLE productosVenta (
    id int primary key AUTO_INCREMENT,
    id_venta int,
    id_producto int,
    cantidad int,
    subtotal float,
    foreign key (id_venta) references venta(id),
    foreign key (id_producto) references producto(id)
);

CREATE TABLE proveedor(
    id int primary key AUTO_INCREMENT,
    nombre varchar(100)
);

CREATE TABLE ordenesCompra (
    id int primary key AUTO_INCREMENT,
    id_proveedor int,
    total float,
    fecha datetime,
    foreign key (id_proveedor) references proveedor(id)
);
INSERT INTO cliente (nombre, telefono, fecha_nacimiento) 
VALUES 
('Juan Pérez', '3123456789', '1990-05-15'),
('María González', '3145678901', '1985-08-21'),
('Pedro Rojas', '3112345678', '1992-11-05'),
('Lucía Martínez', '3156789012', '1987-03-12'),
('Sofía Fernández', '3198765432', '1995-07-30'),
('Carlos Suárez', '3120987654', '1980-04-25'),
('Laura Torres', '3109876543', '1993-12-18'),
('Ana Herrera', '3134567890', '1988-01-10'),
('Diego Vargas', '3167890123', '1991-06-20'),
('Camila Ruiz', '3187654321', '1994-09-14');

INSERT INTO empleado (nombre, salario) 
VALUES 
('Carlos Ramírez', 1500),
('Ana López', 1300),
('Jorge Castillo', 1600),
('Valentina Gómez', 1400),
('Andrés Díaz', 1200),
('Patricia Mendoza', 1350),
('Miguel Reyes', 1450),
('Andrea Silva', 1550),
('Ricardo Peña', 1500),
('Isabel Moreno', 1250);

INSERT INTO ingrediente (nombre, cantidad) 
VALUES 
('Harina', 100), 
('Azúcar', 50), 
('Leche', 30),
('Chocolate', 40),
('Mantequilla', 25),
('Huevos', 200),
('Café', 15),
('Vainilla', 5),
('Canela', 10),
('Levadura', 20);

INSERT INTO categoria (nombre) 
VALUES 
('Pan'), 
('Postres'), 
('Bebidas'),
('Tortas'),
('Dulces'),
('Galletas'),
('Empanadas');

INSERT INTO producto (id_categoria, nombre, precio, id_ingrediente_principal) 
VALUES 
(1, 'Pan Integral', 1.50, 1), 
(1, 'Pan Blanco', 1.00, 1), 
(2, 'Pastel de Chocolate', 2.50, 4), 
(2, 'Galletas de Vainilla', 1.75, 8),
(3, 'Café Americano', 1.25, 7), 
(3, 'Café con Leche', 1.50, 3), 
(4, 'Torta de Tres Leches', 3.00, 3),
(5, 'Dulce de Leche', 2.00, 2),
(6, 'Galleta de Avena', 1.80, 1),
(7, 'Empanada de Pollo', 2.20, 1);


INSERT INTO proveedor (nombre) 
VALUES 
('Proveedor A'), 
('Proveedor B'), 
('Proveedor C'),
('Proveedor D'),
('Proveedor E'),
('Proveedor F'),
('Proveedor G'),
('Proveedor H'),
('Proveedor I'),
('Proveedor J');

INSERT INTO venta (fecha, id_cliente, id_empleado,total) 
VALUES 
('2024-10-15', 1, 1,null),
('2024-10-16', 2, 2,null),
('2024-10-17', 3, 3,null),
('2024-10-18', 4, 4,null),
('2024-10-19', 5, 5,null),
('2024-10-20', 6, 6,null),
('2024-10-21', 7, 7,null),
('2024-10-22', 8, 8,null),
('2024-10-23', 9, 9,null),
('2024-10-24', 10, 10,null);

INSERT INTO productosVenta(id_venta,id_producto,cantidad,subtotal) VALUES 
(1,1,2,null),
(1,2,1,null),
(2,3,3,null),
(2,4,4,null),
(3,5,2,null),
(4,6,1,null),
(4,2,3,null),
(4,1,4,null),
(5,7,1,null),
(6,2,4,null),
(7,4,5,null),
(8,3,6,null),
(9,1,1,null),
(10,1,3,null)
;


INSERT INTO ordenesCompra (id_proveedor, total, fecha) 
VALUES 
(1, 500.50, '2024-10-15 10:30:00'),
(2, 250.75, '2024-10-16 12:00:00'),
(3, 300.25, '2024-10-17 14:15:00'),
(4, 425.00, '2024-10-18 09:45:00'),
(5, 150.50, '2024-10-19 11:20:00'),
(6, 600.00, '2024-10-20 08:50:00'),
(7, 720.25, '2024-10-21 13:10:00'),
(8, 275.35, '2024-10-22 15:00:00'),
(9, 450.90, '2024-10-23 10:40:00'),
(10, 380.60, '2024-10-24 16:30:00');

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

INSERT INTO productoIngrediente (id_producto, id_ingrediente, porcentaje) 
VALUES 
(1, 1, 70),  -- Pan Integral con Harina (70%)
(1, 10, 30), -- Pan Integral con Levadura (30%)
(2, 1, 80),  -- Pan Blanco con Harina (80%)
(2, 10, 20), -- Pan Blanco con Levadura (20%)
(3, 1, 50),  -- Pastel de Chocolate con Harina (50%)
(3, 4, 40),  -- Pastel de Chocolate con Chocolate (40%)
(3, 6, 10),  -- Pastel de Chocolate con Huevos (10%)
(4, 1, 40),  -- Galletas de Vainilla con Harina (40%)
(4, 8, 30),  -- Galletas de Vainilla con Vainilla (30%)
(4, 5, 30),  -- Galletas de Vainilla con Mantequilla (30%)
(5, 7, 100), -- Café Americano con Café (100%)
(6, 7, 50),  -- Café con Leche con Café (50%)
(6, 3, 50),  -- Café con Leche con Leche (50%)
(7, 1, 50),  -- Torta de Tres Leches con Harina (50%)
(7, 3, 50);  -- Torta de Tres Leches con Leche (50%)


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

INSERT INTO ordenProducto (id_orden, id_producto, cantidad, subtotal)
VALUES 
(1, 1, 50, 75.00),  -- Orden 1, Pan Integral, 50 unidades, subtotal 75.00
(1, 2, 100, 100.00), -- Orden 1, Pan Blanco, 100 unidades, subtotal 100.00
(2, 3, 20, 50.00),   -- Orden 2, Pastel de Chocolate, 20 unidades, subtotal 50.00
(2, 4, 40, 70.00),   -- Orden 2, Galletas de Vainilla, 40 unidades, subtotal 70.00
(3, 5, 30, 37.50),   -- Orden 3, Café Americano, 30 unidades, subtotal 37.50
(4, 6, 25, 37.50),   -- Orden 4, Café con Leche, 25 unidades, subtotal 37.50
(5, 7, 10, 30.00),   -- Orden 5, Torta de Tres Leches, 10 unidades, subtotal 30.00
(6, 8, 15, 30.00);   -- Orden 6, Dulce de Leche, 15 unidades, subtotal 30.00

INSERT INTO ordenIngrediente (id_orden, id_ingrediente, cantidad, subtotal)
VALUES 
(1, 1, 100, 50.00),  -- Orden 1, Harina, 100 unidades, subtotal 50.00
(1, 2, 50, 25.00),   -- Orden 1, Azúcar, 50 unidades, subtotal 25.00
(2, 3, 30, 30.00),   -- Orden 2, Leche, 30 unidades, subtotal 30.00
(2, 4, 40, 40.00),   -- Orden 2, Chocolate, 40 unidades, subtotal 40.00
(3, 5, 25, 35.00),   -- Orden 3, Mantequilla, 25 unidades, subtotal 35.00
(4, 6, 200, 100.00), -- Orden 4, Huevos, 200 unidades, subtotal 100.00
(5, 7, 15, 45.00);   -- Orden 5, Café, 15 unidades, subtotal 45.00

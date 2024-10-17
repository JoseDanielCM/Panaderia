-- 1 consultasSimples

-- Mostrar todos los productos disponibles en la panadería.

SELECT * FROM producto;

-- Listar todos los ingredientes de la panadería.

select * from ingrediente;

-- Mostrar todas las ventas realizadas en un día específico.
select * from venta;
select * from venta where venta.fecha = "2024-10-15";

-- Listar todos los clientes registrados en la base de datos.

select * from cliente;

-- Mostrar todos los empleados de la panadería.

select * from empleado;

-- Mostrar todas las órdenes de compra a proveedores.

select * from ordenescompra;

-- Listar todas las ventas superiores a $5.

select * from venta where venta.total >= 5;

-- Mostrar todos los productos que sean de tipo 'pan'.

select * from producto 
join categoria on categoria.id = producto.id_categoria
where categoria.nombre = "pan";
-- Listar los proveedores con los que se trabaja regularmente.

select * from proveedor;

-- Mostrar las órdenes de compra que están pendientes.

select * from ordenescompra where ordenescompra.fecha > curdate();

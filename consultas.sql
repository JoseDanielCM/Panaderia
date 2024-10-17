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

-- 2 Consultas con JOIN

-- Obtener todas las ventas con el detalle de los productos vendidos
select venta.*, productosventa.cantidad, productosventa.subtotal from venta JOIN productosventa 
on productosventa.id_venta = venta.id;
-- Mostrar los ingredientes utilizados en cada producto

select producto.nombre, GROUP_CONCAT(ingrediente.nombre SEPARATOR ", ") as ingredientes from producto
join productoingrediente on productoingrediente.id_producto = producto.id
join ingrediente on ingrediente.id = productoingrediente.id_ingrediente
GROUP BY producto.id;

-- Mostrar las ventas de cada empleado.

select empleado.nombre, count(empleado.id)
from empleado
JOIN venta on venta.id_empleado = empleado.id
GROUP BY empleado.id;

-- Listar los proveedores y los productos que les compramos.

select proveedor.nombre, GROUP_CONCAT(producto.nombre SEPARATOR ", ") as productosCompramos
from proveedor
join ordenescompra on ordenescompra.id_proveedor = proveedor.id
join ordenproducto on ordenproducto.id_orden = ordenescompra.id
join producto on producto.id = ordenproducto.id_producto
GROUP BY proveedor.id;

-- Mostrar los clientes y sus respectivas compras.

select cliente.nombre, GROUP_CONCAT(producto.nombre SEPARATOR ", ") as productosComprdos
from cliente
join venta on venta.id_cliente = cliente.id
join productosventa on productosventa.id_venta = venta.id
join producto on producto.id = productosventa.id_producto
GROUP BY cliente.id;
-- Obtener las órdenes de compra junto con los proveedores correspondientes.
-- Mostrar el inventario actual de productos junto con el proveedor del ingrediente principal.
-- Listar los productos vendidos y el total de ingresos generados por cada uno.
-- Obtener las ventas con la información de los clientes que las realizaron.
-- Mostrar las órdenes de compra que incluyen productos que están agotados.
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

select * from ordenesCompra;

-- Listar todas las ventas superiores a $5.

select * from venta where venta.total >= 5;

-- Mostrar todos los productos que sean de tipo 'pan'.

select * from producto 
join categoria on categoria.id = producto.id_categoria
where categoria.nombre = "pan";
-- Listar los proveedores con los que se trabaja regularmente.

select * from proveedor;

-- Mostrar las órdenes de compra que están pendientes.

select * from ordenesCompra where ordenesCompra.fecha > curdate();

-- 2 Consultas con JOIN

-- Obtener todas las ventas con el detalle de los productos vendidos
select venta.*, productosVenta.cantidad, productosVenta.subtotal from venta JOIN productosVenta 
on productosVenta.id_venta = venta.id;
-- Mostrar los ingredientes utilizados en cada producto

select producto.nombre, GROUP_CONCAT(ingrediente.nombre SEPARATOR ", ") as ingredientes from producto
join productoIngrediente on productoIngrediente.id_producto = producto.id
join ingrediente on ingrediente.id = productoIngrediente.id_ingrediente
GROUP BY producto.id;

-- Mostrar las ventas de cada empleado.

select empleado.nombre, count(empleado.id)
from empleado
JOIN venta on venta.id_empleado = empleado.id
GROUP BY empleado.id;

-- Listar los proveedores y los productos que les compramos.

select proveedor.nombre, GROUP_CONCAT(producto.nombre SEPARATOR ", ") as productosCompramos
from proveedor
join ordenesCompra on ordenesCompra.id_proveedor = proveedor.id
join ordenProducto on ordenProducto.id_orden = ordenesCompra.id
join producto on producto.id = ordenProducto.id_producto
GROUP BY proveedor.id;

-- Mostrar los clientes y sus respectivas compras.

select cliente.nombre, GROUP_CONCAT(producto.nombre SEPARATOR ", ") as productosComprdos
from cliente
join venta on venta.id_cliente = cliente.id
join productosVenta on productosVenta.id_venta = venta.id
join producto on producto.id = productosVenta.id_producto
GROUP BY cliente.id;
-- Obtener las órdenes de compra junto con los proveedores correspondientes.

select ordenesCompra.*, proveedor.nombre from proveedor 
join ordenesCompra on ordenesCompra.id_proveedor = proveedor.id;

-- Mostrar el inventario actual de productos junto con el proveedor del ingrediente principal.

select producto.nombre, ingrediente.nombre as ingredientePrincipal,  proveedor.nombre 
from producto
join productoIngrediente on productoIngrediente.id_producto = producto.id
join ingrediente on ingrediente.id = productoIngrediente.id_ingrediente
join ordenIngrediente on ordenIngrediente.id_ingrediente = ingrediente.id
join ordenesCompra on ordenesCompra.id = ordenIngrediente.id_orden
join proveedor on proveedor.id = ordenesCompra.id_proveedor
where producto.id_ingrediente_principal = ingrediente.id
;

-- Listar los productos vendidos y el total de ingresos generados por cada uno.

select producto.nombre, sum(productosVenta.subtotal)
from producto
join productosVenta on productosVenta.id_producto = producto.id
GROUP BY producto.id
;

-- Obtener las ventas con la información de los clientes que las realizaron.

select venta.*, cliente.nombre 
from cliente
join venta on venta.id_cliente = cliente.id;

-- Mostrar las órdenes de compra que incluyen productos que están agotados.

select ordenProducto.* from ordenesCompra
join ordenProducto on ordenProducto.id_orden = ordenesCompra.id
join producto on producto.id = ordenProducto.id_producto
where producto.stock=0
;

-- 3 Consultas con Funciones de Agregación
-- Calcular el total de ventas de la panadería.

select sum(venta.total) as totalEnVentas from venta;

-- Obtener el precio promedio de los productos vendidos.

select avg(producto.precio) as precioPromedio from producto;

-- Mostrar la cantidad total de productos vendidos por categoría.

select categoria.nombre, count(producto.id) from producto
join categoria on categoria.id = producto.id_categoria
GROUP BY categoria.id;

-- Calcular el ingreso total generado en una semana específica.

SELECT SUM(total) AS ingreso_total
FROM venta
WHERE fecha >= '2024-10-13' AND fecha < '2024-10-19';

-- Mostrar el total de ventas realizadas por un empleado específico.

SELECT SUM(total) AS ingreso_total
FROM venta
join empleado on empleado.id = venta.id_empleado
WHERE empleado.id =1;

-- Calcular la cantidad total de ingredientes utilizados en un producto.
SELECT producto.nombre , count(ingrediente.id) as cantidadIngredientes from producto
join productoIngrediente on productoIngrediente.id_producto = producto.id
join ingrediente on ingrediente.id = productoIngrediente.id
GROUP BY producto.id;
-- Obtener el total de órdenes de compra realizadas en el último mes.
select count(ordenesCompra.id) from ordenesCompra
where month(ordenesCompra.fecha) = month(curdate());
-- Mostrar la cantidad de clientes que han realizado compras en el último mes.
select count(cliente.id) from cliente
join venta on venta.id_cliente = cliente.id
where month(venta.fecha) = month(curdate());
-- Calcular el costo total de los ingredientes comprados a un proveedor.
-- Mostrar el total de ventas en un día específico.

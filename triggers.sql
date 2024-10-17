DELIMITER //
CREATE TRIGGER calcularSubtotalProductosVenta
BEFORE INSERT on productosVenta for each row
begin
    declare precioProducto float;
    select producto.precio into precioProducto from producto where producto.id = new.id_producto;
    set new.subtotal = precioProducto * new.cantidad;
end //
DELIMITER ;

DELIMITER //
CREATE TRIGGER calcularTotalVenta
After INSERT on productosVenta for each row
begin
    declare totalVenta float;
    select sum(productosVenta.subtotal) into totalVenta from productosVenta where productosVenta.id_venta = new.id_venta group by productosVenta.id_venta;
    UPDATE venta set total = totalVenta where venta.id = new.id_venta;
end //
DELIMITER ;

-- SELECT * from panaderia.productosventa;

-- Actualizar automáticamente el inventario después de cada venta. --------------------- --------------------------------------------------------

DELIMITER //
CREATE TRIGGER inventarioVenta
After INSERT on productosVenta for each row
begin
	update producto set producto.stock = producto.stock - new.cantidad where producto.id = new.id_producto;
end //
DELIMITER ;

select * from producto;
-- select * from producto;
-- drop TRIGGER inventarioVenta;
-- SELECT * from panaderia.productosventa;

-- Evitar la eliminación de un cliente si tiene ventas pendientes.
DELIMITER //
CREATE TRIGGER validarPendientes
before DELETE on cliente for each row
begin
	declare cantidadVentasPendientes INT;
		select count(venta.id) into cantidadVentasPendientes
		from cliente JOIN venta on venta.id_cliente = cliente.id
		where venta.estado = "pendiente" and cliente.id= old.id
		GROUP BY cliente.id;

    if cantidadVentasPendientes <> 0 or cantidadVentasPendientes is NOT NULL then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar este cliente, tiene compras pendientes';
	end if;
end //
DELIMITER ;

delete FROM cliente where id=7;

-- Verificar que los datos de un cliente estén completos antes de insertarlo.

-- Generar una orden de compra automáticamente si un ingrediente está bajo en inventario.
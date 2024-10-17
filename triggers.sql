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

SELECT * from panaderia.productosventa;
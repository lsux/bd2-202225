CREATE VIEW `bd2_202225_25002638`.`vis_01` 
    AS
SELECT Producto.NombreProducto, Tienda.NombreLocal, 
        Venta.PrecioProducto,
	(SELECT MAX(PrecioVenta)
	 FROM almacena
	 WHERE (almacena.IdProducto = Venta.IdProducto)*1.15) AS PrecioSugerido
 FROM Producto, almacena, Venta, Tienda
 WHERE sf_2(Producto.IdProducto) AND
       almacena.IdProducto = Venta.IdProducto AND
       Venta.IdProducto = Producto.IdProducto AND
       almacena.IdLocal = Venta.IdLocal;

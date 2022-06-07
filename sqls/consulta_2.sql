SELECT o.CantidadInventario
FROM Organi AS o, Tienda AS t, Producto AS p
WHERE t.IdTienda = o.IdTienda AND 
	p.IdProducto = o.IdProducto AND
	p.IdProducto = $particular;
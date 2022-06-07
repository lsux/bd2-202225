SELECT COUNT(p.IdProducto), t.IdTienda
FROM Tienda AS t, Producto AS p, Vende AS v
WHERE t.IdTienda = v.IdTienda AND
	v.IdProducto = p.IdProducto AND
	 v.FechaVenta BETWEEN SUBDATE(CURDATE(), INTERVAL 1 MONTH) AND NOW();

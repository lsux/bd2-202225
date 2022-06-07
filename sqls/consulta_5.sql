SELECT p.IdProducto, SUM (p.PrecioProducto)
FROM Tienda AS t, Producto AS p, Vende AS v
WHERE t.IdTienda = o.IdTienda AND 
	p.IdProducto = o.IdProducto
GROUP BY(p.NombreProducto)
HAVING SUM (v.PrecioVenta)> (SELECT (SUM (p.PrecioProducto))*2
				FROM Tienda AS t, Producto AS p, Vende AS v
				WHERE t.IdTienda = o.IdTienda AND 
					p.IdProducto = o.IdProducto AND
					v.FechaVenta BETWEEN SUBDATE(CURDATE(), INTERVAL 1 MONTH) AND NOW());
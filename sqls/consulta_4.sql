SELECT p.IdProducto
FROM Organi AS o, Tienda AS t, Producto AS p, Vende AS v
WHERE t.IdTienda = o.IdTienda AND 
	p.IdProducto = o.IdProducto AND
	v.FechaVenta BETWEEN SUBDATE(CURDATE(), INTERVAL 3 MONTH) AND NOW()
GROUP BY(t.IdTienda)
HAVING COUNT(o.IdProducto) = 0;
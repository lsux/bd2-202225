SELECT t.IdTienda
FROM Organi AS o, Tienda AS t, Producto AS p, Vende AS v
WHERE t.IdTienda = o.IdTienda AND 
	p.IdProducto = o.IdProducto AND
	p.IdProducto = $particular
GROUP BY(t.IdTienda)
HAVING COUNT(o.IdProducto) = 0;
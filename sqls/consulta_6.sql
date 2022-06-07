SELECT t.IdTienda
FROM Tienda AS t, Producto AS p, Vende AS v
WHERE t.IdTienda = v.IdTienda AND 
      p.IdProducto = v.IdProducto AND
GROUP BY(t.IdTienda)
HAVING COUNT(v.IdProducto) = 0;
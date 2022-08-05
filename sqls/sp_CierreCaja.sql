DELIMITER $$

CREATE PROCEDURE CierreDeCaja(IN NumLocal INT)
    BEGIN
        DECLARE TotalFacturado FLOAT; 
        DECLARE ProductosVendidos INT;

        SET TotalFacturado=(SELECT SUM(CantidadProducto*PrecioProducto) 
			    FROM Venta 
			    WHERE FechaVenta = CURDATE()-1 AND IdLocal=NumLocal);

        SET ProductosVendidos =(SELECT SUM(CantidadProducto)
				FROM Venta 
				WHERE FechaVenta = CURDATE()-1 AND IdLocal=NumLocal); 

        IF(TotalFacturado>0 OR ProductosVendidos>0) THEN
            INSERT INTO Cierres(id_tienda,fecha,total_facturado,num_articulos_vendidos) VALUES (NumLocal,CURRENT_DATE(),TotalFacturado,ProductosVendidos);
        END IF;
    END$$

DELIMITER ;
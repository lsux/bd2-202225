DROP FUNCTION IF EXISTS bd2_202225_25002638.PrecioReferencia;

DELIMITER $$

CREATE FUNCTION=`bd2_202225_25002638`.`sf_03`(IdProductoConsultado INT) 
       RETURNS FLOAT
       
       BEGIN
            DECLARE PrecioReferencia FLOAT;
	    DECLARE TotalDeProducto INT;
	    
	    SET TotalDeProducto = (SELECT SUM(StockInventario)
					FROM almacena
					WHERE IdProducto = IdProductoConsultado);
					
	    IF (TotalDeProducto =  0) THEN
		SET PrecioReferencia = 0;
	    ELSE
		SET PrecioReferencia = (
			SELECT (SUM(StockInventario*PrecioVenta)/TotalDeProducto) AS PrecioReferencia
			FROM almacena
			WHERE IdProducto = IdProductoConsultado
			GROUP BY IdProducto);
	    END IF;
	    
	    RETURN PrecioReferencia;
    END$$
DELIMITER ;
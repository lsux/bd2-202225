DELIMITER $$

USE `bd2_202225_25002638`$$

DROP FUNCTION IF EXISTS `sf_3`$$

CREATE DEFINER=`bd2_202225_25002638`@`%` FUNCTION `sf_3`(IdProductoConsultado INT) 
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
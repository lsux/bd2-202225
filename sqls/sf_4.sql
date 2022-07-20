DELIMITER $$

USE `bd2_202225_25002638`$$

DROP FUNCTION IF EXISTS `sf_4`$$

CREATE DEFINER=`bd2_202225_25002638`@`%` FUNCTION `sf_4`(IdProductoConsultado INT) 
       RETURNS FLOAT
       
       BEGIN
            DECLARE CostoReposicion FLOAT;
	    
	    SET CostoReposicion = (SELECT PrecioCompra
					FROM Provee
					WHERE IdProducto = IdProductoConsultado)+(0.02 * (SELECT (DATEDIFF(CURRENT_DATE(), DATE(fecha))/30)
					                                                  FROM Provee
	                                                                                  WHERE IdProducto = IdProductoConsultado));
	    RETURN CostoReposicion;
    END$$
DELIMITER ;
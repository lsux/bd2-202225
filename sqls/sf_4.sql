DROP FUNCTION IF EXISTS bd2_202225_25002638.CostoReposicion;

DELIMITER $$

CREATE FUNCTION=`bd2_202225_25002638`.`sf_04`(IdProductoConsultado INT) 
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
DELIMITER;
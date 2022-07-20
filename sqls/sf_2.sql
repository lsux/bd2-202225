DELIMITER $$

USE `bd2_202225_25002638`$$

DROP FUNCTION IF EXISTS `sf_2`$$

CREATE DEFINER=`bd2_202225_25002638`@`%` FUNCTION `sf_2`(IdProductoConsultado INT) RETURNS VARCHAR(60) 
BEGIN
	DECLARE AltaDemanda VARCHAR(60);
	DECLARE VentasDelDia INT;
	DECLARE ExistenciaTotal INT;
	
	SET ExistenciaTotal = (
	    SELECT SUM(StockInventario) FROM almacena 
	          WHERE IdProducto = idProductoConsultado
	          GROUP BY IdProducto);
	          
	SET VentasDelDia =(SELECT SUM(CantidadProducto) FROM Venta
	     WHERE IdProducto = IdProductoConsultado
	     AND FechaVenta = CURRENT_DATE()
	     GROUP BY IdProducto);
	     
	IF(VentasDelDia > ExistenciaTotal*0.5) THEN 
	     SET AltaDemanda = "Este producto tiene alta demanda";
	ELSE 
	     SET AltaDemanda = "Este producto no tiene alta demanda";
	END IF;
	RETURN AltaDemanda;
    END$$

DELIMITER ;
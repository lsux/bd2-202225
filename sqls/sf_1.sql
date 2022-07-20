DELIMITER $$

USE `bd2_202225_25002638`$$

DROP FUNCTION IF EXISTS `sf_1`$$

CREATE DEFINER=`bd2_202225_25002638`@`%` FUNCTION `sf_1`(IdTienda_p INT, FechaVenta_p DATE) RETURNS FLOAT
BEGIN
	DECLARE VentasTotales FLOAT;
	SET VentasTotales = (
			SELECT SUM(PrecioProducto*CantidadProducto)
			FROM Venta
			WHERE IdLocal = IdLocal_p AND FechaVenta = FechaVenta_p
		    );
	RETURN VentasTotales;
    END$$

DELIMITER ;
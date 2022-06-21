DROP FUNCTION IF EXISTS bd2_202225_25002638.VentasTotales;

DELIMITER $$

CREATE
    FUNCTION `bd2_202225_25002638`.`sf_1`(IdTiendaConsultada INT, FechaVentaConsultada DATE)
    RETURNS FLOAT

    BEGIN
	DECLARE VentasTotales FLOAT;
	SET VentasTotales = (
			SELECT SUM(PrecioProducto*CantidadProducto)
			FROM Venta
			WHERE IdLocal = IdLocalConsultada AND FechaVenta = FechaVentaConsultada
		    );
	RETURN VentasTotales;
    END$$

DELIMITER ;
DROP PROCEDURE IF EXISTS `bd2_202225_25002638`.`sp_3`;

DELIMITER $$

CREATE PROCEDURE `bd2_202225_25002638`.`sp_3`(IdLocalConsultado INT, IdProductoConsultado INT, CantidadSolicitada INT)
   
    BEGIN 
         DECLARE SolicitudDeProducto INT;
         
         SolicitudDeProducto = (SELECT StockInventario
                                FROM almacena, Tienda
                                WHERE almacena.IdLocal = Tienda.IdLocal AND 
                                      Tienda.Central = 'S' AND
                                      almacena.IdProducto = IdProductoConsultado)
         
         IF(SolicitudDeProducto > CantidadSolicitada) THEN
              UPDATE Traslada 
              SET EstatusTraslado = "Por procesar."
              UPDATE almacena 
              SET StockInventario = StockInventario - CantidadSolicitada
         ELSE 
              UPDATE Traslada
              SET EstatusTraslado = "Sin inventario."
         END IF;         
         
    END$$

DELIMITER ;
DROP TRIGGER IF EXISTS `bd2_202225_25002638`.`AjustarInventario`;

DELIMITER $$
CREATE  TRIGGER `bd2_202225_25002638`.`AjustarInventario` AFTER INSERT ON `bd2_202225_25002638`.`movimiento` 
    FOR EACH ROW BEGIN
    UPDATE almacena
        SET CantidadProducto = CantidadProducto - (SELECT StockInventario
            FROM Tienda, movimiento 
            WHERE Tienda.IdMovimiento = movimiento.IdMovimiento AND 
                  movimiento.IdMovimiento = new.IdMovimiento AND  
                  movimiento.Estado = 'Entregada');
    END$$
DELIMITER ;
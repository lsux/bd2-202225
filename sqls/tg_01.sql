DROP TRIGGER IF EXISTS `bd2_202225_25002638`.`ModificarPrecio`;

DELIMITER $$

CREATE  TRIGGER `bd2_202225_25002638`.`ModificarPrecio` BEFORE UPDATE ON `bd2_202225_25002638`.`almacena`
    FOR EACH ROW BEGIN
    
    IF (new.PrecioVenta > (almacena.PrecioVenta*1.15)) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = "No se puede modificar el precio a este producto en más de un 15%";
    END IF;
    END$$
DELIMITER ;


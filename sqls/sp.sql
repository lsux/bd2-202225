DELIMITER $$

USE `bd2_202225_25002638`$$

DROP PROCEDURE IF EXISTS `sp_1`$$

CREATE DEFINER=`bd2_202225_25002638`@`%` PROCEDURE `sp_1`(IdLocalConsultado INT, PorcentajeConsultado INT)
BEGIN
         UPDATE almacena
         SET PrecioVenta = PrecioVenta + (PrecioVenta*PorcentajeConsultado)/100
         WHERE IdLocal = IdLocalConsultado;
    END$$

DELIMITER ;
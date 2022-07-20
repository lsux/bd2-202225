DROP PROCEDURE IF EXISTS bd2_202225_25002638.AjustarPrecios;

DELIMITER $$

CREATE PROCEDURE `bd2_202225_25002638`.`sp_1`(IdLocalConsultado INT, PorcentajeConsultado INT)
 
   
    BEGIN
         UPDATE almacena
         SET PrecioVenta = PrecioVenta + (PrecioVenta*PorcentajeConsultado)/100
         WHERE IdLocal = IdLocalConsultado
    END$$

DELIMITER ;
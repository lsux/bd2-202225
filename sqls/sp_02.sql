DELIMITER $$

USE `bd2_202225_25002638`$$

DROP PROCEDURE IF EXISTS `sp_2`$$

CREATE DEFINER=`bd2_202225_25002638`@`%` PROCEDURE `sp_2`(IdProductoConsultado INT)
      
   
    BEGIN
         UPDATE almacena 
         SET PrecioVenta = sf_3 (IdProductoConsultado)
             WHERE Producto.IdProducto = IdProductoConsultado;
    END$$

DELIMITER ;
DROP TRIGGER IF EXISTS `bd2_202225_25002638`.`VerificarExistenciaProducto`;

DELIMITER $$
CREATE TRIGGER `bd2_202225_25002638`.`VerificarExistenciaProductor` BEFORE INSERT ON `bd2_202225_25002638`.`Producto`
    FOR EACH ROW BEGIN
    IF new.NombreProducto=(SELECT NombreProducto 
    FROM Producto AS P 
    WHERE P.NombreProducto = new.NombreProducto) THEN
       SELECT '*DUPLICADO*';
    END$$
DELIMITER ;
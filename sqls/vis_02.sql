CREATE FUNCTION CodigoTienda() RETURNS INTEGER DETERMINISTIC RETURN @Nro;


CREATE VIEW `bd2_202225_25002638`.`vis_02` 
    AS
(SELECT NombreLocal, Ciudad, StockInventario
 FROM Tienda, almacena
 
 WHERE Tienda.IdLocal = almacena.IdLocal
       /* AND Tienda.IdLocal = Código tienda() */

);
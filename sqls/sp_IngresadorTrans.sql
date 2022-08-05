DELIMITER $$

DROP PROCEDURE IF EXISTS `ingresadorTrans`$$

CREATE PROCEDURE `ingresadorTrans`(IN Iteraciones INTEGER)
BEGIN
    
    SET @i = 0;
        
    START TRANSACTION;
	    REPEAT
		INSERT INTO test (Numero) VALUES (FLOOR(0 + RAND() * (100 - 0)));
		SET @i = @i + 1;
		SET @X = SLEEP(5);
	    UNTIL (@i >= Iteraciones) END REPEAT;
    COMMIT;
    END$$

DELIMITER ;
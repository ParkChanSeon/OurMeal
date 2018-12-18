USE ourmeal;

SET GLOBAL log_bin_trust_function_creators = 'ON';

/* =================================================================================================================
==================================================== 공백 제거 함수 ===================================================
===================================================== 18.11.28 =====================================================
================================================================================================================= */
DELIMITER $$
DROP FUNCTION IF EXISTS ourmeal.f_string_trim;

CREATE FUNCTION ourmeal.f_string_trim( as_string TEXT ) RETURNS TEXT
BEGIN

	DECLARE RTN_VAL	TEXT;
    
    
    SET RTN_VAL = TRIM(as_string);
    
    
    WHILE INSTR( RTN_VAL, '  ' ) != 0 DO
    
		SET RTN_VAL = REPLACE( RTN_VAL, '  ', ' ' );
        
    END WHILE;
    
    
    RETURN RTN_VAL;
    
END $$

DELIMITER ;



DELIMITER //

CREATE FUNCTION agregar_dias(fecha DATE, dias INT)
RETURNS DATE
DETERMINISTIC
BEGIN
  RETURN fecha + INTERVAL dias DAY;
END //

DELIMITER ;
  
DELIMITER //  
CREATE FUNCTION obtener_paginas()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE paginas INT; -- Declarar la variable local
  SET paginas = (SELECT (ROUND( RAND() * 100 ) * 4 )); -- Asignar el valor a la variable
  RETURN paginas; -- Devolver el valor de la variable
END//

DELIMITER ;
  
DELIMITER //
CREATE FUNCTION obtener_ventas()
RETURNS INT
DETERMINISTIC  
BEGIN
  DECLARE ventas INT; -- Declarar la variable local
  SET ventas = (SELECT (ROUND( RAND() * 100 ) * 6 ));
  RETURN ventas;
END//

DELIMITER ;

UPDATE libros SET paginas = obtener_paginas();
UPDATE libros SET ventas = obtener_ventas();


-- para ver mis funciones en la version de mi mysql
SHOW FUNCTION STATUS WHERE Db = 'libreria_cf';


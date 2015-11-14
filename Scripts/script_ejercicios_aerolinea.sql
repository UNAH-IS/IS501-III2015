--Cual es la clase social que mas pasajeros tiene y cuantos son?
SELECT A.*
FROM (
  SELECT B.NOMBRE_CLASE, COUNT(1) AS CANTIDAD
  FROM TBL_FACTURA_DETALLE A
  INNER JOIN TBL_CLASES_SOCIALES B
  ON A.CODIGO_CLASE = B.CODIGO_CLASE
  GROUP BY B.NOMBRE_CLASE
  ORDER BY CANTIDAD DESC
) A
WHERE ROWNUM = 1;


--Mostrar vuelos con la cantidad de pasajeros, 
--cantidad de puntos en su ruta, 
--cantidad de tripulantes,
--quien es su piloto, 
--y cuanto dinero genera su vuelo.

SELECT CODIGO_VUELO, COUNT(*) CANTIDAD_PASAJEROS
FROM TBL_FACTURA_DETALLE
GROUP BY CODIGO_VUELO;

SELECT C.CODIGO_VUELO, B.ALIAS_RUTA,
        COUNT(*) CANTIDAD_PUNTOS
FROM TBL_PUNTOS_X_RUTAS A
INNER JOIN TBL_RUTAS B 
ON (A.CODIGO_RUTA = B.CODIGO_RUTA)
INNER JOIN TBL_VUELOS C
ON (B.CODIGO_RUTA = C.CODIGO_RUTA)
GROUP BY C.CODIGO_VUELO, B.ALIAS_RUTA;

SELECT CODIGO_VUELO, COUNT(*) CANTIDAD_TRIPULANTES
FROM TBL_TRIPULACION_X_VUELOS
GROUP BY CODIGO_VUELO;

SELECT B.CODIGO_VUELO,A.CODIGO_TRIPULANTE, 
      A.NOMBRE AS NOMBRE_PILOTO
FROM TBL_TRIPULACION A
INNER JOIN TBL_TRIPULACION_X_VUELOS B
ON (A.CODIGO_TRIPULANTE = B.CODIGO_TRIPULANTE)
WHERE CODIGO_CARGO = 1;

SELECT CODIGO_VUELO, SUM(COSTO_TICKET) COSTO_TOTAL
FROM TBL_FACTURA_DETALLE
GROUP BY CODIGO_VUELO;


-------------------------
--CONSULTA FINAL:
SELECT A.CODIGO_VUELO, A.CANTIDAD_PASAJEROS,
      B.ALIAS_RUTA, B.CANTIDAD_PUNTOS,
      C.CANTIDAD_TRIPULANTES,  
      D.NOMBRE_PILOTO,
      E.COSTO_TOTAL
FROM (
    SELECT CODIGO_VUELO, COUNT(*) CANTIDAD_PASAJEROS
    FROM TBL_FACTURA_DETALLE
    GROUP BY CODIGO_VUELO
) A
INNER JOIN (
    SELECT C.CODIGO_VUELO, B.ALIAS_RUTA,
          COUNT(*) CANTIDAD_PUNTOS
    FROM TBL_PUNTOS_X_RUTAS A
    INNER JOIN TBL_RUTAS B 
    ON (A.CODIGO_RUTA = B.CODIGO_RUTA)
    INNER JOIN TBL_VUELOS C
    ON (B.CODIGO_RUTA = C.CODIGO_RUTA)
    GROUP BY C.CODIGO_VUELO, B.ALIAS_RUTA
) B
ON (A.CODIGO_VUELO = B.CODIGO_VUELO)
INNER JOIN (
    SELECT CODIGO_VUELO, COUNT(*) CANTIDAD_TRIPULANTES
    FROM TBL_TRIPULACION_X_VUELOS
    GROUP BY CODIGO_VUELO
) C
ON (A.CODIGO_VUELO = C.CODIGO_VUELO)
INNER JOIN (
    SELECT B.CODIGO_VUELO,A.CODIGO_TRIPULANTE, 
          A.NOMBRE AS NOMBRE_PILOTO
    FROM TBL_TRIPULACION A
    INNER JOIN TBL_TRIPULACION_X_VUELOS B
    ON (A.CODIGO_TRIPULANTE = B.CODIGO_TRIPULANTE)
    WHERE CODIGO_CARGO = 1
) D
ON (A.CODIGO_VUELO = D.CODIGO_VUELO)
INNER JOIN (
    SELECT CODIGO_VUELO, SUM(COSTO_TICKET) COSTO_TOTAL
    FROM TBL_FACTURA_DETALLE
    GROUP BY CODIGO_VUELO
) E
ON (A.CODIGO_VUELO = E.CODIGO_VUELO)
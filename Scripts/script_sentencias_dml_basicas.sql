INSERT INTO TBL_ASIENTOS(
  CODIGO_ASIENTO, 
  ALIAS_ASIENTO
) 
VALUES (
  5, 'a5'
);

COMMIT;

INSERT INTO TBL_ASIENTOS(
  CODIGO_ASIENTO, 
  ALIAS_ASIENTO
)
VALUES (
  5, 'a5'
);


UPDATE TBL_ASIENTOS
SET CODIGO_ASIENTO = 7
WHERE CODIGO_ASIENTO = 3;

--DML
DELETE FROM TBL_ASIENTOS
WHERE CODIGO_ASIENTO = 7;

--DDL
TRUNCATE TABLE TBL_ASIENTOS;--ELIMINA LOS REGISTROS DE UNA TABLA


ROLLBACK;

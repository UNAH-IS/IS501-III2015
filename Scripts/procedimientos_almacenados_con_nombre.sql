CREATE OR REPLACE PROCEDURE NOMBRE_PROCEDIMIENTO(PARAMETROS) AS
--DECLARACION DE VARIABLES
BEGIN
  --CUERPO
END;

CREATE OR REPLACE PROCEDURE SP_HOLA_MUNDO(P_NOMBRE VARCHAR2, P_APELLIDO VARCHAR2) AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('HOLA ' || P_NOMBRE || ' ' || P_APELLIDO);
END;

--EJECUTAR UN PROCEDIMIENTO ALMACENADO CON NOMBRE
EXECUTE NOMBRE_PROCEDIMIENTO;
CALL NOMBRE_PROCEDIMIENTO;
BEGIN
  NOMBRE_PROCEDIMIENTO;
END;


EXECUTE SP_HOLA_MUNDO('JUAN','PEREZ');
CALL SP_HOLA_MUNDO('JUAN','PEREZ');

BEGIN
  SP_HOLA_MUNDO('JUAN','PEREZ');
END;

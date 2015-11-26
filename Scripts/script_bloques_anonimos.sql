---PROCEDIMIENTO O BLOQUE ANONIMO

BEGIN
  NULL;
END;

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
END;


DECLARE 
  --VARIABLE TIPO_DATO:= VALOR;  
  V_NOMBRE VARCHAR2(200);
  V_APELLIDO VARCHAR2(200);
  V_CANTIDAD INTEGER;
BEGIN
  --V_NOMBRE := 'JUAN';
  --V_APELLIDO := 'PEREZ';
  
  SELECT 'JUAN', 'PEREZ' INTO V_NOMBRE, V_APELLIDO FROM DUAL;
  SELECT COUNT(1) INTO V_CANTIDAD FROM EMPLOYEES;
  
  --RESTRICCIONES SELECT INTO:
  -- LA CONSULTA SOLO DEBE RETORNAR UN REGISTRO
  DBMS_OUTPUT.PUT_LINE('HOLA '||V_NOMBRE || ' ' || V_APELLIDO);
  DBMS_OUTPUT.PUT_LINE('CANTIDAD DE EMPLEADOS: '||V_CANTIDAD);
END;
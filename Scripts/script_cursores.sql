SET SERVEROUTPUT ON;

--USO DE UN CURSOR UTILIZANDO UN CICLO CONVENCIONAL
DECLARE
  CURSOR CUR_PASAJEROS IS 
      SELECT CODIGO_PASAJERO, 
              NOMBRE, 
              APELLIDO, 
              EDAD, 
              GENERO 
      FROM TBL_PASAJEROS;
  V_REGISTRO TBL_PASAJEROS%ROWTYPE;
BEGIN
  OPEN CUR_PASAJEROS;
  LOOP 
      FETCH CUR_PASAJEROS INTO V_REGISTRO;
      EXIT WHEN CUR_PASAJEROS%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(V_REGISTRO.NOMBRE||
            ' '||V_REGISTRO.APELLIDO||
            '('||V_REGISTRO.GENERO||')');
  END LOOP;
  CLOSE CUR_PASAJEROS;
END;

--USO DE UN CURSOR UTILIZANDO FOR
DECLARE
  CURSOR CUR_PASAJEROS IS 
      SELECT CODIGO_PASAJERO, 
              NOMBRE, 
              APELLIDO, 
              EDAD, 
              GENERO 
      FROM TBL_PASAJEROS;
  V_REGISTRO TBL_PASAJEROS%ROWTYPE;
BEGIN
  FOR V_REGISTRO IN CUR_PASAJEROS LOOP
      DBMS_OUTPUT.PUT_LINE(V_REGISTRO.NOMBRE||
            ' '||V_REGISTRO.APELLIDO||
            '('||V_REGISTRO.GENERO||')');
  END LOOP;
END;

--CURSORES IMPLICITOS, SOLO SE PUEDEN UTILIZAR CON CICLOS FOR
--SON CURSORES SIN NOMBRE

DECLARE
  V_REGISTRO TBL_PASAJEROS%ROWTYPE;
  /*TYPE PASAJERO_LIMITADO IS RECORD (
    
  );
  V_REGISTRO PASAJERO_LIMITADO;*/
BEGIN
  FOR V_REGISTRO IN (
      SELECT CODIGO_PASAJERO, 
              NOMBRE, 
              APELLIDO, 
              EDAD, 
              GENERO 
      FROM TBL_PASAJEROS) LOOP
      DBMS_OUTPUT.PUT_LINE(V_REGISTRO.NOMBRE||
            ' '||V_REGISTRO.APELLIDO||
            '('||V_REGISTRO.GENERO||')');
  END LOOP;
END;



SELECT FUNCION(CAMPO), PROCEDIMIENTO(CAMPO)
FROM TABLA;
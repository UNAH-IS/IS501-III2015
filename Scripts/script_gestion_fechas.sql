CREATE TABLE TMP (
  FECHA DATE
);


SELECT * 
FROM TMP;

--INSERTAR UNA FECHA
--TO_DATE --> CONVERTIR DE TEXTO A UN OBJETO DATE

INSERT INTO TMP(FECHA)
VALUES (TO_DATE('01/08/2014','DD/MM/YYYY'));

SELECT TO_CHAR(FECHA, 'YYYYMMDD') AS FECHA
FROM TMP;


INSERT INTO TMP(FECHA)
VALUES (TO_DATE('01/05/2017 16:30:15','DD/MM/YYYY HH24:MI:SS'));

INSERT INTO TMP(FECHA)
VALUES (TO_DATE('01/05/2017 08:30:15 AM','DD/MM/YYYY HH12:MI:SS AM'));


SELECT TO_CHAR(FECHA,'DD*MM*YYYY HH12:MI:SS PM') FECHA
FROM TMP;


SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY HH24:MI:SS')
FROM DUAL;

--SE PUEDE AGREGAR O QUITAR DIAS UTILIZANDO SUMA/RESTA DE ENTEROS
SELECT SYSDATE - 200
FROM DUAL;

--AGREGAR O QUITAR MESES, AGREGAR: PARAMETRO POSITIVO, RESTAR: PARAMETRO NEGATIVO
SELECT ADD_MONTHS(SYSDATE,-2)
FROM DUAL;


--VERIFICAR CUANTOS MESES HAY ENTRE DOS FECHAS:
SELECT MONTHS_BETWEEN(SYSDATE, SYSDATE - 100)
FROM DUAL;


TO_DATE -> STR_TO_DATE %d%m%y
TO_CHAR -> DATE_FORMAT
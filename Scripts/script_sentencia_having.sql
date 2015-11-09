--Obtener cuanto es el salario total por puesto.
SELECT B.JOB_TITLE, 
      SUM(A.SALARY) AS SALARIO_TOTAL
FROM EMPLOYEES A
INNER JOIN JOBS B
ON (A.JOB_ID = B.JOB_ID)
GROUP BY B.JOB_TITLE
ORDER BY JOB_TITLE ASC;

--Mostrar los puestos y los salarios 
--de los puestos que el salario total sea menores que 12000
--No se puede filtrar informacion de campos que utilizan
--funciones de agregacion con la sentencia WHERE
--en su lugar se debe utilizar HAVING seguido de la funcion
--de agregacion. Having va despues de Group By
SELECT B.JOB_TITLE, 
      SUM(A.SALARY) AS SALARIO_TOTAL
FROM EMPLOYEES A
INNER JOIN JOBS B
ON (A.JOB_ID = B.JOB_ID)
GROUP BY B.JOB_TITLE
HAVING SUM(A.SALARY) <12000  
ORDER BY JOB_TITLE ASC;

--Obtener el salario total por region
SELECT E.REGION_NAME,SUM(A.SALARY) AS SALARIO_TOTAL
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID)
LEFT JOIN LOCATIONS C
ON (B.LOCATION_ID = C.LOCATION_ID)
LEFT JOIN COUNTRIES D
ON (C.COUNTRY_ID = D.COUNTRY_ID)
LEFT JOIN REGIONS E
ON (D.REGION_ID = E.REGION_ID)
--WHERE REGION_NAME ='Europe'
GROUP BY E.REGION_NAME;
--HAVING SUM(A.SALARY)>=500000;

/*7000
Europe	326400
Americas	2686153*/




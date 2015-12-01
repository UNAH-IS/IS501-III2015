/*
1. Mostrar todos los usuarios que no han creado ningún tablero, para dichos usuarios mostrar el nombre completo y correo, utilizar producto cartesiano con el operador (+).
**/
SELECT A.NOMBRE, B.CODIGO_TABLERO, B.NOMBRE_TABLERO
FROM TBL_USUARIOS A
LEFT JOIN TBL_TABLERO B
ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO_CREA)
WHERE B.CODIGO_TABLERO IS NULL;

SELECT A.NOMBRE||' '||A.APELLIDO AS NOMBRE_COMPLETO,
    A.CORREO
FROM  TBL_USUARIOS A,
      TBL_TABLERO B
WHERE A.CODIGO_USUARIO = B.CODIGO_USUARIO_CREA(+)
AND B.CODIGO_TABLERO IS NULL;


/*
2. Mostrar la cantidad de usuarios que se han registrado por cada red social, mostrar inclusive la cantidad de usuarios que no están registrados con redes sociales.
*/
SELECT *
FROM TBL_REDES_SOCIALES;

SELECT  NVL(B.NOMBRE_RED_SOCIAL,'NINGUNA') AS RED_SOCIAL, 
        COUNT(*) CANTIDAD_USUARIOS
FROM TBL_USUARIOS A
LEFT JOIN TBL_REDES_SOCIALES B
ON (A.CODIGO_RED_SOCIAL = B.CODIGO_RED_SOCIAL)
GROUP BY NVL(B.NOMBRE_RED_SOCIAL,'NINGUNA');

/*
3. Consultar el usuario que ha hecho más comentarios sobre una tarjeta (El más prepotente), para este usuario mostrar el nombre completo, correo, cantidad de comentarios y cantidad de tarjetas a las que ha comentado (pista: una posible solución para este último campo es utilizar count(distinct campo))
*/
SELECT A.*, 
    B.NOMBRE||' '||B.APELLIDO AS NOMBRE_COMPLETO,
    B.CORREO
FROM (
    SELECT CODIGO_USUARIO, COUNT(1) AS CANTIDAD_COMENTARIOS,
        COUNT(DISTINCT CODIGO_TARJETA) AS CANTIDAD_TARJETAS
    FROM TBL_COMENTARIOS
    GROUP BY CODIGO_USUARIO
    ORDER BY CANTIDAD_COMENTARIOS DESC
) A
INNER JOIN TBL_USUARIOS B
ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO)
WHERE ROWNUM = 1;


/*
4. Mostrar TODOS los usuarios con plan FREE, de dichos usuarios mostrar la siguiente información:
? Nombre completo
? Correo
? Red social (En caso de estar registrado con una)
? Cantidad de organizaciones que ha creado, mostrar 0 si no ha creado ninguna.
*/
SELECT *
FROM TBL_PLANES;

SELECT A.*,
    NVL(B.CANTIDAD_ORGANIZACIONES,0) AS CANTIDAD_ORGANIZACIONES
FROM (
    SELECT A.CODIGO_USUARIO,
        A.NOMBRE||' '||A.APELLIDO AS NOMBRE_COMPLETO,
        A.CORREO,
        B.NOMBRE_RED_SOCIAL
    FROM TBL_USUARIOS A
    LEFT JOIN TBL_REDES_SOCIALES B
    ON (A.CODIGO_RED_SOCIAL = B.CODIGO_RED_SOCIAL)
    WHERE CODIGO_PLAN = 1
) A
LEFT JOIN (
    SELECT CODIGO_ADMINISTRADOR, COUNT(*) CANTIDAD_ORGANIZACIONES
    FROM TBL_ORGANIZACIONES
    GROUP BY CODIGO_ADMINISTRADOR
) B
ON (A.CODIGO_USUARIO = B.CODIGO_ADMINISTRADOR);



/*5. Mostrar los usuarios que han creado más de 5 tarjetas, para estos usuarios mostrar:
Nombre completo, correo, cantidad de tarjetas creadas*/
SELECT A.CODIGO_USUARIO, 
      B.NOMBRE||' '||B.APELLIDO AS NOMBRE_COMPLETO,
      B.CORREO,
      COUNT(1) CANTIDAD_TARJETAS
FROM TBL_TARJETAS A
INNER JOIN TBL_USUARIOS B
ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO)
GROUP BY A.CODIGO_USUARIO, 
      B.NOMBRE||' '||B.APELLIDO,
      B.CORREO
HAVING COUNT(1) > 5;

/*6. Un usuario puede estar suscrito a tableros, listas y tarjetas, de tal forma que si hay algún cambio se le notifica en su teléfono o por teléfono, sabiendo esto, se necesita mostrar los nombres de todos los usuarios con la cantidad de suscripciones de cada tipo, en la consulta se debe mostrar:
? Nombre completo del usuario
? Cantidad de tableros a los cuales está suscrito
? Cantidad de listas a las cuales está suscrito
? Cantidad de tarjetas a las cuales está suscrito*/
SELECT B.NOMBRE||' '||B.APELLIDO AS NOMBRE_COMPLETO,
      A.CODIGO_USUARIO,
      COUNT(DISTINCT CODIGO_LISTA) AS CANTIDAD_LISTAS,
      COUNT(DISTINCT CODIGO_TABLERO) AS CANTIDAD_TABLEROS,
      COUNT(DISTINCT CODIGO_TARJETA) AS CANTIDAD_TARJETAS
FROM TBL_SUSCRIPCIONES A
INNER JOIN TBL_USUARIOS B
ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO)
GROUP BY B.NOMBRE||' '||B.APELLIDO,
      A.CODIGO_USUARIO;

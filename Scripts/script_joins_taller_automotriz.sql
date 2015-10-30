SELECT *
FROM TBL_VEHICULOS;

SELECT *
FROM TBL_COLOR;

SELECT *
FROM TBL_TIPOS_COMBUSTIBLE;

SELECT *
FROM TBL_TIPOS_TRANSMISION;

SELECT *
FROM TBL_CLIENTES;

SELECT * 
FROM TBL_SUCURSALES;

SELECT * 
FROM TBL_MARCAS;

SELECT * 
FROM TBL_MODELOS;

SELECT *
FROM TBL_TIPOS_VEHICULO;

SELECT *
FROM TBL_ADMINISTRADORES;


---
/*SELECT A.CHASIS, A.NUMERO_PLACA,
    B.NOMBRE
FROM TBL_VEHICULOS A
NATURAL JOIN TBL_CLIENTES B;*/


SELECT A.CHASIS, 
    A.NUMERO_PLACA,
    B.NOMBRE,
    C.NOMBRE_COLOR,
    D.TIPO_COMBUSTIBLE,
    E.TIPO_VEHICULO,
    F.TIPO_TRANSMISION,
    G.NOMBRE_MODELO,
    I.NOMBRE_SUCURSAL
FROM TBL_VEHICULOS A
INNER JOIN TBL_CLIENTES B
ON (A.CODIGO_CLIENTE = B.CODIGO_CLIENTE)
LEFT JOIN TBL_COLOR C
ON (A.CODIGO_COLOR = C.CODIGO_COLOR)
INNER JOIN TBL_TIPOS_COMBUSTIBLE D
ON (A.CODIGO_TIPO_COMBUSTIBLE = D.CODIGO_TIPO_COMBUSTIBLE)
INNER JOIN TBL_TIPOS_VEHICULO E
ON (A.CODIGO_TIPO_VEHICULO = E.CODIGO_TIPO_VEHICULO)
INNER JOIN TBL_TIPOS_TRANSMISION F
ON (A.CODIGO_TIPO_TRANSMISION = F.CODIGO_TIPO_TRANSMISION)
INNER JOIN TBL_MODELOS G
ON (A.CODIGO_MODELO = G.CODIGO_MODELO)
INNER JOIN TBL_MARCAS H
ON (G.CODIGO_MARCA = H.CODIGO_MARCA)
INNER JOIN TBL_SUCURSALES I
ON (A.CODIGO_SUCURSAL = I.CODIGO_SUCURSAL)
INNER JOIN TBL_ADMINISTRADORES J
ON (I.CODIGO_ADMINISTRADOR = J.CODIGO_ADMINISTRADOR);

--UTILIZANDO PRODUCTO CARTESIANO CON UN WHERE
SELECT A.CHASIS, 
    A.NUMERO_PLACA,
    B.NOMBRE,
    C.NOMBRE_COLOR,
    D.TIPO_COMBUSTIBLE,
    E.TIPO_VEHICULO,
    F.TIPO_TRANSMISION,
    G.NOMBRE_MODELO,
    I.NOMBRE_SUCURSAL
FROM TBL_VEHICULOS A,
      TBL_CLIENTES B,
      TBL_COLOR C,
      TBL_TIPOS_COMBUSTIBLE D,
      TBL_TIPOS_VEHICULO E,
      TBL_TIPOS_TRANSMISION F,
      TBL_MODELOS G,
      TBL_MARCAS H,
      TBL_SUCURSALES I,
      TBL_ADMINISTRADORES J
WHERE A.CODIGO_CLIENTE = B.CODIGO_CLIENTE
AND A.CODIGO_COLOR = C.CODIGO_COLOR(+)
AND A.CODIGO_TIPO_COMBUSTIBLE = D.CODIGO_TIPO_COMBUSTIBLE
AND A.CODIGO_TIPO_VEHICULO = E.CODIGO_TIPO_VEHICULO
AND A.CODIGO_TIPO_TRANSMISION = F.CODIGO_TIPO_TRANSMISION
AND A.CODIGO_MODELO = G.CODIGO_MODELO
AND G.CODIGO_MARCA = H.CODIGO_MARCA
AND A.CODIGO_SUCURSAL = I.CODIGO_SUCURSAL
AND I.CODIGO_ADMINISTRADOR = J.CODIGO_ADMINISTRADOR;


SELECT * 
FROM TBL_DESPERFECTOS;

SELECT * 
FROM TBL_DESPERFECTO_X_VEHICULO;


SELECT A.NUMERO_PLACA,
    B.COSTO_NETO AS COSTO_DESPERFECTO,
    C.NOMBRE_DESPERFECTO,
    C.COSTO_BASE
FROM TBL_VEHICULOS A
INNER JOIN TBL_DESPERFECTO_X_VEHICULO B
ON (A.NUMERO_PLACA = B.NUMERO_PLACA)
INNER JOIN TBL_DESPERFECTOS C
ON (B.CODIGO_DESPERFECTO = C.CODIGO_DESPERFECTO);


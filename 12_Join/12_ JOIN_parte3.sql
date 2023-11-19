#SELECT, GROUP BY y JOIN

-- Listar las canciones cuya duración sea mayor a 2 minutos.
SELECT * 
FROM canciones 
WHERE milisegundos > 120000;

-- Listar las canciones cuyo nombre comience con una vocal. 
SELECT * 
FROM canciones 
WHERE nombre LIKE 'a%' 
OR nombre LIKE 'e%' 
OR nombre LIKE 'i%' 
OR nombre LIKE 'o%'
OR nombre LIKE 'u%';

-- Canciones
-- Listar las canciones ordenadas por compositor en forma descendente.
SELECT * 
FROM canciones 
ORDER BY compositor DESC;

-- Luego, por nombre en forma ascendente. Incluir únicamente aquellas canciones que tengan compositor. 
SELECT * 
FROM canciones 
WHERE compositor IS NOT NULL 
AND compositor <> '' -- <> diferente a
ORDER BY nombre ASC; 

-- Canciones
-- Listar la cantidad de canciones de cada compositor. 
SELECT COUNT(*) cantidad_canciones, compositor
 FROM canciones 
 GROUP BY compositor;
 
-- Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones. 
SELECT COUNT(*) cantidad_canciones, compositor
 FROM canciones
 GROUP BY compositor
 HAVING cantidad_canciones > 10;
 
-- Facturas
-- Listar el total facturado agrupado por ciudad.
SELECT SUM(idf.precio_unitario*idf.cantidad) total_facturado, f.ciudad_de_facturacion 
FROM items_de_facturas idf 
JOIN facturas f
ON idf.id_factura = f.id
GROUP BY f.ciudad_de_facturacion;

-- Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
SELECT SUM(idf.precio_unitario*idf.cantidad) total_facturado, f.ciudad_de_facturacion ciudad
FROM items_de_facturas idf 
JOIN facturas f
ON idf.id_factura = f.id
WHERE f.pais_de_facturacion LIKE 'Canada'
GROUP BY f.ciudad_de_facturacion;
-- Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
SELECT SUM(idf.precio_unitario*idf.cantidad) total_facturado, f.ciudad_de_facturacion ciudad
FROM items_de_facturas idf 
JOIN facturas f
ON idf.id_factura = f.id
GROUP BY f.ciudad_de_facturacion
HAVING total_facturado > 38;

-- Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
SELECT SUM(idf.precio_unitario*idf.cantidad) total_facturado,f.pais_de_facturacion, f.ciudad_de_facturacion
FROM items_de_facturas idf 
JOIN facturas f
ON idf.id_factura = f.id
GROUP BY f.pais_de_facturacion, f.ciudad_de_facturacion
ORDER BY f.pais_de_facturacion, f.ciudad_de_facturacion;

-- Canciones / Géneros
-- Listar la duración mínima, máxima y promedio de las canciones.
SELECT MIN(milisegundos) duracion_minima, MAX(milisegundos) duracion_maxima, AVG(milisegundos) duracion_promedio
FROM canciones;

-- Modificar el punto (a) mostrando la información agrupada por género.
SELECT g.nombre,
MIN(milisegundos) duracion_minima, 
MAX(milisegundos) duracion_maxima, 
AVG(milisegundos) duracion_promedio
FROM canciones c
JOIN generos g 
ON c.id_genero = g.id
GROUP BY g.nombre;
#Funciones de agregación, GROUP BY y HAVING

-- ¿Cuántas películas hay?
SELECT COUNT(*) AS totalPeliculas FROM movies;
-- ¿Cuántas películas tienen entre 3 y 7 premios?
SELECT COUNT(*) AS totalPelis FROM movies WHERE awards BETWEEN 3 AND 7;
-- ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
SELECT COUNT(*) AS totalPelis FROM movies WHERE awards BETWEEN 3 AND 7 AND rating > 7;
-- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por id. de género.
SELECT genre_id AS Genero, COUNT(*) AS Cantidad FROM movies GROUP BY genre_id ;
-- De la consulta anterior, listar sólo aquellos géneros que tengan como suma de premios un número mayor a 5.
SELECT genre_id AS Genero, COUNT(*) AS Cantidad FROM movies GROUP BY genre_id HAVING SUM(awards) > 5;
-- Encuentra las películas que tienen un promedio de calificación mayor a 6.0.
SELECT COUNT(*) AS Peliculas FROM movies WHERE (rating) > 6;
-- Encuentra los géneros que tienen al menos 3 películas.
SELECT genre_id AS Genero, COUNT(*) AS Cantidad FROM movies GROUP BY genre_id HAVING Cantidad > 3;

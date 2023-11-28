#Ejercitación consultas - Bases de datos
#Desafio extra - Join

#Reportes - JOINS
#Consignas: 
SELECT * FROM artista;
SELECT * FROM pelicula p
JOIN artista_x_pelicula ap
ON p.id = ap.pelicula_id
JOIN artista a
ON ap.artista_id = a.id;
-- Obtener los artistas que han actuado en una o más películas.
SELECT * 
FROM artista a
LEFT JOIN artista_x_pelicula ap
ON a.id = ap.artista_id
WHERE pelicula_id IS NOT NULL;

-- Obtener las películas donde han participado más de un artista según nuestra base de datos. 
SELECT *, COUNT(ap.artista_id) cantidad_artistas
FROM pelicula p
RIGHT JOIN artista_x_pelicula ap
ON p.id = ap.pelicula_id
GROUP BY p.titulo;

-- Obtener aquellos artistas que han actuado en alguna película, incluso aquellos que aún no lo han hecho, 
-- según nuestra base de datos.
SELECT * 
FROM artista a
LEFT JOIN artista_x_pelicula ap
ON a.id = ap.artista_id;

-- Obtener las películas que no se le han asignado artistas en nuestra base de datos.
SELECT * 
FROM pelicula p
LEFT JOIN artista_x_pelicula ap
ON p.id = ap.pelicula_id
WHERE ap.artista_id IS NULL;

-- Obtener aquellos artistas que no han actuado en alguna película, según nuestra base de datos.
SELECT * 
FROM artista a
LEFT JOIN artista_x_pelicula ap
ON a.id = ap.artista_id
WHERE ap.pelicula_id IS NULL;

-- Obtener aquellos artistas que han actuado en dos o más películas según nuestra base de datos.
SELECT *, COUNT(ap.pelicula_id) cantidad_peliculas
FROM artista a
LEFT JOIN artista_x_pelicula ap
ON a.id = ap.pelicula_id
GROUP BY a.id
HAVING cantidad_peliculas >= 2;

-- Obtener aquellas películas que tengan asignado uno o más artistas, incluso aquellas que aún no le han 
-- asignado un artista en nuestra base de datos.
SELECT * 
FROM pelicula p
LEFT JOIN artista_x_pelicula ap
ON p.id = ap.artista_id;

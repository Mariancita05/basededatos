# Consultas
# JOIN

-- Utilizando la base de datos de movies, queremos conocer, por un lado, 
-- los títulos y el nombre del género de todas las series de la base de datos.
SELECT s.title, g.name 
FROM series AS s 
INNER JOIN genres AS g
ON s.genre_id = g.id;




-- Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT e.title, a.first_name, a.last_name 
FROM episodes AS e 
INNER JOIN actor_episode ae ON e.id = ae.episode_id
INNER JOIN actors AS a ON ae.actor_id = a.id;
-- Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier 
-- película de la saga de La Guerra de las galaxias.
SELECT a.first_name, a.last_name 
FROM actors AS a 
INNER JOIN actor_movie as am 
ON a.id = am.actor_id 
INNER JOIN movies AS m 
ON m.id = am.movie_id 
WHERE m.title like '%La Guerra de las galaxias%';

-- Crear un listado a partir de la tabla de películas, 
-- mostrar un reporte de la cantidad de películas por nombre de género.
SELECT DISTINCT COUNT(*), g.name
FROM movies m
INNER JOIN genres as g ON m.genre_id = g.id
GROUP BY g.name;

#Reportes parte 1:

-- Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar alias para mostrar los nombres de las columnas en español.
SELECT first_name nombre, last_name apellido 
FROM actor;

-- Obtener un listado que incluya nombre, apellido y correo electrónico de los clientes (customers) inactivos. Utilizar alias para mostrar 
-- los nombres de las columnas en español.
SELECT first_name nombre, last_name apellido, email 
FROM customer 
WHERE active = 0;

-- Obtener un listado de films incluyendo título, año y descripción de los films que tienen un rental_duration mayor a cinco. Ordenar por 
-- rental_duration de mayor a menor. Utilizar alias para mostrar los nombres de las columnas en español.
SELECT title Título, release_year AÑO, description Descripción 
FROM film 
WHERE rental_duration > 5  
ORDER BY rental_duration DESC;

-- Obtener un listado de alquileres (rentals) que se hicieron durante el mes de mayo de 2005, incluir en el resultado todas las columnas disponibles.
SELECT * FROM rental
WHERE EXTRACT(year FROM rental_date) = 2005
AND EXTRACT(MONTH FROM rental_date) = 05;
 
#Consignas
#A continuación encontrarás una serie de ejercicios para practicar:

#Where
-- Mostrar el nombre, peso y altura de los pokémon cuyo peso sea mayor a 150.
-- Tablas: pokemon
-- Campos: nombre, peso, altura
SELECT nombre, peso, altura 
FROM pokemon 
WHERE peso > 180;

-- Muestra los nombres y potencias de los movimientos que tienen una precisión mayor 90.
-- Tablas: movimiento, tipo
-- Campos: m.nombre, t.nombre, potencia
SELECT m.nombre, t.nombre, m.potencia 
FROM movimiento m
JOIN tipo t 
ON m.id_tipo = t.id_tipo
WHERE m.precision_mov > 90;

#Operadores & joins
-- Mostrar tipo, nombre y potencia de los movimientos que tienen una potencia mayor igual que 120.
-- Tablas: movimiento, tipo
-- Campos: m.nombre, t.nombre, potencia
SELECT m.nombre AS movimiento, t.nombre AS tipo, m.potencia 
FROM movimiento m 
JOIN tipo t 
ON m.id_tipo = t.id_tipo
WHERE m.potencia >= 120;

-- Muestra los nombres de los tipos de Pokémon junto con sus tipos de ataque correspondientes de aquellos cuya potencia sea igual a 0.
-- Tablas: tipo, tipo_ataque, movimiento
-- Campos: t.nombre ta.tipo m.potencia
SELECT t.nombre, ta.tipo, m.potencia 
FROM tipo t
JOIN movimiento m
ON m.id_tipo = t.id_tipo
JOIN tipo_ataque ta
ON t.id_tipo_ataque = ta.id_tipo_ataque
WHERE m.potencia = 0;

#Order by
-- Muestra los nombres y números de Pokédex de los primeros 10 Pokémon en orden alfabético.
-- Tablas: pokemon
-- Campos: numero_pokedex, nombre
SELECT numero_pokedex, nombre 
FROM pokemon 
ORDER BY nombre
LIMIT 10;

-- Muestra los nombres y alturas de los Pokémon de tipo "Eléctrico", ordenados por altura de forma descendente.
-- Tablas: pokemon, pokemon_tipo, tipo
-- Campos: nombre, altura
SELECT p.nombre, p.altura
FROM pokemon p
JOIN pokemon_tipo pt
ON p.numero_pokedex = pt.numero_pokedex
JOIN tipo t
ON pt.id_tipo = t.id_tipo
WHERE t.nombre LIKE '%Electrico%'
ORDER BY p.altura DESC;

#Funciones de agregación
-- ¿Cuál es la suma total de los valores de "Defensa" en todas las estadísticas base?
-- Tablas: estadisticas_base
-- Campos: defensa
SELECT SUM(defensa) defensa FROM estadisticas_base;

-- ¿Cuántos Pokémon tienen el tipo "Fuego"?
	-- Tablas: pokemon_tipo, tipo
-- Campos: *
SELECT COUNT(*) Cantidad
FROM pokemon_tipo pt
JOIN tipo t
ON pt.id_tipo = t.id_tipo
WHERE t.nombre LIKE '%Fuego%';

#Group by
-- Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo.
-- Tablas: pokemon_tipo, tipo
-- Campos: nombre, numero_pokedex
SELECT t.nombre, COUNT(*) cantidad 
FROM pokemon_tipo pt
JOIN tipo t
ON pt.id_tipo = t.id_tipo
GROUP BY t.nombre;

-- Muestra los nombres de los tipos de Pokémon junto con el promedio de peso de los Pokémon de cada tipo. Ordena los resultados de manera descendente según el promedio de peso.
-- Tablas: pokemon, pokemon_tipo, tipo
-- Campos: t.nombre, p.peso
SELECT t.nombre, ROUND(AVG(p.peso),2) promedio_peso
FROM pokemon p
JOIN pokemon_tipo pt
ON p.numero_pokedex = pt.numero_pokedex
JOIN tipo t
ON pt.id_tipo = t.id_tipo
GROUP BY t.nombre
ORDER BY AVG(p.peso) DESC;

#Having
-- Muestra los nombres de los Pokémon que tienen más de un tipo.
-- Tablas: pokemon, pokemon_tipo
-- Campos: nombre
SELECT p.nombre
FROM pokemon p
JOIN pokemon_tipo pt
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY pt.id_tipo
HAVING pt.id_tipo > 1;

-- Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen un peso 
-- promedio mayor a 10.
-- Tablas: pokemon, pokemon_tipo, tipo
-- Campos: nombre, numero_pokedex
SELECT t.nombre, p.numero_pokedex
FROM pokemon p
JOIN pokemon_tipo pt
ON p.numero_pokedex = pt.numero_pokedex
JOIN tipo t
ON pt.id_tipo = t.id_tipo
GROUP BY t.nombre
HAVING AVG(p.peso) > 10;

#Funciones de alteración
-- Muestra los nombres de los movimientos de tipo de ataque "Especial" con una potencia superior a 10 y una 
-- descripción que contenga al menos 20 palabras.
-- Tablas: movimiento, tipo_ataque
-- Campos: nombre, potencia, tipo, descripcion
SELECT * FROM movimiento m JOIN tipo t
ON m.id_tipo = t.id_tipo;
SELECT m.nombre
FROM movimiento m
JOIN tipo t
ON m.id_tipo = t.id_tipo
JOIN tipo_ataque ta
ON t.id_tipo_ataque = ta.id_tipo_ataque
WHERE m.nombre LIKE '%Especial%' AND m.potencia > 10 AND LENGTH(REPLACE(m.descripcion, ' ', '')) + 1 >= 20;

-- -- 	Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen una 
-- velocidad promedio superior a 80. Solo incluye tipos que tienen al menos 3 Pokémon con esas características.
-- 	Tablas: tipo, pokemon_tipo, estadisticas_base
-- Campos: t.nombre, *
SELECT t.nombre, COUNT(*) cantidad 
FROM tipo t
JOIN pokemon_tipo pt
ON t.id_tipo = pt.id_tipo
JOIN pokemon p
ON p.numero_pokedex = pt.numero_pokedex
JOIN estadisticas_base eb
ON p.numero_pokedex = eb.numero_pokedex
GROUP BY t.nombre
HAVING AVG(eb.velocidad) > 80 AND COUNT(*) > 3;

#Registros
-- Muestra el nombre de cada Pokémon junto con su tipo, velocidad base y puntos de salud (PS) base. Ordena los 
-- resultados por la velocidad base de forma descendente.
-- 	Tablas: pokemon, estadisticas_base, pokemon_tipo, tipo
-- Campos: p.nombre, t.nombre, eb.velocidad, eb.ps
SELECT p.nombre pokemon, t.nombre tipo, eb.velocidad, eb.ps puntos_salud
FROM pokemon p
JOIN pokemon_tipo pt
ON p.numero_pokedex = pt.numero_pokedex
JOIN tipo t
ON pt.id_tipo = t.id_tipo
JOIN estadisticas_base eb
ON p.numero_pokedex = eb.numero_pokedex
ORDER BY eb.velocidad DESC;

-- Muestra los nombres de los movimientos de tipo "Agua" junto con los nombres de los Pokémon que pueden aprenderlos 
-- y el peso promedio de estos Pokémon.
-- 	Tablas: movimiento, tipo_ataque, pokemon_tipo, tipo, pokemon
-- Campos: m.nombre, p.nombre, peso
SELECT * FROM movimiento;
SELECT m.nombre movimiento, p.nombre pokemon, p.peso
FROM pokemon p
JOIN pokemon_tipo pt
ON p.numero_pokedex = pt.numero_pokedex
JOIN tipo t
ON pt.id_tipo = t.id_tipo
JOIN movimiento m
ON t.id_tipo = m.id_tipo
JOIN tipo_ataque ta
ON t.id_tipo_ataque = ta.id_tipo_ataque
WHERE m.nombre LIKE '%agua%';






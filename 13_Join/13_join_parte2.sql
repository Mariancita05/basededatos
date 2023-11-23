#Reportes parte 2: Sumemos complejidad

-- Si llegamos hasta acá, tenemos en claro la estructura básica de un
-- SELECT. En los siguientes reportes vamos a sumar complejidad.
-- ¿Probamos?

-- Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada cantidad.
SELECT COUNT(*) cantidad FROM rental;

-- Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para mostrarlo en una columna llamada total, junto a una 
-- columna con la cantidad de alquileres con el alias Cantidad y una columna que indique el Importe promedio por alquiler.
SELECT SUM(amount) TOTAL, COUNT(rental_id) cantidad, AVG(rental_id) importe_promedio FROM payment;

-- Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuántos alquileres lo hacen?

-- Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto total para todos los clientes que hayan gastado más de 
-- 150 dólares en alquileres.

-- Generar un reporte que muestre por mes de alquiler (rental_date de tabla rental), la cantidad de alquileres y la suma total pagada 
-- (amount de tabla payment) para el año de alquiler 2005 (rental_date de tabla rental).

-- Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios más alquilados? (columna inventory_id en la tabla rental). 
-- Para cada una de ellas indicar la cantidad de alquileres.

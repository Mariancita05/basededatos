#¡Extras!
#¿Te sobró tiempo? ¿Querés seguir practicando?
#Te dejamos unos ejercicios extras a partir de la misma base:

-- Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”.
SELECT * FROM clientes WHERE pais = 'Brazil' OR 'Mexico' OR titulo LIKE 'Sales%'; 
-- Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".
SELECT * FROM clientes WHERE compania Like 'A%';
-- Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, 
-- de todos los clientes que sean de la ciudad "Madrid".
SELECT ciudad, contacto AS ApellidoYNombre, titulo AS Puesto FROM clientes WHERE ciudad = 'Madrid';
-- Obtener un listado de todas las facturas con ID entre 10000 y 10500
SELECT * FROM facturas WHERE FacturaID BETWEEN 10000 AND 10500;
-- Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.
SELECT * FROM facturas WHERE FacturaID BETWEEN 10000 AND 10500 OR ClienteID LIKE 'b%';
-- ¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?
SELECT * FROM facturas WHERE CiudadEnvio = 'Vancouver' OR EnvioVia = 3; -- Sí
-- ¿Cuál es el ID de empleado de “Buchanan”?
SELECT * FROM empleados WHERE Apellido = 'Buchanan'; -- 5
-- ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)
SELECT * FROM facturas WHERE EmpleadoID = 5;

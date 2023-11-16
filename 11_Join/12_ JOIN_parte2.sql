# Consultas queries XL parte II - JOIN
# En esta segunda parte vamos a intensificar la práctica de consultas con JOIN.
# Tip:
# Recuerda hacer la ingeniería inversa a la base de datos para tener una mejor guía de las relaciones entre tablas.

-- Generar un listado de todas las facturas del empleado 'Buchanan'. 
SELECT f.facturaID 
FROM empleados e 
JOIN facturas f 
ON e.empleadoID = f.empleadoID  
WHERE e.apellido LIKE '%Buchanan%';

-- Generar un listado con todos los campos de las facturas del correo 'Speedy Express'.
SELECT * 
FROM facturadetalle fd 
JOIN facturas f
ON fd.FacturaID = f.FacturaID 
JOIN correos c 
ON f.EnvioVia = c.CorreoID
WHERE c.Compania LIKE 'Speedy Express';


-- Generar un listado de todas las facturas con el nombre y apellido de los empleados.
-- Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.
-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto id = “42”.
-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” y que incluya los producto id = “80” o ”42”.
-- Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad).
-- Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío, Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas.


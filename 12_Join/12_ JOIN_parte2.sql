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
SELECT e.nombre, e.apellido, fd.facturaID 
FROM facturadetalle fd 
JOIN facturas f 
ON fd.facturaID = f.facturaID 
JOIN empleados e 
ON f.empleadoID = e.empleadoID;

-- Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.
SELECT * 
FROM facturadetalle fd 
JOIN facturas f 
ON fd.facturaID = f.facturaID 
JOIN clientes c 
ON f.clienteID = c.clienteID
WHERE c.titulo 
LIKE 'Owner' 
AND c.pais 
LIKE 'USA';

-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto 
-- id = “42”.
SELECT *
FROM empleados e
JOIN facturas f ON e.empleadoID = f.empleadoID
JOIN facturadetalle fd ON f.facturaID = fd.facturaID
JOIN productos p ON fd.productoID = p.productoID
WHERE e.apellido = 'Leverling' OR p.productoID = 42;

-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” y que incluya los producto 
-- id = “80” o ”42”.
SELECT *
FROM empleados e
JOIN facturas f ON e.empleadoID = f.empleadoID
JOIN facturadetalle fd ON f.facturaID = fd.facturaID
JOIN productos p ON fd.productoID = p.productoID
WHERE e.apellido = 'Leverling' AND p.productoID = 42 OR p.productoID = 80;

-- Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad).
SELECT c.clienteID, SUM(fd.PrecioUnitario * fd.Cantidad) 
FROM clientes c
JOIN facturas f ON c.clienteID = f.clienteID
JOIN facturadetalle fd ON f.facturaID = fd.facturaID
GROUP BY c.clienteID 
ORDER BY SUM(fd.PrecioUnitario * fd.Cantidad) DESC
LIMIT 5;

-- Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío, 
-- Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas.
SELECT f.facturaID, c.contacto, f.fechaFactura, f.paisEnvio, SUM(fd.PrecioUnitario * fd.Cantidad)
FROM clientes c JOIN facturas f ON c.clienteID = f.clienteID
JOIN facturadetalle fd ON f.facturaID = fd.facturaID
GROUP BY f.fechaFactura
ORDER BY f.fechaFactura DESC
LIMIT 10;


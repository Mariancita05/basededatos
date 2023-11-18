# Consultas queries XL parte I - GROUP BY
# Vamos a practicar sobre consultas SELECT, enfocándonos en group by, having y distinct.
# Tips:
# Cada enunciado se corresponde con una consulta SELECT.
# Recordá ir guardando las consultas. SQL.

-- Consignas
-- Clientes
-- ¿Cuántos clientes existen?
SELECT COUNT(*) cantidad_clientes 
FROM clientes;

-- ¿Cuántos clientes hay por ciudad?
SELECT COUNT(*) cantidad_clientes, ciudad 
FROM clientes 
GROUP BY ciudad;

-- Facturas
-- ¿Cuál es el total de transporte?
SELECT SUM(Transporte) total_transporte 
FROM facturas;

-- ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT SUM(Transporte), EnvioVia empresa_envio 
FROM facturas 
GROUP BY EnvioVia;

-- Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
SELECT COUNT(FacturaID) cantidad_facturas, clienteId cliente 
FROM facturas 
GROUP BY ClienteID 
ORDER BY COUNT(FacturaID) DESC;

-- Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
SELECT COUNT(FacturaID) cantidad_facturas, clienteId cliente 
FROM facturas 
GROUP BY ClienteID 
ORDER BY COUNT(FacturaID) DESC 
LIMIT 5;

-- ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
SELECT COUNT(FacturaID) cantidad_facturas, PaisEnvio 
FROM facturas 
GROUP BY PaisEnvio 
ORDER BY COUNT(FacturaID) ASC 
LIMIT 1;

-- Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?
SELECT COUNT(FacturaID) cantidad_facturas, EmpleadoID 
FROM facturas 
GROUP BY 
EmpleadoID 
ORDER BY COUNT(FacturaID) DESC 
LIMIT 1;

-- Factura detalle
-- ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
SELECT COUNT(FacturaID), productoID 
FROM facturadetalle 
GROUP BY ProductoID 
ORDER BY COUNT(FacturaID) DESC 
LIMIT 1;

-- ¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
SELECT SUM(precioUnitario*cantidad) total_facturado 
FROM facturadetalle;

-- ¿Cuál es el total facturado para los productos ID entre 30 y 50?
SELECT SUM(precioUnitario*cantidad) total_facturado 
FROM facturadetalle 
WHERE ProductoID 
BETWEEN 30 and 50;

-- ¿Cuál es el precio unitario promedio de cada producto?
SELECT AVG(precioUnitario), ProductoID 
FROM facturadetalle
GROUP BY ProductoID;

-- ¿Cuál es el precio unitario máximo?
SELECT DISTINCT precioUnitario
FROM facturadetalle
ORDER BY PrecioUnitario desc
LIMIT 1;
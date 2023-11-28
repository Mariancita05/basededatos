#Reportes parte II - INNER, LEFT Y RIGHT JOIN

-- Listar todas las categorías junto con información de sus productos. Incluir todas las categorías aunque no tengan productos.
SELECT * 
FROM categorias c
LEFT JOIN productos p
ON c.CategoriaID = p.CategoriaID;

-- Listar la información de contacto de los clientes que no hayan comprado nunca en emarket.
SELECT * 
FROM clientes c
LEFT JOIN facturas f
ON c.ClienteID = f.ClienteID
WHERE f.FacturaID IS NULL;

-- Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y la información de contacto de su proveedor. 
-- Tener en cuenta que puede haber productos para los cuales no se indicó quién es el proveedor.
SELECT p.ProductoNombre, cat.CategoriaNombre, pr.*
FROM productos p
JOIN categorias cat
ON p.CategoriaID = cat.CategoriaID
LEFT JOIN proveedores pr
ON p.ProveedorID = pr.ProveedorID;

-- Para cada categoría listar el promedio del precio unitario de sus productos.
SELECT  cat.CategoriaNombre, ROUND(AVG(p.PrecioUnitario),2) promedio_precio
FROM productos productos
JOIN categorias categorias 
ON p.CategoriaID = cat.CategoriaID
GROUP BY cat.CategoriaNombre;

-- Para cada cliente, indicar la última factura de compra. Incluir a los clientes que nunca hayan comprado en e-market.
SELECT c.contacto, MAX(f.FechaFactura) ultima_factura
FROM clientes c JOIN facturas f
ON f.ClienteID = c.clienteID
GROUP BY c.contacto;

-- Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un listado con todas las empresas de 
-- correo, y la cantidad de facturas correspondientes. Realizar la consulta utilizando RIGHT JOIN.
SELECT c.Compania, COUNT(f.facturaID) cantidad_facturas
FROM facturas f
RIGHT JOIN correos c
ON c.CorreoID = f.EnvioVia
GROUP BY c.Compania;
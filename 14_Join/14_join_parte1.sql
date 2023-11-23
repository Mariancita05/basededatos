#Reportes parte I - Repasamos INNER JOIN
#Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
-- Id de la factura
-- fecha de la factura
-- nombre de la empresa de correo
-- nombre del cliente
-- categoría del producto vendido
-- nombre del producto
-- precio unitario
-- cantidad
SELECT f.FacturaID ID_Factura, 
f.fechaFactura Fecha_factrura, 
c.compania Empresa_Correo, 
cl.contacto Cliente, 
cat.categoriaID categoria_producto,
p.ProductoNombre nombre_producto,
fd.PrecioUnitario precio_unitario,
fd.Cantidad cantidad
FROM correos c
JOIN facturas f
ON f.EnvioVia = c.CorreoID
JOIN clientes cl
ON f.ClienteID = cl.ClienteID
JOIN facturadetalle fd 
ON f.facturaID = fd.FacturaID
JOIN productos p
ON fd.ProductoID = p.ProductoID
JOIN categorias cat
ON p.CategoriaID = cat.CategoriaID;
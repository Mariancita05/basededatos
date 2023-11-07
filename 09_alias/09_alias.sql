
# Consultas queries ML - Parte I
# Vamos a practicar sobre consultas SELECT, enfocándonos en SELECT, WHERE, operadores de condición como AND, OR, BETWEEN, LIKE, IN, entre otros.


#Categorías y productos
-- Queremos tener un listado de todas las categorías.
SELECT * FROM categorias;
-- Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
SELECT CategoriaNombre, Descripcion FROM categorias;
-- Obtener un listado de los productos.
SELECT * FROM productos;
-- ¿Existen productos discontinuados? (Discontinuado = 1).
SELECT discontinuado FROM productos WHERE discontinuado >= 1;
-- Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
SELECT ProductoNombre FROM productos WHERE ProveedorID = 8;
-- Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT ProductoNombre FROM productos WHERE PrecioUnitario BETWEEN 10 AND 22;
-- Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. 
-- ¿Hay productos por solicitar?
SELECT ProductoNombre, UnidadesStock, NivelReorden, UnidadesPedidas FROM productos WHERE UnidadesStock < NivelReorden;
-- Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.
SELECT ProductoNombre, UnidadesStock, NivelReorden, UnidadesPedidas FROM productos WHERE UnidadesStock < NivelReorden AND UnidadesPedidas = 0;

# Clientes
-- Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT * FROM clientes WHERE contacto is not null AND Compania is not null AND titulo is not null and pais is not null ORDER BY pais;
-- Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT ClienteID, titulo FROM clientes WHERE titulo LIKE '%owner%';
-- El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. 
-- ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT ClienteID, contacto FROM clientes WHERE contacto LIKE 'c%';

# Facturas
-- Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT * FROM facturas ORDER BY FechaFactura ASC;
-- Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
SELECT * FROM facturas WHERE PaisEnvio = 'USA' AND EnvioVia != 3;
-- ¿El cliente 'GOURL' realizó algún pedido?
SELECT * FROM facturas WHERE ClienteID LIKE '%gourl%';
-- Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT * FROM facturas WHERE EmpleadoID IN (2, 3, 5, 8, 9);

# En esta segunda parte vamos a intensificar la práctica de consultas SELECT, añadiendo ALIAS, LIMIT y OFFSET.
# Productos
-- Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
SELECT * FROM productos ORDER BY PrecioUnitario DESC;
-- Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
SELECT * FROM productos ORDER BY PrecioUnitario DESC LIMIT 5;
-- Obtener un top 10 de los productos con más unidades en stock.
SELECT * FROM productos ORDER BY UnidadesStock DESC LIMIT 10;

# FacturaDetalle
-- Obtener un listado de FacturaID, ProductoID, Cantidad.
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle;
-- Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle ORDER BY Cantidad DESC;
-- Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle WHERE Cantidad BETWEEN 50 AND 100; 
-- En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: 
-- NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).
SELECT FacturaID AS NroFactura, ProductoID AS Producto, PrecioUnitario*Cantidad AS Total FROM facturadetalle;








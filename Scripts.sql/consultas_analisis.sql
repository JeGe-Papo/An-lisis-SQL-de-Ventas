------------Ventas Totales y Rendimiento 
SELECT SUM(Cantidad * Precio) AS Total_Ventas_Global
FROM Ventas
JOIN Productos USING (ProductoID);

-------------El Top 10 de Productos Más Vendidos


SELECT
    Producto,
    Categoria,
    SUM(Cantidad) AS Unidades_Vendidas,
    SUM(Cantidad * Precio) AS Total_Facturado
FROM Ventas
JOIN Productos USING (ProductoID)
GROUP BY Producto, Categoria
ORDER BY Unidades_Vendidas DESC
LIMIT 10;

-----------Rendimiento por Ciudades (Mercado Regional)

SELECT
    Ciudad,
    SUM(Cantidad) AS Total_Unidades,
    SUM(Cantidad * Precio) AS Total_Ingresos
FROM Ventas
JOIN Clientes USING (ClienteID)
JOIN Productos USING (ProductoID)
GROUP BY Ciudad
ORDER BY Total_Ingresos DESC;

-----Comportamiento por Segmento de Cliente

SELECT
    Segmento,
    COUNT(DISTINCT ClienteID) AS Cantidad_Clientes,
    SUM(Cantidad * Precio) AS Total_Ventas
FROM Ventas
JOIN Clientes USING (ClienteID)
JOIN Productos USING (ProductoID)
GROUP BY Segmento
ORDER BY Total_Ventas DESC;

---Evolución Mensual de Ventas (Tendencia Temporal)

SELECT
    EXTRACT(YEAR FROM Fecha) AS Anio,
    EXTRACT(MONTH FROM Fecha) AS Mes,
    SUM(Cantidad * Precio) AS Ventas_Mensuales
FROM Ventas
JOIN Productos USING (ProductoID)
GROUP BY Anio, Mes
ORDER BY Anio DESC, Mes ASC;

-- 1. Corregir ciudades en la tabla Clientes
UPDATE Clientes SET Ciudad = 'Medellín' WHERE Ciudad LIKE 'Medell%';
UPDATE Clientes SET Ciudad = 'Bogotá' WHERE Ciudad LIKE 'Bogot%';

-- 2. Corregir productos en la tabla Productos
UPDATE Productos SET Producto = 'Silla Ergonómica' WHERE Producto LIKE 'Silla Ergon%';
UPDATE Productos SET Producto = 'Cargador Carga Rápida' WHERE Producto LIKE 'Cargador Carga R%';
UPDATE Productos SET Producto = 'Portátil Asus' WHERE Producto LIKE 'Port%';

-- 3. Corregir categorías en la tabla Productos
UPDATE Productos SET Categoria = 'Tecnología' WHERE Categoria LIKE 'Tecnolog%';

-- Verificar que todo quedó limpio
SELECT * FROM Clientes WHERE Ciudad IN ('Medellín', 'Bogotá') LIMIT 5;
SELECT * FROM Productos LIMIT 10;



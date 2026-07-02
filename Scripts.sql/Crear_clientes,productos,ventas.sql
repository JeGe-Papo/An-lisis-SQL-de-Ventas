CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100),
    Segmento VARCHAR(50)
);

CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY,
    Producto VARCHAR(100),
    Categoria VARCHAR(50),
    Precio DECIMAL(10, 2)
);

CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY,
    Fecha DATE,
    ClienteID INT,
    ProductoID INT,
    Cantidad INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
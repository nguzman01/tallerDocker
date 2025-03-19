-- Crear la base de datos Supermercado (si no se ha creado)
CREATE DATABASE IF NOT EXISTS Supermercado;

-- Usar la base de datos Supermercado
USE Supermercado;

-- Crear la tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    Id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Crear la tabla Productos
CREATE TABLE IF NOT EXISTS Productos (
    Id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- Crear la tabla Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    Id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    Id_usuario INT,
    fecha TIMESTAMP,
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario)
);

-- Crear la tabla DetallesPedido
CREATE TABLE IF NOT EXISTS DetallesPedido (
    Id_detallepedido INT AUTO_INCREMENT PRIMARY KEY,
    Id_pedido INT,
    Id_producto INT,
    cantidad INT,
    FOREIGN KEY (Id_pedido) REFERENCES Pedidos(Id_pedido),
    FOREIGN KEY (Id_producto) REFERENCES Productos(Id_producto)
);

-- Crear la tabla Categorías
CREATE TABLE IF NOT EXISTS Categorias (
    Id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Insertar 50 datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, email) VALUES
('Juan Perez', 'juan@example.com'),
('Maria Lopez', 'maria@example.com'),
('Carlos Martinez', 'carlos@example.com'),
('Ana Gómez', 'ana@example.com'),
('Pedro Sánchez', 'pedro@example.com'),
('Laura García', 'laura@example.com'),
('Luis Fernández', 'luis@example.com'),
('Pablo Torres', 'pablo@example.com'),
('Sofia Ruiz', 'sofia@example.com'),
('Marta Diaz', 'marta@example.com'),
('...','...');  -- Continúa con los demás datos

-- Insertar 50 datos en la tabla Productos
INSERT INTO Productos (nombre, precio) VALUES
('Leche', 1.25),
('Pan', 0.85),
('Huevos', 2.10),
('Arroz', 1.50),
('Tomates', 0.99),
('Papas', 1.20),
('Lechuga', 1.05),
('Pechuga de Pollo', 3.50),
('Carne de Res', 5.75),
('Manzanas', 1.80),
('...','...');  -- Continúa con los demás datos

-- Insertar 50 datos en la tabla Pedidos
INSERT INTO Pedidos (Id_usuario, fecha) VALUES
(1, '2025-03-18 10:30:00'),
(2, '2025-03-18 11:00:00'),
(3, '2025-03-18 11:15:00'),
(4, '2025-03-18 12:00:00'),
(5, '2025-03-18 12:45:00'),
('...','...');  -- Continúa con los demás datos

-- Insertar 50 datos en la tabla DetallesPedido
INSERT INTO DetallesPedido (Id_pedido, Id_producto, cantidad) VALUES
(1, 1, 2),  -- Pedido 1, Producto 1, cantidad 2
(1, 2, 1),
(2, 3, 3),
(3, 4, 2),
(4, 5, 4),
('...','...');  -- Continúa con los demás datos

-- Insertar 50 datos en la tabla Categorías
INSERT INTO Categorias (nombre) VALUES
('Lácteos'),
('Panadería'),
('Carnes'),
('Verduras'),
('Frutas'),
('Bebidas'),
('Golosinas'),
('Congelados'),
('Snacks'),
('Higiene'),
('...','...');  -- Continúa con los demás datos

-- Consultas solicitadas

-- Actualizar (UPDATE)
UPDATE Productos SET precio = 1.10 WHERE nombre = 'Pan';

-- Borrar (DELETE)
DELETE FROM Productos WHERE nombre = 'Leche';

-- INNER JOIN (unir tablas con registros que tienen coincidencias)
SELECT p.nombre, u.nombre, d.cantidad
FROM Pedidos p
JOIN DetallesPedido d ON p.Id_pedido = d.Id_pedido
JOIN Usuarios u ON p.Id_usuario = u.Id_usuario;

-- LEFT JOIN (unir tablas mostrando todos los registros de la tabla izquierda)
SELECT p.nombre, u.nombre, d.cantidad
FROM Pedidos p
LEFT JOIN DetallesPedido d ON p.Id_pedido = d.Id_pedido
LEFT JOIN Usuarios u ON p.Id_usuario = u.Id_usuario;

-- RIGHT JOIN (unir tablas mostrando todos los registros de la tabla derecha)
SELECT p.nombre, u.nombre, d.cantidad
FROM Pedidos p
RIGHT JOIN DetallesPedido d ON p.Id_pedido = d.Id_pedido
RIGHT JOIN Usuarios u ON p.Id_usuario = u.Id_usuario;

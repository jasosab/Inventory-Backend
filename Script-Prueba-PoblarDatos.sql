-- Limpiar tablas
TRUNCATE inventory_exit, inventory_entry, product RESTART IDENTITY CASCADE;

-- Productos
INSERT INTO product (name, description) VALUES 
('Leche Entera', 'Litro - Alpina'),
('Yogurt Fresa', '250ml - Colanta'),
('Queso Campesino', '500g - Alpina'),
('Pan Integral', '500g - Bimbo'),
('Jugo Naranja', '1L - Hit'),
('Manzanas', 'Roja x 6 und'),
('Banano', 'Maduro x 6 und'),
('Pollo', '1Kg - Friko'),
('Carne Res', '500g - Carnes La 14'),
('Huevos', 'Cartón x 30 und');

-- Entradas (vigentes)
INSERT INTO inventory_entry (product_id, quantity, expiration_date) VALUES
(1, 10, CURRENT_DATE + INTERVAL '10 days'),  -- Leche Entera
(2, 15, CURRENT_DATE + INTERVAL '7 days'),
(3, 8,  CURRENT_DATE + INTERVAL '6 days'),
(4, 12, CURRENT_DATE + INTERVAL '5 days'),
(5, 20, CURRENT_DATE + INTERVAL '4 days');

-- Entradas (por vencer - dentro de 3 días)
INSERT INTO inventory_entry (product_id, quantity, expiration_date) VALUES
(6, 10, CURRENT_DATE + INTERVAL '3 days'),
(7, 5, CURRENT_DATE + INTERVAL '2 days');

-- Entradas (vencidas)
INSERT INTO inventory_entry (product_id, quantity, expiration_date) VALUES
(8, 6, CURRENT_DATE - INTERVAL '1 days'),
(9, 10, CURRENT_DATE - INTERVAL '2 days');

-- Producto sin entradas (id 10 - Huevos)

-- Salidas (parciales)
INSERT INTO inventory_exit (product_id, quantity) VALUES 
(1, 3),  -- Leche Entera
(2, 5);  -- Yogurt Fresa

-- Salida exacta
INSERT INTO inventory_exit (product_id, quantity) VALUES 
(6, 10); -- Manzanas

-- Salida mayor (debería fallar si se valida en la app)
-- INSERT INTO inventory_exit (product_id, quantity) VALUES (7, 10);

-- Producto 10 sin entradas ni salidas

-- Producto con múltiples entradas
INSERT INTO inventory_entry (product_id, quantity, expiration_date) VALUES
(1, 5, CURRENT_DATE + I_

-- =====================================
-- 📦 Gestión de Inventario de Perecederos - PostgreSQL Schema
-- =====================================

-- DROP TABLES SI YA EXISTEN
DROP TABLE IF EXISTS inventory_exit;
DROP TABLE IF EXISTS inventory_entry;
DROP TABLE IF EXISTS product;

-- ========================
-- 🛒 Tabla de Productos
-- ========================
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- ========================
-- 📥 Entradas de Inventario
-- ========================
CREATE TABLE inventory_entry (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    expiration_date DATE NOT NULL,
    created_at DATE DEFAULT CURRENT_DATE
);

-- ========================
-- 📤 Salidas de Inventario
-- ========================
CREATE TABLE inventory_exit (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    exit_date DATE DEFAULT CURRENT_DATE
);

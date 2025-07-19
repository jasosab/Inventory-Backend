# 🧠 Decisiones Técnicas - Prueba Técnica Gestión de Inventario

## 🗄️ Motor de Base de Datos

Se utilizó **PostgreSQL** como motor de base de datos relacional por su robustez, soporte a transacciones y facilidad de integración con Spring Boot (JPA/Hibernate).

## 🧩 Modelo de Datos

El modelo incluye las siguientes entidades:

- `product`: Catálogo de productos perecederos
- `inventory_entry`: Registro de entradas al inventario con fechas de caducidad
- `inventory_exit`: Registro de salidas de inventario

## 📦 Backend

- Framework: Spring Boot 3
- Persistencia: JPA (Hibernate)
- Arquitectura: Controladores RESTful + Repositorios
- Lógica de salidas con prioridad FIFO basada en fecha de caducidad

## 🌐 Frontend

- Framework: Vue 3 + TypeScript
- Build tool: Vite
- Módulos principales: Registro de productos, entradas, salidas y visualización del estado del inventario.

## 📄 Archivos incluidos

- `db-schema.sql`: Script para creación de tablas en PostgreSQL
- `README.md`: Instrucciones de ejecución
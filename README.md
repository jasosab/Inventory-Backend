# 📦 Gestión de Inventario de Productos Perecederos

Este proyecto fue desarrollado como parte de una prueba técnica para el cargo de **Ingeniero de Desarrollo**. Consiste en una aplicación completa (backend y frontend) para gestionar el inventario de productos perecederos, sus entradas, salidas, y control de fechas de vencimiento.

---

## 🛠 Tecnologías utilizadas

- **Backend:** Java 17, Spring Boot, JPA, PostgreSQL
- **Frontend:** Vue 3 + TypeScript + Vite
- **Base de datos:** PostgreSQL

---

## 🚀 ¿Cómo ejecutar el proyecto?

### 1. Backend (Spring Boot)

> Requisitos: Java 17+, Maven, PostgreSQL

```bash
cd backend
./mvnw spring-boot:run
```

- URL por defecto: `http://localhost:8080`
- Base de datos: PostgreSQL
- Configuración en `application.properties`

### 2. Frontend (Vue 3)

> Requisitos: Node.js 18+, npm

```bash
cd frontend
npm install
npm run dev
```

- URL por defecto: `http://localhost:5173`

---

## 📋 Funcionalidades

### 🔧 Backend

- Crear productos
- Registrar entradas con cantidad y fecha de caducidad
- Registrar salidas con lógica FIFO
- Listar productos con estado:
  - ✅ Vigente
  - ⚠️ Por vencer (3 días o menos)
  - ❌ Vencido

### 🌐 Frontend

- Crear y visualizar productos
- Formularios para entradas y salidas
- Visualización del estado del inventario
- Búsqueda de productos con agrupación por vencimiento

---

## 🗄 Modelo de Base de Datos

> Motor: **PostgreSQL**

Incluido en el archivo `db-schema.sql`:

- `products (id, name, description)`
- `inventory_entry (id, product_id, quantity, expiration_date)`
- `inventory_exit (id, product_id, quantity, exit_date)`

---

## 📬 Endpoints disponibles (API)

```
POST   /api/products
GET    /api/products
POST   /api/inventory/entries
POST   /api/inventory/exits
GET    /api/inventory
```

---

## 📁 Estructura del Proyecto

```
inventario-perecederos/
│
├── backend/                # Spring Boot API
├── frontend/               # Vue 3 frontend
├── db-schema.sql           # Script de creación de base de datos
├── README.md               # Este archivo
└── DETAILS.md              # Decisiones de arquitectura y mejoras
```

---

## ✅ Validaciones incluidas

- No se permiten cantidades negativas
- No se permiten fechas de caducidad anteriores a la fecha actual
- Lógica FIFO implementada para salidas de inventario
- Cálculo automático del estado por fechas

---

## 🔎 Sugerencias de mejora (ver DETAILS.md)

- Autenticación de usuarios
- Gestión por bodegas
- Soporte para alertas automáticas por vencimientos
- Panel de reportes históricos

---

## 📄 Licencia

Este proyecto es de uso libre con fines demostrativos y educativos.
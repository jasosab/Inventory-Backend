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

🧩 Sugerencias para escalar o mejorar la solución

## 📈 Sugerencias para Escalar o Mejorar la Solución

1. **Autenticación y Autorización**:
   - Implementar autenticación (JWT o OAuth2) para proteger los endpoints y roles como administrador, bodeguero, etc.

2. **Gestión de Usuarios**:
   - Permitir múltiples usuarios con registros de quién realiza entradas/salidas.

3. **Notificaciones por Caducidad**:
   - Agregar alertas automáticas (correo o notificación web) para productos próximos a vencer.

4. **Reportes Avanzados**:
   - Incorporar gráficos (ej. con Chart.js) y reportes exportables (PDF, Excel).

5. **Optimización de Inventario**:
   - Incluir lógica para reposición automática basado en mínimos de inventario.

6. **Multi-bodega**:
   - Escalar el modelo para soportar múltiples bodegas o sucursales, con stock por ubicación.

7. **Historial de Movimientos**:
   - Añadir auditoría detallada de entradas, salidas, usuario y fecha.

8. **Internacionalización (i18n)**:
   - Soporte multilenguaje para expansión global.

9. **Contenedores (Docker)**:
   - Contenerizar la aplicación (frontend y backend) para despliegues más simples y escalables.

10. **CI/CD en GitHub Actions**:
    - Automatizar el testing, build y despliegue al hacer push a ramas principales.

---


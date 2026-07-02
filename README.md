# 📊 Análisis SQL de Ventas | PostgreSQL + Python

## 📌 Descripción

Este proyecto presenta una solución completa de análisis de datos comerciales utilizando **PostgreSQL** y **Python**.

Se construyó una base de datos relacional a partir de archivos CSV, se realizó un proceso de limpieza y carga de datos, y posteriormente se desarrollaron consultas SQL para obtener indicadores estratégicos de negocio.

El análisis comprende **5.000 transacciones de ventas** correspondientes al periodo **2025–2026**.

---

# 🎯 Objetivos

- Diseñar una base de datos relacional.
- Automatizar la carga de datos desde archivos CSV.
- Aplicar consultas SQL para responder preguntas de negocio.
- Identificar tendencias comerciales.
- Generar información para apoyar la toma de decisiones.

---

# 🛠️ Tecnologías Utilizadas

- PostgreSQL
- pgAdmin 4
- Python
- SQL
- CSV

---

# 📂 Estructura del Proyecto

```
SQL-Analisis-Ventas
│
├── data
│   ├── clientes.csv
│   ├── productos.csv
│   └── ventas.csv
│
├── sql
│   ├── crear_tablas.sql
│   ├── insert_clientes.sql
│   ├── insert_productos.sql
│   ├── insert_ventas.sql
│   └── consultas.sql
│
├── imagenes
│
├── Informe_Analisis_SQL_Ventas.docx
│
└── README.md
```

---

# 🏗️ Modelo de Base de Datos

El proyecto utiliza un modelo relacional compuesto por una tabla de hechos y dos tablas de dimensiones.

```
Clientes
     │
     │
     ├─────────────┐
     │             │
     ▼             ▼

            Ventas

     ▲             ▲
     │             │
     └─────────────┤

Productos
```

---

# 🐍 Automatización con Python

Se desarrolló un script para convertir automáticamente los archivos CSV en sentencias SQL.

Durante el proceso se solucionó un problema de codificación (`UnicodeDecodeError`) utilizando la codificación **latin-1**, garantizando la correcta lectura de caracteres especiales como:

- Bogotá
- Medellín
- Tumaco

Los archivos generados fueron:

- insert_clientes.sql
- insert_productos.sql
- insert_ventas.sql

---

# 🔎 Consultas SQL Implementadas

Se realizaron consultas para responder diferentes necesidades del negocio:

- Facturación total.
- Ventas por ciudad.
- Ventas por segmento.
- Top productos.
- Evolución mensual.
- Productos con mayor facturación.
- Cantidad de clientes por segmento.

---

# 📈 Resultados del Análisis

## Facturación Global

**$403.881.000 COP**

---

## Ciudades con Mayor Facturación

| Ciudad | Ingresos |
|---------|---------:|
| Pasto | $81.377.000 |
| Medellín | $77.196.000 |
| Bogotá | $72.383.000 |
| Cali | $66.985.000 |
| Tumaco | $63.629.000 |
| Barranquilla | $42.311.000 |

---

## Segmentos de Clientes

| Segmento | Clientes | Ventas |
|-----------|---------:|-------:|
| Corporativo | 55 | $152.899.000 |
| Consumidor Final | 49 | $130.962.000 |
| Pyme | 46 | $120.020.000 |

---

## Productos Destacados

- 📦 Producto con mayor rotación:
  - Archivador Metal

- 💰 Producto con mayor facturación:
  - Monitor 24"

- 🖥️ Categoría con mayor generación de ingresos:
  - Tecnología

---

## Tendencia Mensual

El análisis permitió identificar un comportamiento estable durante los dos años evaluados.

- Mayor facturación histórica:
  - Enero de 2025

- Mejor mes de 2026:
  - Mayo

---

# 💡 Principales Hallazgos

- El segmento **Corporativo** representa la mayor fuente de ingresos.

- **Pasto** es la ciudad más rentable.

- **Medellín** registra el mayor volumen de unidades vendidas.

- La categoría **Tecnología** concentra los productos con mayor facturación.

- El negocio mantiene estabilidad comercial durante todo el periodo analizado.

---

# 🚀 Posibles Mejoras

- Dashboard en Power BI conectado a PostgreSQL.

- Procedimientos almacenados (Stored Procedures).

- Vistas para reportes ejecutivos.

- Índices para optimizar consultas.

- Pronóstico de ventas mediante Python.

- Análisis ABC de clientes.

---

# 👨‍💻 Autor

**Jaider Enrique Guisamano España**

Estudiante de Ingeniería de Sistemas  
Universidad de Nariño

### Tecnologías

- PostgreSQL
- SQL
- Python
- Power BI
- Excel
- Git
- GitHub

---

⭐ Si este proyecto fue de utilidad, puedes darle una estrella al repositorio.
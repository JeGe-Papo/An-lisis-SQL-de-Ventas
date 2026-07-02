import csv
import psycopg2

# Configuración de tu PostgreSQL
DB_CONFIG = {
    "dbname": "analisis_ventas",
    "user": "postgres",          
    "password": "Tumaco2025",  # <-- PON TU CONTRASEÑA REAL AQUÍ
    "host": "localhost",
    "port": "5432"
}

def ejecutar_migración():
    conn = None
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()
        print("🔌 Conexión exitosa a PostgreSQL.")

        # 1. CLIENTES (Usando cp1252 para leer tildes de Windows perfectamente)
        print("📥 Cargando clientes...")
        with open('data/clientes.csv', 'r', encoding='cp1252') as f:
            reader = csv.reader(f)
            next(reader)
            for row in reader:
                cursor.execute(
                    "INSERT INTO Clientes (ClienteID, Nombre, Ciudad, Segmento) VALUES (%s, %s, %s, %s) ON CONFLICT DO NOTHING;",
                    row
                )

        # 2. PRODUCTOS
        print("📥 Cargando productos...")
        with open('data/productos.csv', 'r', encoding='cp1252') as f:
            reader = csv.reader(f)
            next(reader)
            for row in reader:
                cursor.execute(
                    "INSERT INTO Productos (ProductoID, Producto, Categoria, Precio) VALUES (%s, %s, %s, %s) ON CONFLICT DO NOTHING;",
                    row
                )

        # 3. VENTAS
        print("📥 Cargando 5,000 registros de ventas...")
        with open('data/ventas.csv', 'r', encoding='cp1252') as f:
            reader = csv.reader(f)
            next(reader)
            for row in reader:
                cursor.execute(
                    "INSERT INTO Ventas (VentaID, Fecha, ClienteID, ProductoID, Cantidad) VALUES (%s, %s, %s, %s, %s) ON CONFLICT DO NOTHING;",
                    row
                )

        conn.commit()
        print("🚀 ¡Todo listo! Los datos se han migrado exitosamente de Python a PostgreSQL.")

    except Exception as error:
        print(f"❌ Error durante la migración: {error}")
    finally:
        if conn is not None:
            cursor.close()
            conn.close()
            print("🔌 Conexión cerrada limpiamente.")

if __name__ == "__main__":
    ejecutar_migración()
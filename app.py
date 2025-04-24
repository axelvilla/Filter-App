from flask import Flask, render_template, request
from database import obtener_conexion

app = Flask(__name__)

@app.route('/')
def index():
    buscar = request.args.get('buscar', '')
    region = request.args.get('region', '')
    ordenar = request.args.get('ordenar', 'id')

    campos_validos = ['id', 'nombre', 'cantidad_habitantes']
    if ordenar not in campos_validos:
        ordenar = 'id'

    datos = []
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()

        sql = """
            SELECT 
                provincia.id,
                provincia.nombre,
                provincia.cantidad_habitantes,
                capital.nombre,
                capital.habitantes_capital,
                region.nombre
            FROM provincia
            LEFT JOIN capital ON capital.provincia_id = provincia.id
            JOIN region ON provincia.region_id = region.id
        """
        filtros = []
        valores = []

        if region:
            filtros.append("region.nombre = %s")
            valores.append(region)

        if buscar:
            filtros.append("provincia.nombre LIKE %s")
            valores.append(f"%{buscar}%")

        if filtros:
            sql += " WHERE " + " AND ".join(filtros)

        sql += f" ORDER BY provincia.{ordenar}"

        cursor.execute(sql, valores)
        datos = cursor.fetchall()
        conexion.commit()
    except Exception as e:
        print(f"Error: {e}")
    finally:
        # Solo cerramos cursor y conexion si han sido definidos
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

    return render_template('index.html', datos=datos, buscar=buscar, region=region)


if __name__ == "__main__":
    app.run(debug=True)
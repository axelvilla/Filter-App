import mysql.connector

def obtener_conexion():
    return mysql.connector.connect(
        host='localhost',
        user='', #Poner su usuario
        password='', #Poner su contraseña
        database='provincias'
    )

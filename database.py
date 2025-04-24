import mysql.connector

def obtener_conexion():
    return mysql.connector.connect(
        host='localhost',
        user='root', #Poner su usuario
        password='1234', #Poner su contraseña
        database='provincias'
    )

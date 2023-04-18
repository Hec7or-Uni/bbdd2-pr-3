import json
import random
from datetime import datetime

# Leer los datos del archivo JSON
with open('MANOLO_EMPLEADOS.json', 'r') as archivo:
    datos_empleados = json.load(archivo)

# Generar las sentencias de inserción
salida = open('MANOLO_EMPLEADOS.sql', 'w')
for dato in datos_empleados:
    fecha_dt = datetime.strptime(dato['fechaIncorporacion'], '%d-%m-%Y')
    fechaIncorporacion = fecha_dt.strftime('%m-%d-%Y')
    fecha_dt = datetime.strptime(dato['fechaSalida'], '%d-%m-%Y')
    fechaSalida = fecha_dt.strftime('%m-%d-%Y')
    sentencia = "INSERT INTO empleado (DNI, nombre, genero, salario, fechaIncorporacion, fechaSalida) VALUES ('" + dato['DNI'] + "', '" + dato['nombre'] + "', '" + dato['genero'] + "', " + str(dato['salario']) + ", '" + fechaIncorporacion + "', '" + fechaSalida + "');\n"
    salida.write(sentencia)
salida.close()


# Leer los datos del archivo JSON
with open('MANOLO_REVISTAS.json', 'r') as archivo:
    datos_revistas = json.load(archivo)

# Generar las sentencias de inserción
salida = open('MANOLO_REVISTAS.sql', 'w')
for dato in datos_revistas:
    # Crear la sentencia de inserción
    if "'" in dato['titulo']:
        dato['titulo'] = dato['titulo'].replace("'", "''")
    fecha_dt = datetime.strptime(dato['fechaPublicacion'], '%d-%m-%Y')
    fechaPublicacion = fecha_dt.strftime('%m-%d-%Y')
    sentencia = "INSERT INTO revista (ISSN, titulo, fechaPublicacion, stock) VALUES ('" + dato['ISSN'] + "', '" + dato['titulo'] + "', '" + fechaPublicacion + "', " + str(dato['stock']) + ");\n"
    salida.write(sentencia)
salida.close()

id = 0
num_empleado = 0
salida = open('MANOLO_COMPRA.sql', 'w')
for revista in datos_revistas:
    if num_empleado >= 3:
        num_empleado = 0
    else:
        num_empleado = num_empleado + 1
    empleado = datos_empleados[num_empleado]['DNI']
    ISSN = revista['ISSN']
    fechaCompra = datos_empleados[num_empleado]['fechaIncorporacion']
    fecha_dt = datetime.strptime(fechaCompra, '%d-%m-%Y')
    fechaCompra = fecha_dt.strftime('%m-%d-%Y')
    decimal_aleatorio = round(random.uniform(0, 1), 2)
    entero_aleatorio = random.randint(1, 100)
    precioCompra = decimal_aleatorio + entero_aleatorio
    cantidad = random.randint(1, 100)
    if "'" in revista['titulo']:
        revista['titulo'] = revista['titulo'].replace("'", "''")
    sentencia = "INSERT INTO compra (id, empleado, ISSN, fechaCompra, precioCompra, cantidad) VALUES (" + str(id) + ", '" + empleado + "', '" + ISSN + "', '" + fechaCompra + "', " + str(precioCompra) + ", " + str(cantidad) + ");\n"
    salida.write(sentencia)
    id = id + 1
salida.close

id = 0
num_empleado = 0
salida = open('MANOLO_VENTA.sql', 'w')
for revista in datos_revistas:
    if num_empleado >= 3:
        num_empleado = 0
    else:
        num_empleado = num_empleado + 1
    empleado = datos_empleados[num_empleado]['DNI']
    ISSN = revista['ISSN']
    fechaVenta = datos_empleados[num_empleado]['fechaIncorporacion']
    fecha_dt = datetime.strptime(fechaVenta, '%d-%m-%Y')
    fechaVenta = fecha_dt.strftime('%m-%d-%Y')
    decimal_aleatorio = round(random.uniform(0, 1), 2)
    entero_aleatorio = random.randint(1, 100)
    precioVenta = decimal_aleatorio + entero_aleatorio
    cantidad = random.randint(1, 100)
    if "'" in revista['titulo']:
        revista['titulo'] = revista['titulo'].replace("'", "''")
    sentencia = "INSERT INTO venta (id, empleado, ISSN, fechaVenta, precioVenta, cantidad) VALUES (" + str(id) + ", '" + empleado + "', '" + ISSN + "', '" + fechaVenta + "', " + str(precioVenta) + ", " + str(cantidad) + ");\n"
    salida.write(sentencia)
    id = id + 1
salida.close

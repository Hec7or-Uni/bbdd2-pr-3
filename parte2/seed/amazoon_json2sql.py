import json
import random
from datetime import date, timedelta

# Leer los datos del archivo JSON
with open('AMAZOON_PRODUCTS.json', 'r') as archivo:
    datos_productos = json.load(archivo)
# Generar las sentencias de inserción
salida = open('AMAZOON_PRODUCTS.sql', 'w')
for dato in datos_productos:
    if "'" in dato['title']:
        dato['title'] = dato['title'].replace("'", "''")
    if dato['type'] == "magazine":
        edition = "null"
        author = "null"
    else:
        edition = str(dato['edition'])
        author = dato['author']

    sentencia = "INSERT INTO productos (INTL, title, publicationDate, type, edition, author) VALUES ('" + dato['INTL'] + "', '" + dato['title'] + "', '" + dato['publicationDate'] + "', '" + dato['type'] + "', " + edition + ", '" + author + "');\n"
    salida.write(sentencia)
salida.close()

with open('AMAZOON_CLIENTS.json', 'r') as archivo:
    datos_clientes = json.load(archivo)
# Generar las sentencias de inserción
salida = open('AMAZOON_CLIENTS.sql', 'w')
for dato in datos_clientes:
    dni = dato['DNI'].upper()
    sentencia = "INSERT INTO clients (DNI, name, email, billingAddr) VALUES ('" + dni + "', '" + dato['name'] + "', '" + dato['email'] + "', '" + dato['billingAddr'] + "');\n"
    salida.write(sentencia)
salida.close()

with open('AMAZOON_POS.json', 'r') as archivo:
    datos_pos = json.load(archivo)
# Generar las sentencias de inserción
salida = open('AMAZOON_POS.sql', 'w')
for dato in datos_pos:
    sentencia = "INSERT INTO POS (id, type, address) VALUES (" + str(dato['id']) + ", '" + dato['type'] + "', '" + dato['address'] + "');\n"
    salida.write(sentencia)
salida.close()

id = 0
num_producto = 0
salida = open('AMAZOON_BUYS.sql', 'w')
for cliente in datos_clientes:
    dni = cliente['DNI'].upper()
    if num_producto >= 199:
        num_producto = 0
    else:
        num_producto = num_producto + 1
    intl = datos_productos[num_producto]['INTL']

    
    # Generar una fecha aleatoria entre el 1 de enero de 1900 y la fecha actual
    fecha_min = date(1900, 1, 1)
    fecha_max = date.today()
    dias_diferencia = (fecha_max - fecha_min).days
    fecha_aleatoria = fecha_min + timedelta(days=random.randint(0, dias_diferencia))

    # Formatear la fecha en formato dd-mm-yyyy
    fecha = fecha_aleatoria.strftime('%d-%m-%Y')

    decimal_aleatorio = round(random.uniform(0, 1), 2)
    entero_aleatorio = random.randint(1, 100)
    price = decimal_aleatorio + entero_aleatorio
    shippingAddr = cliente['billingAddr']
    quantity = random.randint(1, 100)
    sentencia = "INSERT INTO buys (DNI, INTL, date, price, shippingAddr, quantity) VALUES ('" + dni + "', '" + intl + "', '" + fecha + "', " + str(price) + ", '" + shippingAddr + "', " + str(quantity) + ");\n"
    salida.write(sentencia)
    id = id + 1
salida.close

id = 0
num_pos = 0
salida = open('AMAZOON_STORES.sql', 'w')
for producto in datos_productos:
    if num_pos >= 2:
        num_pos = 0
    else:
        num_pos = num_pos + 1
    idPos = datos_pos[num_pos]['id']
    intl = producto['INTL']
    quantity = random.randint(20, 1000)
    sentencia = "INSERT INTO stores (idPOS, INTL, quantity) VALUES (" + str(idPos) + ", '" + intl + "', " + str(quantity) + ");\n"
    salida.write(sentencia)
    id = id + 1
salida.close
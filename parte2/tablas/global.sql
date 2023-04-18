CREATE EXTENSION dblink;

SELECT dblink_connect('manolo', 'dbname=manolo host=127.0.0.1 user=postgres password=postgres');
SELECT dblink_connect('amazoon', 'dbname=amazoon host=127.0.0.1 user=postgres password=postgres');

CREATE OR REPLACE VIEW global_clients AS
    SELECT *
    FROM dblink('dbname=amazoon host=127.0.0.1 user=postgres password=postgres',
                'SELECT DNI, name, email, billingAddr FROM clients')
    AS t (DNI VARCHAR(9), name VARCHAR(50), email VARCHAR(255), billingAddr VARCHAR(100));

CREATE OR REPLACE VIEW buys AS
    SELECT *
    FROM dblink('dbname=amazoon host=127.0.0.1 user=postgres password=postgres',
                'SELECT DNI, INTL, date, price, shippingAddr FROM buys')
    AS t (DNI VARCHAR(9), INTL VARCHAR(36), date DATE, price FLOAT, shippingAddr VARCHAR(100));

CREATE OR REPLACE VIEW products AS
    SELECT *
    FROM
    dblink('dbname=amazoon host=127.0.0.1 user=postgres password=postgres',
            'SELECT INTL, title, publicationDate, type, edition, author FROM products')
    AS t1 (INTL VARCHAR(36), title VARCHAR(150), publicationDate DATE, type VARCHAR(8), edition INTEGER, author VARCHAR(100))
    UNION
    SELECT *
    FROM
    dblink('dbname=manolo host=127.0.0.1 user=postgres password=postgres',
            'SELECT ISSN, titulo, fechaPublicacion, NULL::varchar(8) AS type, NULL::integer AS edition, NULL::varchar(100) AS author FROM revista')
    AS t2 (INTL VARCHAR(36), title VARCHAR(150), publicationDate DATE, type VARCHAR(8), edition INTEGER, author VARCHAR(100));


SELECT dblink_exec('insert into POS values(4, ''physical'', ''Maria de Luna 3, Zaragoza, Spain'');');

CREATE OR REPLACE VIEW POS AS
    SELECT *
    FROM
    dblink('dbname=amazoon host=127.0.0.1 user=postgres password=postgres',
    'SELECT id, type, address FROM POS')
    AS t (id INTEGER, type VARCHAR(8), address VARCHAR(100));

CREATE OR REPLACE VIEW worker AS 
    SELECT *
    FROM dblink('dbname=manolo host=127.0.0.1 user=postgres password=postgres',
                'SELECT DNI, nombre, genero, salario, fechaIncorporacion, fechaSalida FROM empleado')
    AS t (DNI VARCHAR(9), name VARCHAR(25), gender VARCHAR(6), salary DECIMAL, startingDate DATE, leavingDate DATE);

CREATE OR REPLACE VIEW sells AS 
    SELECT * 
    FROM dblink('dbname=manolo host=127.0.0.1 user=postgres password=postgres',
                'SELECT id, empleado, ISSN, fechaVenta, precioVenta, cantidad FROM venta')
    AS t (id INTEGER, worker VARCHAR(9), INTL VARCHAR(36), date DATE, price DECIMAL, quantity INTEGER);

CREATE OR REPLACE VIEW stores AS
    SELECT *
    FROM
    dblink('dbname=amazoon host=127.0.0.1 user=postgres password=postgres',
            'SELECT idPos, INTL, quantity FROM stores')
    AS t1 (idPos INTEGER, INTL VARCHAR(36), quantity INTEGER)
    UNION
    SELECT *
    FROM
    dblink('dbname=manolo host=127.0.0.1 user=postgres password=postgres',
            'SELECT 4::integer, ISSN, stock FROM revista')
    AS t2 (idPos INTEGER, INTL VARCHAR(36), quantity INTEGER);

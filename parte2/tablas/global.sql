CREATE EXTENSION dblink;

SELECT dblink_connect('manolo', 'dbname=manolo host=127.0.0.1 user=postgres password=postgres');
SELECT dblink_connect('amazoon', 'dbname=amazoon host=127.0.0.1 user=postgres password=postgres');

CREATE OR REPLACE VIEW global_clients AS
    SELECT *
    FROM dblink('dbname=amazoon host=127.0.0.1 user=postgres password=postgres',
                'SELECT DNI, name, email, billingAddr FROM clients')
    AS t1(DNI VARCHAR(9), name VARCHAR(50), email VARCHAR(255), billingAddr VARCHAR(100));

CREATE OR REPLACE VIEW buys AS
    SELECT *
    FROM dblink('dbname=amazoon host=127.0.0.1 user=postgres password=postgres',
                'SELECT DNI, INTL, date, price, shippingAddr FROM buys')
    AS t1(DNI VARCHAR(9), INTL VARCHAR(36), date DATE, price FLOAT, shippingAddr VARCHAR(100));

CREATE VIEW products AS
    SELECT *
    FROM
    dblink('dbname=amazoon options=-csearch_path=',
            'SELECT INTL, title, publicationDate FROM products')
    UNION
    dblink('dbname=manolo options=-csearch_path=',
            'SELECT ISSN, titulo, fechaPublicacion, stock FROM revistas');

SELECT dblink_exec('insert into POS values(4, ''physical'', ''Maria de Luna 3, Zaragoza, Spain'');');

CREATE VIEW POS AS
    SELECT *
    FROM
    dblink('dbname=amazoon options=-csearch_path=',
    'SELECT id, type, address FROM POS')
    AS t1 (id INTEGER, type VARCHAR(8), address VARCHAR(100));

CREATE VIEW worker AS 
    SELECT *
    FROM dblink('dbname=manolo options=-csearch_path=',
                'SELECT DNI, nombre, genero, salario, fechaIncorporacion, fechaSalida FROM empleado')
    AS t1 (DNI VARCHAR(9), name VARCHAR(25), gender VARHCAR(6), salary DECIMAL, startingDate DATE, leavingDate DATE);

CREATE VIEW sells AS 
    SELECT * 
    FROM dblink('dbname=manolo options=-csearch_path=',
                'SELECT id, empleado, ISSN, fechaVenta, precioVenta, cantidad FROM vende')
    AS t1 (id INTEGER, worker VARCHAR(9), INTL VARCHAR(36), date DATE, price DECIMAL, quantity INTEGER);

CREATE VIEW stores AS
    SELECT *
    FROM
    dblink('dbname=amazoon options=-csearch_path=',
            'SELECT idPos, INTL, quantity FROM storage')
    UNION
    dblink('dbname=manolo options=-csearch_path=',
            'SELECT ISSN, stock FROM revista')
    AS t1 (idPos INTEGER, INTL VARCHAR(255), Quantity INT(11))

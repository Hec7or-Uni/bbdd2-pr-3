CREATE VIEW global_clients AS
    SELECT *
    FROM dblink('dbname=amazoon options=-csearch_path=',
                'SELECT DNI, name, email, billingAddr FROM clients')
    AS t1(DNI VARCHAR(9), name VARCHAR(50), email VARCHAR(255), billingAddr VARCHAR(100));

CREATE VIEW buys AS
    SELECT *
    FROM dblink('dbname=amazoon options=-csearch_path=',
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

SELECT dblink_exec('insert into POS values(''manolo'', ''physical'', ''Maria de Luna 3, Zaagoza, Spain'');');

CREATE VIEW POS AS
    SELECT *
    FROM
    dblink('dbname=amazoon options=-csearch_path=',
    'SELECT id, type, address FROM POS');

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

CREATE VIEW storage AS
    SELECT *
    FROM
    dblink('dbname=amazoon options=-csearch_path=',
            'SELECT idPos, INTL, Quantity FROM storage')
    UNION
    dblink('dbname=manolo options=-csearch_path=',
            'SELECT ISSN, stock FROM revista')
    AS t1 (idPos VARCHAR(255), INTL VARCHAR(255), Quantity INT(11))

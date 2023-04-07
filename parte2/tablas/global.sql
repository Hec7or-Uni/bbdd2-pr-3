CREATE VIEW clients AS (
    SELECT DNI, name, email, billingAddr
    FROM clients;
)
CREATE VIEW POS AS (
    SELECT id, type, address
    FROM POS;
)
CREATE VIEW magazines AS (
    SELECT INTL, title, publicationDate
    FROM magazines;
    -- falta meter la relación sells
)
CREATE VIEW books AS (
    SELECT INTL, title, publicationDate, edition, author
    FROM books;
    -- falta meter la relación sells
)
CREATE VIEW worker AS (
    SELECT DNI, nombre, genero, salario, fechaIncorporacion, fechaSalida
    FROM empleado;
)
CREATE VIEW buys AS (
    SELECT DNI, INTL, date, price, shippingAddr
    FROM buys;
)
CREATE VIEW storage AS (
    SELECT idPos, INTL, Quantity
    FROM storage;
)
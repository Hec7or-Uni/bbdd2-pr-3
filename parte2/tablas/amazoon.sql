CREATE TABLE clients (
  DNI    VARCHAR(9),
  name        VARCHAR(50) NOT NULL,
  email       VARCHAR(255) NOT NULL,
  billingAddr VARCHAR(100) NOT NULL,
  PRIMARY KEY (DNI)
);

CREATE TABLE POS (
  id      VARCHAR(36),
  type    VARCHAR(8)   NOT NULL CHECK (type IN ('online', 'physical')),
  address VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE products (
  INTL              VARCHAR(36),
  title             VARCHAR(150)  NOT NULL,
  publicationDate   DATE          NOT NULL,
  type              VARCHAR(8)    NOT NULL  CHECK(type IN ('magazine', 'book')),
  edition           VARCHAR(255)  NOT NULL,
  author            VARCHAR(255)  NOT NULL,
  PRIMARY KEY (INTL)
);

CREATE TABLE buys (
  DNI                       VARCHAR(255),
  INTL                      VARCHAR(255),
  date                      DATE              NOT NULL,
  price                     FLOAT             NOT NULL,
  shippingAddr              VARCHAR(100)      NOT NULL,
  PRIMARY KEY (DNI, INTL),
  FOREIGN KEY (DNI)         REFERENCES clients (DNI),
  FOREIGN KEY (INTL)        REFERENCES products (INTL)
);

CREATE TABLE stores (
  idPOS     VARCHAR(255),
  INTL      VARCHAR(255),
  Quantity  INT(11) NOT NULL,
  PRIMARY KEY (idPOS, INTL),
  FOREIGN KEY (idPOS) REFERENCES POS (idPOS),
  FOREIGN KEY (INTL)  REFERENCES magazines (INTL)
);

CREATE TABLE clients (
  DNI         VARCHAR(9),
  name        VARCHAR(50) NOT NULL,
  email       VARCHAR(255) NOT NULL,
  billingAddr VARCHAR(100) NOT NULL,
  PRIMARY KEY (DNI)
);

CREATE TABLE POS (
  id      INTEGER,
  type    VARCHAR(8)   NOT NULL CHECK (type IN ('online', 'physical')),
  address VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE products (
  INTL              VARCHAR(36),
  title             VARCHAR(150)  NOT NULL,
  publicationDate   DATE          NOT NULL,
  type              VARCHAR(8)    NOT NULL  CHECK(type IN ('magazine', 'book')),
  edition           VARCHAR(255),
  author            VARCHAR(255),
  PRIMARY KEY (INTL)
);

CREATE TABLE buys (
  DNI                       VARCHAR(255),
  INTL                      VARCHAR(255),
  date                      DATE              NOT NULL,
  price                     FLOAT             NOT NULL,
  shippingAddr              VARCHAR(100)      NOT NULL,
  quantity                  INTEGER           NOT NULL,
  PRIMARY KEY (DNI, INTL, date),
  FOREIGN KEY (DNI)         REFERENCES clients (DNI),
  FOREIGN KEY (INTL)        REFERENCES products (INTL)
);

CREATE TABLE stores (
  idPOS     INTEGER,
  INTL      VARCHAR(255),
  quantity  INTEGER NOT NULL,
  PRIMARY KEY (idPOS, INTL),
  FOREIGN KEY (idPOS) REFERENCES POS (id),
  FOREIGN KEY (INTL)  REFERENCES products (INTL)
);

CREATE TABLE clients (
  idClient    VARCHAR(255),
  name        VARCHAR(255) NOT NULL,
  email       VARCHAR(255) NOT NULL,
  billingAddr VARCHAR(255) NOT NULL,
  PRIMARY KEY (idClient)
);

CREATE TABLE POS (
  idPOS       VARCHAR(255),
  type        VARCHAR(255) NOT NULL,
  address     VARCHAR(255) NOT NULL,
  PRIMARY KEY (idPOS)
);

CREATE TABLE magazines (
  INTL              VARCHAR(255),
  title             VARCHAR(255) NOT NULL,
  publicationDate   DATE NOT NULL,
  PRIMARY KEY (INTL),
);

CREATE TABLE books (
  INTL              VARCHAR(255),
  title             VARCHAR(255) NOT NULL,
  publicationDate   DATE NOT NULL,
  edition           VARCHAR(255) NOT NULL,
  author            VARCHAR(255) NOT NULL,
  PRIMARY KEY (INTL),
);

CREATE TABLE sells (
  idClient  VARCHAR(255),
  INTL      VARCHAR(255),
  PRIMARY KEY (idClient, INTL),
  FOREIGN KEY (idClient)  REFERENCES clients (idClient),
  FOREIGN KEY (INTL)      REFERENCES magazines (INTL)
);

CREATE TABLE storage (
  idPOS     VARCHAR(255),
  INTL      VARCHAR(255),
  Quantity  INT(11) NOT NULL,
  PRIMARY KEY (idPOS, INTL),
  FOREIGN KEY (idPOS) REFERENCES POS (idPOS),
  FOREIGN KEY (INTL)  REFERENCES magazines (INTL)
);

CREATE TABLE revista (
  ISSN              VARCHAR(36),
  titulo            VARCHAR(150)   NOT NULL,
  fechaPublicacion  DATE          NOT NULL,
  stock             INTEGER       NOT NULL,
  PRIMARY KEY (ISSN)
);

CREATE TABLE empleado (
  DNI                 VARCHAR(9),
  nombre              VARCHAR(25) NOT NULL,
  genero              VARCHAR(6)  NOT NULL CHECK(genero = 'Male' OR genero = 'Female'),
  salario             DECIMAL     NOT NULL,
  fechaIncorporacion  DATE        NOT NULL,
  fechaSalida         DATE        NOT NULL,
  PRIMARY KEY (DNI)
);

CREATE TABLE compra (
  id            INTEGER,
  empleado      VARCHAR(9)      NOT NULL,
  ISSN          VARCHAR(36)     NOT NULL,
  fechaCompra   DATE            NOT NULL,
  precioCompra  DECIMAL         NOT NULL,
  cantidad      INTEGER         NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (empleado) REFERENCES empleado(DNI),
  FOREIGN KEY (ISSN) REFERENCES revista(ISSN)
);

CREATE TABLE venta (
  id            INTEGER,
  empleado      VARCHAR(9)      NOT NULL,
  ISSN          VARCHAR(36)     NOT NULL,
  fechaVenta    DATE            NOT NULL,
  precioVenta   DECIMAL         NOT NULL,
  cantidad      INTEGER         NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (empleado) REFERENCES empleado(DNI),
  FOREIGN KEY (ISSN) REFERENCES revista(ISSN)
);

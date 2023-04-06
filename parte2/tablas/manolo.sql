CREATE TABLE revista (
  ISSN              VARCHAR(36),
  titulo            VARCHAR(150)   NOT NULL,
  fechaPublicacion  DATE          NOT NULL,
  precioVenta       DECIMAL,
  fechaVenta        DATE,
  empleadoVenta     VARCHAR(9),
  precioCompra      DECIMAL       NOT NULL,
  fechaCompra       DATE          NOT NULL,
  empleadoCompra    VARCHAR(9)    NOT NULL,
  PRIMARY KEY (ISSN),
  FOREIGN KEY (empleadoVenta) REFERENCES empleado (DNI),
  FOREIGN KEY (empleadoCompra) REFERENCES empleado (DNI)
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

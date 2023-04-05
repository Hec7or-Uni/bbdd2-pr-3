CREATE TABLE revista (
  ISSN              VARCHAR(255),
  titulo            VARCHAR(255)  NOT NULL,
  stock             INT(11)       NOT NULL,
  fechaPublicacion  DATE          NOT NULL,
  precioVenta       NUMBER        NOT NULL,
  fechaVenta        DATE          NOT NULL,
  empleadoVenta     VARCHAR(9)    NOT NULL,
  precioCompra      NUMBER        NOT NULL,
  fechaCompra       DATE          NOT NULL,
  empleadoCompra    VARCHAR(9)    NOT NULL,
  PRIMARY KEY (ISSN),
  FOREIGN KEY (empleadoVenta) REFERENCES empleado (DNI)
  FOREIGN KEY (empleadoCompra) REFERENCES empleado (DNI)
);

CREATE TABLE empleado (
  DNI                 VARCHAR(9),
  nombre              VARCHAR(255)  NOT NULL,
  genero              INT(11)       NOT NULL,
  salario             DATE          NOT NULL,
  fechaIncorporacion  DATE          NOT NULL,
  fechaSalida         DATE          NOT NULL,
  PRIMARY KEY (DNI)
);

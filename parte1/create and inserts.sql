CREATE TABLE CLIENTES (
    DNI             VARCHAR(9)      PRIMARY KEY,
    nombre          VARCHAR(30)     NOT NULL,
    apellido        VARCHAR(30)     NOT NULL,
    email           VARCHAR(75),
    telefono        VARCHAR(15)     NOT NULL,
    fechaNacimiento DATE            NOT NULL ,
    direccion       VARCHAR(50)     NOT NULL,
    edad            INTEGER         NOT NULL
);

INSERT INTO clientes VALUES ('12345678A','Pepito','Grillo','pepito@grillo.com','976-767-676','12-jun-1971','8230 Elmside Center',51);
INSERT INTO clientes VALUES ('35757133A', 'Emanuele','Dawnay','edawnay1@is.gd','408-600-663','15-ago-1977','3 Spohn Alley',45);

CREATE TABLE OFICINAS (
    codigo          INTEGER         PRIMARY KEY,
    telefono        VARCHAR(15)     NOT NULL,
    direccion       VARCHAR(255)    NOT NULL
);

INSERT INTO oficinas VALUES (245, '202-141-948', '7 Anhalt Place');

CREATE TABLE CUENTAS (
    IBAN            VARCHAR(40)     PRIMARY KEY,
    fechaCreacion   TIMESTAMP       NOT NULL,
    saldo           NUMBER          DEFAULT(0),
    tipoCuenta      VARCHAR(9)      NOT NULL,
    interes         DECIMAL(4,3),
    oficina         INTEGER         NULL,
    CHECK (tipoCuenta IN ('AHORRO', 'CORRIENTE')),
    CHECK ((tipoCuenta = 'AHORRO' AND oficina IS NULL AND interes IS NOT NULL) OR (tipoCuenta = 'CORRIENTE' AND oficina IS NOT NULL AND interes IS NULL)),
    FOREIGN KEY (oficina)   REFERENCES oficinas(codigo)
);

INSERT INTO cuentas VALUES ('CH50 5682 234S RJST SUTP Z',TO_DATE('1989-11-11 14:24:42', 'YYYY-MM-DD HH24:MI:SS'),145826.21,'CORRIENTE',NULL,245);
INSERT INTO cuentas VALUES ('FO20 5755 0074 4797 91',TO_DATE('1989-11-11 14:24:42', 'YYYY-MM-DD HH24:MI:SS'),145826.21,'AHORRO',0.566,NULL);

CREATE TABLE OPERACIONES (
    codigo          VARCHAR(36),
    cantidad        NUMBER			NOT NULL,
    timestamp       TIMESTAMP       NOT NULL,
    tipoOp          VARCHAR(13) NOT NULL,
    descripcion     VARCHAR(255),
    cuentaEmisora   VARCHAR(40)		NOT NULL,
    cuentaReceptora VARCHAR(40)		NULL,
    oficina         INTEGER         NULL,
    CHECK ((tipoOp = 'INGRESO' AND cuentaReceptora IS NULL AND oficina IS NOT NULL) OR (tipoOp = 'RETIRADA' AND cuentaReceptora IS NULL AND oficina IS NOT NULL) OR (tipoOp = 'TRANSFERENCIA' AND cuentaReceptora IS NOT NULL AND oficina IS NULL)),
    PRIMARY KEY (codigo),
    FOREIGN KEY (cuentaEmisora)     REFERENCES cuentas(IBAN),
    FOREIGN KEY (cuentaReceptora)   REFERENCES cuentas(IBAN),
    FOREIGN KEY (oficina)           REFERENCES oficinas(codigo)
);

INSERT INTO operaciones VALUES ('1f080ec9-0e73-40cd-ad77-610af91c781e',11.103,TO_DATE('2010-05-04 15:19:45', 'YYYY-MM-DD HH24:MI:SS'),'INGRESO','None','CH50 5682 234S RJST SUTP Z',NULL,245);
INSERT INTO operaciones VALUES ('2f080ec9-0e73-40cd-ad77-610af91c781e',11.103,TO_DATE('2010-05-04 15:19:45', 'YYYY-MM-DD HH24:MI:SS'),'RETIRADA','None','CH50 5682 234S RJST SUTP Z',NULL,245);
INSERT INTO operaciones VALUES ('3f080ec9-0e73-40cd-ad77-610af91c781e',11.103,TO_DATE('2010-05-04 15:19:45', 'YYYY-MM-DD HH24:MI:SS'),'TRANSFERENCIA','None','CH50 5682 234S RJST SUTP Z','FO20 5755 0074 4797 91',NULL);

CREATE TABLE TIENEN (
    DNI     VARCHAR(9),
    IBAN    VARCHAR(40),
    PRIMARY KEY (DNI, IBAN),
    FOREIGN KEY (DNI)       REFERENCES clientes(DNI),
    FOREIGN KEY (IBAN)		REFERENCES cuentas(IBAN)
);

INSERT INTO tienen VALUES ('12345678A','CH50 5682 234S RJST SUTP Z');
INSERT INTO tienen VALUES ('35757133A','FO20 5755 0074 4797 91');

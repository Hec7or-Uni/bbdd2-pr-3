# OFICINAS
COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
----------------------------------------------------------------------------------------------------------------------------------------------------
CODIGO                        NUMBER                                                                                                             22N
DIRECCION                     VARCHAR2                                                                                                           20Y
TELEFONO                      NUMBER                                                                                                             22N
CODIGO                        NUMBER                                                                                                             22N
DIRECCION                     VARCHAR2                                                                                                           20Y
TELEFONO                      NUMBER                                                                                                             22N
CODIGO                        NUMBER                                                                                                             22N
DIRECCION                     VARCHAR2                                                                                                           20Y
TELEFONO                      NUMBER                                                                                                             22N

9 rows selected.

# CUENTAS
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  DNICLIENTE                    VARCHAR2                                                                                                           10Y
  SALDO                         NUMBER                                                                                                             22N
  IBAN                          VARCHAR2                                                                                                           30N
  TIPO                          VARCHAR2                                                                                                           20N
  OFICINA                       NUMBER                                                                                                             22Y
  INTERES                       VARCHAR2                                                                                                           10Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  DNICLIENTE                    VARCHAR2                                                                                                           10Y
  SALDO                         NUMBER                                                                                                             22N
  IBAN                          VARCHAR2                                                                                                           30N
  TIPO                          VARCHAR2                                                                                                           20N
  OFICINA                       NUMBER                                                                                                             22Y
  INTERES                       VARCHAR2                                                                                                           10Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  DNICLIENTE                    VARCHAR2                                                                                                           10Y
  SALDO                         NUMBER                                                                                                             22N
  IBAN                          VARCHAR2                                                                                                           30N
  TIPO                          VARCHAR2                                                                                                           20N
  OFICINA                       NUMBER                                                                                                             22Y
  INTERES                       VARCHAR2                                                                                                           10Y

  21 rows selected.

# OPERACIONES_INGRESAR
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N

  21 rows selected.

# OPERACIONES_RETIRAR
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20N

  21 rows selected.

# OPERACIONES_TRANSFERIR
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  CUENTADESTINO                 VARCHAR2                                                                                                           20Y
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  CUENTADESTINO                 VARCHAR2                                                                                                           20Y
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  NUMCUENTA                     VARCHAR2                                                                                                           20N
  CUENTADESTINO                 VARCHAR2                                                                                                           20Y

  21 rows selected.

# CUENTA
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CCC                           CHAR                                                                                                               20N
  FECHACREACION                 DATE                                                                                                                7N
  SALDO                         NUMBER                                                                                                             22N
  TITULAR                       VARCHAR2                                                                                                            9N

# CUENTAAHORRO
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CCC                           CHAR                                                                                                               20N
  TIPOINTERES                   NUMBER                                                                                                             22N

# CUENTACORRIENTE
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CCC                           CHAR                                                                                                               20N
  SUCURSAL_CODOFICINA           NUMBER                                                                                                             22N

# OPTRANSFERENCIA
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  NUMOP                         NUMBER                                                                                                             22N
  CUENTADESTINO                 CHAR                                                                                                               20N
  CCC                           CHAR                                                                                                               20N

# OP_INGRESAR
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20Y

  7 rows selected.

# OP_RETIRAR
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CODOFICINA                    NUMBER                                                                                                             22Y
  NUMCUENTA                     VARCHAR2                                                                                                           20Y

  7 rows selected.

# OP_TRANSFERIR
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CODIGO                        NUMBER                                                                                                             22N
  HORA                          VARCHAR2                                                                                                            7Y
  FECHA                         DATE                                                                                                                7Y
  DESCRIPCION                   VARCHAR2                                                                                                           30Y
  CANTIDAD                      NUMBER                                                                                                             22N
  CUENTAORIGEN                  VARCHAR2                                                                                                           20Y
  CUENTADESTINO                 VARCHAR2                                                                                                           20Y

  7 rows selected.

# SUCURSAL
  COLUMN_NAME                   DATA_TYPE                                                                                                 DATA_LENGTHN
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  CODOFICINA                    NUMBER                                                                                                             22N
  DIR                           CHAR                                                                                                               50N
  TFNO                          NUMBER                                                                                                             22N

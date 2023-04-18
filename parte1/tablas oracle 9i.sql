SPOOL /home/a821674/Oracle_BBDD2/datos_BBDD.txt

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OFICINAS';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'CUENTAS';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OPERACIONES_INGRESAR';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OPERACIONES_RETIRAR';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OPERACIONES_TRANSFERIR';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'CUENTA';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'CUENTAAHORRO';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'CUENTACORRIENTE';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OPTRANSFERENCIA';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OP_INGRESAR';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OP_RETIRAR';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'OP_TRANSFERIR';

SELECT atc.column_name, atc.data_type, atc.data_length, atc.nullable, acc.constraint_name, ac.constraint_type
FROM all_tab_columns@SCHEMA2BD2 atc
LEFT OUTER JOIN all_cons_columns@SCHEMA2BD2 acc ON atc.column_name = acc.column_name
AND atc.owner = acc.owner
AND atc.table_name = acc.table_name
LEFT OUTER JOIN all_constraints@SCHEMA2BD2 ac ON acc.owner = ac.owner
AND acc.constraint_name = ac.constraint_name
WHERE table_name = 'SUCURSAL';

SPOOL OFF;
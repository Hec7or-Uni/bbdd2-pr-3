CREATE VIEW clientes_view AS
	-- dni, nombre, apellido1, apellido2, telefono, email, fechanacimiento, edad, direccion
	SELECT dni, nombre, apellido AS apellido1, NULL AS apellido2, telefono, email, fechanacimiento, edad, direccion
	FROM clientes
	UNION
	SELECT tit.dni, tit.nombre, tit.apellido1, tit.apellido2, tit.telefono, NULL AS email, tit.fecha_nacimiento AS fechanacimiento, NULL AS edad,  (dir.ciudad || ', ' || dir.calle || ', ' || dir.numero || ', ' || dir.piso) AS direccion
	FROM titular@SCHEMA2BD2 tit, direccion@SCHEMA2BD2 dir 
	WHERE tit.direccion=dir.id_direccion;
	
	
CREATE VIEW oficinas_view AS
	-- codigo, telefono, direccion
	SELECT codigo, telefono, direccion
	FROM oficinas
	UNION 
	SELECT codoficina AS codigo, to_char(tfno) AS telefono, dir AS direccion
	FROM sucursal@SCHEMA2BD2;


CREATE VIEW cuentas_view AS
	-- ccc, fechacreacion, saldo, tipocuenta, interes,oficina
	SELECT iban AS ccc, fechacreacion, saldo, tipocuenta, interes, oficina
	FROM cuentas
	UNION 	
	SELECT cue.ccc, cue.fechacreacion, cue.saldo,
       CASE 
            WHEN cuec.sucursal_codoficina IS NOT NULL AND cuea.tipointeres IS NULL THEN 'CORRIENTE'
            WHEN cuea.tipointeres IS NOT NULL AND cuec.sucursal_codoficina IS NULL THEN 'AHORRO'
            WHEN cuec.sucursal_codoficina IS NOT NULL AND cuea.tipointeres IS NOT NULL THEN 'AMBAS'
            ELSE NULL 
       END AS tipo,
       CASE 
            WHEN cuec.sucursal_codoficina IS NOT NULL AND cuea.tipointeres IS NULL THEN NULL
            WHEN cuea.tipointeres IS NOT NULL AND cuec.sucursal_codoficina IS NULL THEN cuea.tipointeres
            WHEN cuea.tipointeres IS NOT NULL AND cuec.sucursal_codoficina IS NOT NULL THEN cuea.tipointeres
            ELSE NULL 
       END AS interes,
       CASE 
            WHEN cuec.sucursal_codoficina IS NOT NULL AND cuea.tipointeres IS NULL THEN cuec.sucursal_codoficina
            WHEN cuec.sucursal_codoficina IS NOT NULL AND cuea.tipointeres IS NOT NULL THEN cuec.sucursal_codoficina
            WHEN cuea.tipointeres IS NOT NULL AND cuec.sucursal_codoficina IS NULL THEN NULL
            ELSE NULL 
       END AS oficina
	FROM cuenta@SCHEMA2BD2 cue
	LEFT JOIN cuentaahorro@SCHEMA2BD2 cuea ON cue.ccc = cuea.ccc
	LEFT JOIN cuentacorriente@SCHEMA2BD2 cuec ON cue.ccc = cuec.ccc
	WHERE cuec.sucursal_codoficina IS NOT NULL OR cuea.tipointeres IS NOT NULL;

CREATE VIEW operaciones_view AS
	-- codigo, cantidad, fechayhora, descripcion, tipoop, cuentaemisora, cuentareceptora, oficina
	SELECT codigo, cantidad, to_char(timestamp) AS fechayhora, descripcion, 
		CASE 
			WHEN tipoop='TRANSFERENCIA' THEN 'TRANSFERENCIA'
			WHEN tipoop='RETIRADA' THEN 'EFECETIVO'
			WHEN tipoop='INGRESO' THEN 'EFECTIVO'
		END AS tipoop,
	cuentaemisora, cuentareceptora, oficina
	FROM OPERACIONES
	UNION 
	SELECT to_char(op.numop) AS codigo, op.cantidadop AS cantidad, (op.fechaop || ' ' || op.horaop) AS fechayhora, op.descripcionop AS descripcion, 'TRANSFERENCIA', op.ccc AS cuentaemisora, opt.cuentadestino AS cuentadestino, NULL
	FROM operacion@SCHEMA2BD2 op, optransferencia@SCHEMA2BD2 opt
	WHERE op.numop=opt.numop
	UNION 
	SELECT to_char(op.numop) AS codigo, op.cantidadop AS cantidad, (op.fechaop || ' ' || op.horaop) AS fechayhora, op.descripcionop AS descripcion, 'EFECTIVO', op.ccc AS cuentaemisora, NULL, ope.sucursal_codoficina
	FROM operacion@SCHEMA2BD2 op, opefectivo@SCHEMA2BD2 ope
	WHERE op.numop=ope.numop;
	

CREATE VIEW tienen_view AS
	-- cliente, cuenta
	SELECT dni, iban
	FROM tienen;
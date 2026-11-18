USE nomina;

-- selecciona todos los registros de la tabla cargos
SELECT 
  * 
FROM 
  cargo;

-- selecciona el campo cargo de la tabla cargos
SELECT 
  cargo 
FROM 
  cargo;

-- selecciona la primera letra del nombre de la tabla empleado
SELECT 
  LEFT(nombre, 1) AS inicial_nombre 
FROM 
  empleado;

-- SELECTs sin tabla
SELECT 2+2;
SELECT CURRENT_DATE();

-- muestra los cargos que comienzan por 'A' 
SELECT 
  cargo
FROM
  cargo
WHERE
  LEFT(cargo, 1) = 'A';

-- muestra los empleados sin num_sso guardado
SELECT 
  pk_empleado,
  nombre,
  apellido,
  num_sso
FROM
  empleado
WHERE
  num_sso IS NULL;
-- se pregunta IS NULL para campos nulos
-- IS NOT NULL para campos llenos

-- muestra el sexo guardado en la tabla empleados sin repetir
SELECT DISTINCT
  sexo 
FROM 
  empleado;

-- muestra los empleados ordenados por apellido y para dos apellidos iguales, por nombre
SELECT 
  pk_empleado,
  apellido,
  nombre,
  num_sso
FROM
  empleado
ORDER BY
  apellido,
  nombre;

-- muestra los 3 empleados con más hijos en la empresa
SELECT 
  pk_empleado,
  apellido,
  nombre,
  hijos
FROM
  empleado
ORDER BY
  hijos DESC
LIMIT 3;

-- salta los primeros 3 departamentos y devuelve los siguientes 2
SELECT 
  pk_departamento,
  departamento
FROM 
  departamento
ORDER BY 
  pk_departamento ASC
LIMIT 2 
OFFSET 3;
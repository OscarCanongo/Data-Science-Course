-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT empleado.nombre, salario FROM empleado 
INNER JOIN puesto ON empleado.id_puesto = puesto.id_puesto WHERE salario > 10000;

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas),max(total_ventas)
FROM (SELECT clave, id_empleado, count(*) total_ventas
FROM venta
GROUP BY clave, id_empleado) as sq
GROUP BY id_empleado;

-- ¿Cuál es el nombre del puesto de cada empleado?
SELECT empleado.nombre, count(id_venta) FROM empleado 
INNER JOIN venta ON empleado.id_empleado = venta.id_empleado GROUP BY empleado.id_empleado;
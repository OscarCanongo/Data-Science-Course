-- ¿Cuál es el nombre de los empleados con el puesto 4?
SELECT nombre FROM empleado WHERE id_puesto = 4;

-- ¿Qué puestos tienen un salario mayor a $10,000?
SELECT nombre FROM puesto WHERE salario > 10000;

-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
SELECT * FROM articulo WHERE precio > 1000 && iva > 100;

-- ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?
SELECT * FROM venta WHERE id_articulo IN (135, 963) && id_empleado IN (835, 369);
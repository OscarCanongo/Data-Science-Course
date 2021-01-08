-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT id_venta, nombre from venta INNER JOIN empleado ON venta.id_empleado = empleado.id_empleado;

--¿Cuál es el nombre de los artículos que se han vendido?
SELECT id_venta, nombre from venta INNER JOIN articulo ON venta.id_articulo = articulo.id_articulo;

--¿Cuál es el total de cada venta?
SELECT id_venta, nombre, round((cantidad * precio),2) as total from venta 
INNER JOIN articulo ON venta.id_articulo = articulo.id_articulo;
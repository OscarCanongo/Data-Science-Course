-- Obtener el puesto de un empleado.
CREATE VIEW Oscar1_616 AS (
SELECT e.id_empleado, e.nombre, e.apellido_paterno, e.apellido_materno, p.nombre AS 'Puesto'
FROM empleado AS e
JOIN puesto AS p
ON p.id_puesto = e.id_puesto
ORDER BY id_empleado);

-- Saber qué artículos ha vendido cada empleado.
CREATE VIEW Oscar2_616 AS (
SELECT empleado.nombre, articulo.nombre AS 'empleado'
FROM empleado
INNER JOIN venta ON empleado.id_empleado = venta.id_empleado
INNER JOIN articulo ON articulo.id_articulo = venta.id_articulo
);  

-- Saber qué puesto ha tenido más ventas.
CREATE VIEW Oscar3_616 AS (
SELECT puesto.nombre, count(id_venta) AS 'ventas'
FROM puesto
INNER JOIN empleado ON puesto.id_puesto = empleado.id_puesto
INNER JOIN venta ON empleado.id_empleado = venta.id_empleado
GROUP BY puesto.id_puesto
); 


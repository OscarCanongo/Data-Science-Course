--¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario)
FROM puesto;

--¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*)
FROM articulo
WHERE nombre LIKE '%PASTA%';

--¿Cuál es el salario mínimo y máximo?
SELECT max(salario), min(salario)
FROM puesto;

--¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario)
FROM puesto ORDER BY id_puesto DESC LIMIT 5;
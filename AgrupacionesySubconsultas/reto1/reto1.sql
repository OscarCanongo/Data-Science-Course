--Pregunta 1
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT nombre
FROM articulo
WHERE nombre LIKE '%PASTA%';

--Pregunta 2
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT nombre
FROM articulo
WHERE nombre LIKE '%Cannelloni%';

--Pregunta 3
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT nombre
FROM articulo
WHERE nombre LIKE '% - %';

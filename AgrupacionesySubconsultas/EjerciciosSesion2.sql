-- 1) Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con A.
SELECT id_empleado, apellido_paterno, nombre FROM empleado WHERE nombre LIKE 'A%';

-- 2) Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo apellido termina con on.
SELECT employeeNumber, lastName, firstName FROM employees WHERE lastName LIKE '%on';

-- 3) Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on%';

-- 4) Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'G%' && LENGTH(firstName) = 6;

-- 5) Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName NOT LIKE 'B%';

-- 6) Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
SELECT productCode, productName FROM products WHERE productName NOT LIKE '%_20%';

-- 7) Dentro de la tabla orderdetails, obten el total de cada orden.
SELECT orderNumber, SUM(priceEach) FROM orderdetails GROUP BY orderNumber;

-- 8) Dentro de la tabla orders obten el número de órdenes por año.
SELECT YEAR(orderDate), count(*) FROM orders GROUP BY YEAR(orderDate);

-- 9) Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
SELECT lastName, firstName, country FROM employees INNER JOIN offices ON employees.officeCode = offices.officeCode 
WHERE country = 'USA';

-- 10) Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT customerNumber, checkNumber, amount FROM payments ORDER BY amount DESC LIMIT 1;

-- 11)No s Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount from payments WHERE amount > (SELECT AVG(amount) FROM payments ORDER BY amount) 
ORDER BY amount;

-- 12) Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT customerName from customers LEFT JOIN orders ON customers.customerNumber = orders.customerNumber 
WHERE orders.customerNumber IS NULL;

-- 13) Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT MAX(quantityOrdered), MIN(quantityOrdered), AVG(quantityOrdered) FROM orderdetails GROUP BY productCode;

-- 14) Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
SELECT COUNT(*), status FROM orders GROUP BY status;

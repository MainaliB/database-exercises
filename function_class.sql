SELECT concat("Hello", " Dardens!!");

SELECT concat (last_name, ", ", first_name) AS "Full Name"
FROM employees;

SELECT concat(last_name, " ", first_name) AS "full name"
FROM employees
WHERE concat(last_name, " ", first_name) like 'B% M%';

SELECT CONCAT(SUBSTR(first_name, 1, 1), ".", SUBSTR(last_name, 1, 1))  AS "Employee Initials"
from employees
order by "Employee Initial";

SELECT CONCAT(UPPER(first_name), " ", UPPER(last_name)) AS "FULL NAME"
FROM employees;

SELECT REPLACE(first_name, 'a', 'o') as changed_first_name, first_name
FROM employees
WHERE first_name != REPLACE(first_name, 'a', 'o');
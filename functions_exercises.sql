#1
USE employees;

#2
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

#3
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

#4 Getting the number of days employees have worked for the company
SELECT last_name, first_name, hire_date, birth_date, DATEDIFF(CURDATE(), hire_date) AS days_employed
FROM employees
WHERE hire_date LIKE '199%-%%-%%' AND birth_date LIKE '%%%%-12-25';

#5 Generating the maximum and minimum salary paid to the employees
SELECT MAX(salary) Maximum_Salary, MIN(salary) Minimum_Salary
FROM salaries;

# 6 Creating a USERNAME for all the employees

SELECT first_name, last_name, birth_date, LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,1,4), '_', SUBSTR(CAST(birth_date AS CHAR), 6,2), SUBSTR(CAST(birth_date AS CHAR),3,2)
)) AS username
FROM employees
LIMIT 10;









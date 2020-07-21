#1
USE employees;

#2 
SELECT *
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya');

#3
SELECT *
FROM employees
WHERE last_name LIKE 'E%';

#4
SELECT * 
FROM employees
WHERE hire_date LIKE '199%-%%-%%';

#5
SELECT * 
FROM employees
WHERE birth_date LIKE '%%%%-12-25';

#6
SELECT * 
FROM employees
WHERE last_name LIKE '%q%';

#1
SELECT *
FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya';

#2
SELECT *
FROM employees
WHERE (first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya')
AND gender = 'M';

# 3 
SELECT * 
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

#4
SELECT * 
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

#5
SELECT * 
FROM employees
WHERE hire_date LIKE '199%-%%-%%' AND birth_date LIKE '%%%%-12-25';

#6
SELECT * 
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

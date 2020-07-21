#1
USE employees;

#2 
SELECT *
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

#3
SELECT *
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

#3
SELECT *
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

#5
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

#6
#5
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;


#7
SELECT * 
FROM employees
WHERE hire_date LIKE '199%-%%-%%' AND birth_date LIKE '%%%%-12-25'
ORDER BY birth_date ASC, hire_date DESC;




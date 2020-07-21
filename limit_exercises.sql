# 1
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

#2
SELECT *
FROM employees
WHERE birth_date like '%-12-25' and hire_date like '199%'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5;

#3
SELECT *
FROM employees
WHERE birth_date like '%-12-25' and hire_date like '199%'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5 OFFSET 45;

# Page Number = (offset/limit) + 1
SELECT DISTINCT title
FROM titles;

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


USE chipotle;
select * 
from orders
where item_price like '$1%'
order by quantity DESC
limit 20 offset 50;

USE employees;

SELECT * 
FROM titles
WHERE title = "Engineer" AND from_date like '20%%-%%-%%' AND to_date like '99%%-%%-%%'
ORDER BY emp_no;

SELECT *
FROM titles
WHERE title = 'staff'
ORDER BY emp_no DESC
LIMIT 20 OFFSET 100;

SELECT * 
FROM employees
WHERE title = staff
# General Join(Inner) Syntax 

SELECT *
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = 10001
AND s.to_date > curdate();



SELECT title, CONCAT(e.last_name, ', ' , e.first_name) AS Full_Name
FROM employees e
JOIN titles t on e.emp_no = t.emp_no;

USE join_example_db;

SELECT * 
FROM users U
JOIN roles R ON R.id = U.id;

SELECT * # left joining will produce an output that includes all the records on the left table regardless if they hold a value or NULL on a right table
FROM users U
LEFT JOIN roles R on R.id = U.id;

SELECT * 
FROM users U
RIGHT JOIN roles R on R.id = U.id;

USE employees;
SELECT DISTINCT(CONCAT(last_name, ', ', first_name)) AS Full_Name, 
	salary, title,
	S.to_date Salary_end_date,
	S.from_date Salary_start_datte
FROM employees E
JOIN salaries S on E.emp_no = S.emp_no
JOIN titles T on T.emp_no = E.emp_no
LIMIT 200;


#1

USE join_example_db;

#2
SELECT * 
FROM roles r
JOIN users u on r.id = u.id;

SELECT * 
FROM roles r
LEFT JOIN users u on r.id = u.id;

SELECT * 
FROM users u
right JOIN roles r on r.id = u.id;

SELECT * 
FROM users u
left JOIN roles r on r.id = u.id;

SELECT * 
FRom roles r
RIGHT JOIN users u on r.id = u.id;

select *
from roles r
left join users u on r.id = u.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT COUNT(r.name) AS roles
FROM roles r
JOIN users u on r.id = u.id
GROUP BY r.name;


#1

USE employees;

#2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT dept_name AS "Department Name", CONCAT(e.first_name, ' ', e.last_name) AS "Department Manager"
FROM employees e
JOIN dept_manager on dept_manager.emp_no = e.emp_no
JOIN departments d on d.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > CURDATE()
ORDER BY dept_name ASC;

#3 Find the name of all departments currently managed by women.

SELECT dept_name AS "Department Name", CONCAT(e.first_name, ' ', e.last_name) AS "Department Manager", e.gender as "Sex"
FROM employees e
JOIN dept_manager on dept_manager.emp_no = e.emp_no
JOIN departments d on d.dept_no = dept_manager.dept_no
WHERE gender = 'F' AND dept_manager.to_date > CURDATE()
ORDER BY dept_name ASC;

#4 Find the current titles of employees currently working in the Customer Service department.
select COUNT(title)AS COUNT, title
from employees e
join titles t on t.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no= de.dept_no
WHERE (de.to_date > CURDATE() and d.dept_name="Customer Service"  and t.to_date>CURDATE())
GROUP BY t.title;


#5 Find the current salary of all current managers.
SELECT d.dept_name AS "Department Name", CONCAT(e.first_name, ' ', e.last_name) AS "Name", s.salary AS Salary
FROM employees e
JOIN dept_manager on dept_manager.emp_no = e.emp_no
JOIN departments d on d.dept_no = dept_manager.dept_no
JOIN salaries AS s ON s.emp_no = e.emp_no
WHERE dept_manager.to_date > CURDATE() AND s.to_date > CURDATE();

#6 Find the number of employees in each department.
select count(e.emp_no) AS num_employees, d.dept_name AS department_name, d.dept_no
FROM employees e
JOIN dept_emp de on de.emp_no = e.emp_no
JOIN departments d on d.dept_no = de.dept_no
WHERE de.to_date > CURDATE()
GROUP BY dept_name
ORDER BY d.dept_no;

#7Which department has the highest average salary? Hint: Use current not historic information.


select AVG (s.salary) AS max_salary, d.dept_name
FROM employees e
join salaries s on s.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where de.to_date > CURDATE() and  s.to_date > curdate()
GROUP BY d.dept_name
order by max_salary DESC
LIMIT 1;


#8 Who is the highest paid employee in the Marketing department?
select e.first_name, e.last_name
from employees e
join salaries s on s.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
WHERE de.to_date > curdate() and d.dept_name = "Marketing"
order by s.salary DESC
LIMIT 1;

#9 Which current department manager has the highest salary?
select last_name, first_name, d.dept_name, salary
from employees e
join salaries s on s.emp_no = e.emp_no
join dept_manager dm on dm.emp_no = e.emp_no
join departments d on d.dept_no = dm.dept_no
where dm.to_date > CURDATE() and s.to_date > CURDATE()
ORDER BY s.salary DESC
limit 1;

#10 Bonus Find the names of all current employees, their department name, and their current manager's name.
select e.first_name, e.last_name, d.dept_name, dm.emp_no as Manager_emp_no, concat(ee.first_name,' ', ee.last_name) as Manager
from employees e
join salaries s on s.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
join dept_manager dm on dm.dept_no = d.dept_no
join employees ee on ee.emp_no = dm.emp_no
WHERE (de.to_date > curdate() and s.to_date > CURDATE() and dm.to_date>CURDATE());





#11 Bonus Find the highest paid employee in each department.
select max_sal.sal_max, e.first_name, e.last_name,d.dept_name
from salaries s
join employees e on e.emp_no = s.emp_no
join dept_emp de on de.emp_no = s.emp_no
join departments d on d.dept_no = de.dept_no
join (select max(s.salary) as  sal_max, de.dept_no
		from employees e
	join salaries s on s.emp_no = e.emp_no
	join dept_emp de on de.emp_no = e.emp_no
	join departments d on d.dept_no = de.dept_no
	WHERE de.to_date > curdate() and s.to_date > curdate()
	group by d.dept_name) as  max_sal on max_sal.dept_no = d.dept_no
where salary = max_sal.sal_max
order by d.dept_name;





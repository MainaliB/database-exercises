#1 Find all the employees with the same hire date as employee 101010 using a sub-query.
select *
from employees 
where hire_date in (
				select hire_date
				from employees
				where emp_no = 101010
);

#2 Find all the titles held by all employees with the first name Aamod.
select count(title) as total_title, count(distinct title) as unique_title
from titles
where emp_no in (
				select emp_no
				from employees
				where first_name = 'Aamod'
);

#3 How many people in the employees table are no longer working for the company?
select count(*)
from employees
where emp_no not in (
					select emp_no
					from salaries
					where to_date > curdate()
);

#4 Find all the current department managers that are females
select first_name, last_name
from employees
where emp_no in (
				select emp_no
				from dept_manager
				where to_date > curdate()
)
and gender = 'F';


#5 Find all the employees that currently have a higher than average salary.
select first_name, last_name, salary
from employees e
join salaries s on s.emp_no = e.emp_no
where s.salary > (
					select avg(salary)
					from salaries
					where to_date >curdate())

and s.to_date > curdate()
limit 5;



#6 How many current salaries are within 1 standard deviation of the highest salary? What percentage of all salaries is this?
select (table2.salarywithinstddev/table1.total_count * 100) as percentage
from 
	(select count(emp_no) as total_count
	from salaries
	where to_date > curdate()) as table1, 
	(select count(emp_no) as salarywithinstddev
	from salaries
	where salary > (
					select max(salary) - stddev(salary)
					from salaries)
			and
			to_date > curdate()) as table2;

# Bonus
#1 Find all the department names that currently have female managers.
select dept_name
from departments
where dept_no in(
			select dept_no
			from dept_manager
			where to_date > curdate() and emp_no in (
													select emp_no
													from employees
													where gender = "F"));
													
#2 Find the first and last name of the employee with the highest salary.
select first_name, last_name
from employees
where emp_no in (select emp_no
				from salaries
				where salary in (
								select max(salary)
								from salaries
								where to_date > curdate()));
								
#3 Find the department name that the employee with the highest salary works in.
select dept_name as "Department where the highest paid employee works at"
from departments
where dept_no in (
				select dept_no
				from dept_emp
				where emp_no in (
							select emp_no
							from salaries
							where salary in (
								select max(salary)
								from salaries
								where to_date > curdate())));

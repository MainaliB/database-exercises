#1 Using the example from the lesson, re-create the employees_with_departments table.
create table employees_with_departments AS
	select e.emp_no, e.first_name, e.last_name, edp.dept_no, edp.dept_name
	from employees.employees as e
	join employees.dept_emp ed using (emp_no)
	join employees.departments edp using (dept_no)
	limit 100;
	

#1.a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
Alter table employees_with_departments ADD full_name VARCHAR(100);

#1b Update the table so that full name column contains the correct data
update employees_with_departments
set full_name = concat(first_name, last_name);

#1c Remove the first_name and last_name columns from the table.
alter table employees_with_departments drop column first_name;
alter table employees_with_departments drop column last_name;

#1d What is another way you could have ended up with this same table?
create table employees_with_departments AS
	select e.emp_no, concat(e.first_name,' ', e.last_name) as full_name, edp.dept_no, edp.dept_name
	from employees.employees as e
	join employees.dept_emp ed using (emp_no)
	join employees.departments edp using (dept_no)
	limit 100;

#2
create temporary table payment AS
select * 
from sakila.payment;

SELECT *
from payment;

alter table payment add amount_in_cents int(5) unsigned;

update payment 
set amount_in_cents = amount*100;

alter table payment drop column amount;

alter TABLE payment add amount int(5) unsigned;

update payment
set amount = amount_in_cents;

alter table payment drop column amount_in_cents;

select *
from payment;

#3
create temporary table overall_avge_salary as
select avg(es.salary) as overall_avg
from employees.salaries as es
where es.to_date > curdate();




create temporary table avgee_salary_per_dept as
select avg(es.salary) as dept_avg_salary, eds.dept_name
from employees.salaries es
join employees.dept_emp as ede on ede.emp_no = es.emp_no
join employees.departments eds on eds.dept_no = ede.dept_no
where es.to_date > curdate()
and ede.to_date > curdate()
group by ede.dept_no;

create temporary table stddev as 
select stddev(es.salary) as std_dev
from employees.salaries as es
where es.to_date > curdate();

# one way using the temporary table created above

select ((avgee_salary_per_dept.dept_avg_salary - overall_avge_salary.overall_avg)/stddev.std_dev) as Z_score, dept_name
from avgee_salary_per_dept, overall_avge_salary, stddev;


# another way without creating temporary table

select ((t1.dept_avg_salary - t2.overall_avg) / t3.std_dev) as Z_score, dept_name
from (select avg(es.salary) as dept_avg_salary, eds.dept_name
		from employees.salaries es
		join employees.dept_emp as ede on ede.emp_no = es.emp_no
		join employees.departments eds on eds.dept_no = ede.dept_no
		where es.to_date > curdate()
		and ede.to_date > curdate()
		group by ede.dept_no) as t1, 
		
		(select avg(es.salary) as overall_avg
		from employees.salaries as es
		where es.to_date > curdate()) as t2, 
		
		(select stddev(es.salary) as std_dev
		from employees.salaries as es
		where es.to_date > curdate()) as t3;

select sum(employees.salaries.salary)/240124
from employees.salaries
where employees.salaries.to_date>curdate();
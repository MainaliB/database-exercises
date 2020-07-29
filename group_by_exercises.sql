USE employees;

SELECT CURTIME();

SELECT CURDATE();

SELECT UNIX_TIMESTAMP();

SELECT REPLACE('BIBEKMAINALI', 'A', 'O');

SELECT SUBSTR('BIBEKMAINALI', 5, 3);

SELECT NOW();

select (cast(salary as CHAR))/12 as new_monthly_salary
from salaries;

select first_name
from employees
group by first_name;


SELECT COUNT(*), COUNT(title)
FROM titles;

SELECT COUNT(title)
FROM titles
WHERE title = 'Staff';


SELECT title, COUNT(title) AS total
FROM titles 
GROUP BY title;


# Sub query example
SELECT SUM(A.total) AS total_rows
	FROM (SELECT title, COUNT(title) AS total
		FROM titles 
		GROUP BY title) AS A;



#1 
SELECT title
FROM titles
GROUP BY title;
# or
SELECT DISTINCT title
FROM titles;


#2. In your script, use DISTINCT to find the unique titles in the titles table.
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e' 
GROUP BY last_name;

#3 Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY.
SELECT CONCAT(first_name, ' ', last_name) AS unique_fullnames
FROM employees
WHERE last_name LIKE 'e%e' 
GROUP BY unique_fullnames;



#4 Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'.
SELECT last_name 
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

#5 Find the unique last names with a 'q' but not 'qu'
SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(last_name);

#6 Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT COUNT(*), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

#7 BONUS
#Use your knowledge of built in SQL functions to generate a username for all of the 
#employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, 
#the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

select count(temp.username) 
from (SELECT  LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,1,4), '_', SUBSTR(CAST(birth_date AS CHAR), 6,2), SUBSTR(CAST(birth_date AS CHAR),3,2)
		))AS username, count(*) as username_count
		FROM employees
		GROUP BY username) as temp
where temp.username_count > 1;






########

SELECT  LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,1,4), '_', SUBSTR(CAST(birth_date AS CHAR), 6,2), SUBSTR(CAST(birth_date AS CHAR),3,2)
))AS username, count(*) as username_count
FROM employees
GROUP BY username;
# there are 300024 usernames whereas 285872 unique username. So, the number of duplicate useranme = (300024-285872) = 14152
SELECT sum(temp.username_count) AS total_users_with_duplicated_usernames, 
		COUNT(temp.username_count) AS distinct_usernames_that_are_duplicated, 
		sum(temp.username_count) - COUNT(temp.username_count) AS number_of_users_who_need_unique_usernames
FROM (SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), 
					LOWER(SUBSTR(last_name, 1, 4)), "_", 
					SUBSTR(birth_date, 6, 2),
					SUBSTR(birth_date, 3, 2)) AS username, 
					COUNT(*) as username_count
        FROM employees
        GROUP BY username
        ORDER BY username_count DESC
) as temp
WHERE username_count > 1;



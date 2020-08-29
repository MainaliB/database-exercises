

# From Employee Databse

#1 How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
SELECT s.salary AS manager_salary, d.dept_no, d.dept_name
FROM salaries s
JOIN dept_manager dm ON dm.emp_no = s.emp_no
JOIN departments d ON d.dept_no = dm.dept_no				
WHERE dm.to_date > curdate() AND s.to_date > curdate();
 # we just pulled the salary of each department's manager
 
 # now we need to get the average salary for each department
 SELECT AVG(s.salary) AS dept_average_sal, d. dept_name, d.dept_no
 FROM salaries s
 JOIN dept_emp de ON de.emp_no = s.emp_no
 JOIN departments d ON d.dept_no = de.dept_no
 WHERE s.to_date > curdate() AND de.to_date > curdate()
 GROUP BY d.dept_name;
 
 # getting the salary difference between the department manager salary and the average salary of their employees in their department
 SELECT (manager.manager_salary- dept_average_sal) AS sal_diff, manager.dept_name
 FROM (SELECT s.salary AS manager_salary, d.dept_no, d.dept_name
FROM salaries s
JOIN dept_manager dm ON dm.emp_no = s.emp_no
JOIN departments d ON d.dept_no = dm.dept_no				
WHERE dm.to_date > curdate() AND s.to_date > curdate()
 ) AS manager
 JOIN( SELECT AVG(s.salary) AS dept_average_sal, d. dept_name, d.dept_no
 FROM salaries s
 JOIN dept_emp de ON de.emp_no = s.emp_no
 JOIN departments d ON d.dept_no = de.dept_no
 WHERE s.to_date > curdate() AND de.to_date > curdate()
 GROUP BY d.dept_name) AS emp_avg ON emp_avg.dept_no = manager.dept_no;
 
 # In the reult of the query, the negative number means the salary of the manager in that department is less than the average salary of the employees in the department.
 
 
 # From World Database
 
 USE world;
 
 
 #1. What languages are spoken in Santa Monica?
 
 	# first getting the name of the city and its information.
 SELECT * FROM city
 WHERE Name = "Santa Monica";

SELECT * FROM countrylanguage
WHERE CountryCode = "USA";

# Now we are querying to get all the languages spoken in Santa Monica
SELECT cl.Language, ct.Name, cl.Percentage
FROM countrylanguage cl 
JOIN country c ON cl.CountryCode = c.Code 
JOIN city ct ON ct.CountryCode = c.Code
WHERE ct.Name = "Santa Monica"
ORDER BY cl.Percentage ASC;

#2. How many different countries are in each region?
SELECT COUNT(NAME) AS number_of_countries, Region
FROM country
GROUP BY Region
ORDER BY number_of_countries ASC;

#3. What is the population for each region?

SELECT SUM(Population) AS total_population, Region
FROM country
GROUP BY Region
ORDER BY total_population DESC;

#4. What is the population for each continent?
SELECT SUM(Population) AS total_population, Continent
FROM country
GROUP BY Continent
ORDER BY total_population DESC;

#5. What is the average life expectancy globally?
SELECT AVG(LifeExpectancy) as avg_lifeexpectancy
FROM country;

#6. What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

SELECT AVG(LifeExpectancy) AS avg_lifeexpectancy, Region
FROM country
GROUP BY Region
ORDER BY avg_lifeexpectancy ASC;


SELECT AVG(LifeExpectancy) AS avg_lifeexpectancy, Continent
FROM country
GROUP BY Continent
ORDER BY avg_lifeexpectancy ASC;





 
-- Active: 1662655903238@@127.0.0.1@3306@employees

SHOW tables;

--SELECT all employees
SELECT * FROM employees;

-- How many total employees?
SELECT COUNT(DISTINCT emp_no) FROM employees;


--SELECT first and last name and employee id FROM employees table, sort alphabetically by lastname
SELECT 
	first_name "First Name", last_name "Last Name", emp_no "Employee ID" 
FROM 
	employees
ORDER BY 
	last_name ASC;


-- return emp_no, firstname, lastname and salaries for all employees
SELECT 
	e.emp_no, first_name, last_name, salary
FROM 
	employees e
JOIN 
	salaries s 
ON 
	e.emp_no = s.emp_no
ORDER BY
	e.emp_no ASC;

-- return highest salaries for emp_no's
SELECT 
	e.emp_no, max(salary) "Highest Salary"
FROM 
	employees e
JOIN 
	salaries s 
ON 
	e.emp_no = s.emp_no
GROUP BY 
	e.emp_no
ORDER BY
	e.emp_no ASC;

-- Show highest and lowest employee salaries
SELECT 
	MAX(salary) "Highest Salary", MIN(salary) "Lowest Salary" 
FROM 
	employees e
JOIN 
	salaries s 
ON 
	e.emp_no = s.emp_no;


-- highest company salary
SELECT "Highest Paid Employee", CONCAT(first_name, " ", last_name) "Name", e.emp_no "Emp. #", salary
FROM salaries s
JOIN employees e
ON e.emp_no = s.emp_no
WHERE salary = (SELECT MAX(salary) FROM salaries)
;

-- Top ten highest paid employees
SELECT emp_no, salary
FROM salaries
GROUP BY emp_no, salary
ORDER BY salary DESC
LIMIT 10;

-- Return employee with ID # 100000
SELECT 
	concat(first_name, " ", last_name) as 'Name', emp_no 
FROM 
	employees 
WHERE 
	emp_no in (100000);


-- Find employees with the letter 'e' as the third letter in their last name
SELECT 
	LAST_NAME 
FROM 
	employees 
WHERE 
	last_name 
LIKE 
	'__e%';


-- list all manager names and department no's
SELECT e.emp_no "Emp Num", CONCAT(first_name, " ", last_name) "Manager Name", d.dept_no "Dept Num"
FROM employees e
JOIN dept_manager d
ON e.emp_no = d.emp_no
WHERE e.emp_no in
(SELECT emp_no from dept_manager);

-- show all departments
select * from departments;

-- show all department managers
select * from dept_manager;

-- show all department managers numbers and their departments
select * from dept_manager as dm
where dm.dept_no
in (select d.dept_no from departments as d);

-- show all department managers names and their departments
select CONCAT(first_name, ' ', last_name) 'Manager', dept_name 'Department Name'
from dept_manager dm
    join employees e on dm.emp_no = e.emp_no
    join departments d on dm.dept_no = d.dept_no;


-- show all department mangaers and their departments
SELECT CONCAT(first_name, ' ', last_name) 'Name', dept_name
FROM employees e
JOIN dept_manager dm 
ON e.emp_no = d.dept_no
WHERE e.emp_no in 
    (SELECT * from dept_manager dm
    JOIN departments d
    ON dm.dept_no = d.dept_no);

-- show all employees, their departments and their managers
select CONCAT(first_name, ' ', last_name) "Employee", dept_name, manager_name
from (employees e join dept_emp de on e.emp_no = de.emp_no) as employeesDepartments
where de.dept_no in (select d.dept_no from departments d)
and ;

select * from employees;
select * from dept_emp;


SELECT first_name, last_name FROM employees 
WHERE manager_id in (SELECT employee_id 
FROM employees WHERE department_id 
IN (SELECT department_id FROM departments WHERE location_id 
IN (SELECT location_id FROM locations WHERE country_id='US')));

SELECT first_name, last_name FROM employees
WHERE manager_id not in (SELECT employee_id FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT avg(salary) FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary = (SELECT min_salary FROM jobs
WHERE employees.job_id = jobs.job_id);

SELECT first_name, last_name, salary FROM employees
WHERE (
	salary > (SELECT avg(salary) FROM employees)
	and employees.department_id in (SELECT DEPARTMENT_ID FROM departments
	WHERE department_name LIKE '%IT%'));

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT max(salary) FROM employees WHERE job_id = 'sh_clerk') 
ORDER BY SALARY asc;

SELECT employee_id, first_name, last_name, department_name
FROM employees e
JOIN departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

SELECT employee_id, first_name, last_name, salary, department_id, avgsalary
FROM employees as e
WHERE (e.salary > 
(SELECT AVG(salary) FROM employees WHERE department_id = e.department_id) avgsalary);

(SELECT AVG(salary),department_id FROM employees
GROUP BY department_id);

SELECT * FROM employees WHERE last_name in ('Blake','Scott','King','Ford');

SELECT department_id, count(department_id) positions FROM employees GROUP BY department_id;

SELECT sum(salary) FROM employees;

SELECT manager_id, sum(salary) FROM employees GROUP BY manager_id;

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull');

SELECT first_name, last_name FROM employees
WHERE manager_id != 0;

SELECT first_name, last_name, manager_id FROM employees 
WHERE manager_id in (SELECT employee_id 
FROM employees WHERE department_id 
IN (SELECT department_id FROM departments WHERE location_id 
IN (SELECT location_id FROM locations WHERE country_id='US')));

SELECT first_name, last_name, salary, job_id FROM employees
WHERE salary = (SELECT min(salary) FROM
jobs WHERE employees.job_id = jobs.job_id);

SELECT first_name, last_name, salary, department_id FROM employees e
WHERE salary > (SELECT avg(salary) FROM employees)
and e.DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM departments
WHERE department_name LIKE 'IT%');


SELECT employee_id, first_name, last_name, 
(SELECT department_name FROM departments WHERE employees.DEPARTMENT_ID = departments.DEPARTMENT_ID)
FROM employees;


SELECT employee_id, first_name 
FROM employees AS A 
WHERE salary > 
(SELECT AVG(salary) FROM employees WHERE department_id = A.department_id);

SELECT first_name, AVG(salary) FROM employees A WHERE department_id = A.department_id;


SELECT manager_id, salary FROM employees
WHERE salary = (SELECT min(salary) FROM employees);

SELECT AVG(salary) FROM employees
WHERE job_id != 'IT_PROG'
GROUP BY job_id;

SELECT first_name, last_name FROM employees 
WHERE manager_id in (SELECT employee_id 
FROM employees WHERE department_id 
IN (SELECT department_id FROM departments WHERE location_id 
IN (SELECT location_id FROM locations WHERE country_id='US')));

SELECT first_name, last_name FROM employees
WHERE manager_id in (SELECT employee_id 
FROM employees WHERE department_id 
in (SELECT department_id FROM departments WHERE location_id 
in (SELECT location_id FROM locations WHERE country_id='US')));

SELECT first_name, last_name FROM employees
WHERE MANAGER_ID in (SELECT EMPLOYEE_ID FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary = (SELECT min_salary FROM jobs
WHERE employees.job_id = jobs.job_id);

SELECT first_name, last_name, salary FROM employees 
and DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM departments
WHERE salary > (SELECT avg(salary) FROM employees) 
WHERE department_name LIKE '%IT%');

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT max(salary) FROM employees
WHERE job_id = 'sh_clerk');

SELECT first_name, last_name FROM employees
WHERE EMPLOYEE_ID not in (SELECT MANAGER_ID
FROM employees);

SELECT employee_id, first_name, last_name, (SELECT department_name
FROM departments WHERE employees.DEPARTMENT_ID = departments.DEPARTMENT_ID) FROM employees;



SELECT employee_id, first_name, last_name, salary FROM employees A
WHERE salary > (SELECT avg(salary) FROM employees WHERE DEPARTMENT_ID = A.DEPARTMENT_ID);

SELECT distinct(salary) 
FROM employees e1
WHERE 5 = (SELECT count(DISTINCT salary) 
FROM employees e2
WHERE e2.SALARY >= e1.SALARY);

SELECT * FROM employees
WHERE 10 = (SELECT count(*)
FROM employees);

SELECT * FROM
(SELECT * FROM employees
ORDER BY EMPLOYEE_ID desc
limit 10) sub
ORDER BY EMPLOYEE_ID asc;

SELECT department_id, department_name 
FROM departments d
WHERE (d.DEPARTMENT_ID not IN
(SELECT DISTINCT(DEPARTMENT_ID) FROM employees));

SELECT location_id, street_address, city, state_province, country_name
FROM locations
natural JOIN countries;

SELECT first_name, last_name, employees.department_id
FROM employees
JOIN departments using 
on employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;

SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e
JOIN departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
JOIN locations l
on (d.LOCATION_ID = l.LOCATION_ID)
WHERE l.city = "London";


SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';

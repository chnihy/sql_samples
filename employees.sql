USE employees;

-- Show total number of employees;
SELECT COUNT(DISTINCT(emp_no)) FROM employees;

-- Show total number of managers
SELECT COUNT(DISTINCT emp_no) "Managers" FROM dept_manager;

--SELECT first and last name and employee id FROM employees table, 
-- sort alphabetically by lastname
SELECT first_name "First Name", last_name "Last Name", emp_no "Employee ID" 
FROM employees
ORDER BY last_name ASC;


-- return emp_no, firstname, lastname and salaries for all employees
SELECT e.emp_no, first_name, last_name, salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
ORDER BYe.emp_no ASC;

-- return highest salaries for emp_no's
SELECT e.emp_no, max(salary) "Highest Salary"
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
ORDER BYe.emp_no ASC;

-- Show highest and lowest employee salaries
SELECT MAX(salary) "Highest Salary", MIN(salary) "Lowest Salary" 
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no;


-- highest company salary
SELECT "Highest Paid Employee", CONCAT(first_name, " ", last_name) "Name", e.emp_no "Emp. #", salary
FROM salaries s
JOIN employees e
ON e.emp_no = s.emp_no
WHERE salary = (SELECT MAX(salary) FROM salaries);

-- Top ten highest paid employees
SELECT emp_no, salary
FROM salaries
GROUP BY emp_no, salary
ORDER BY salary DESC
LIMIT 10;

-- Average Employee Salary
SELECT concat(first_name, ' ', last_name), avg(salary) from employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
limit 100;

-- Return employee with ID # 100000
SELECT concat(first_name, " ", last_name) as 'Name', emp_no 
FROM employees 
WHERE emp_no = 100000;


-- Find employees with the letter 'e' as the third letter in their last name
SELECT LAST_NAME 
FROM employees 
WHERE last_name 
LIKE '__e%';


-- list all manager names and department no's
SELECT e.emp_no "Emp Num", CONCAT(first_name, " ", last_name) "Manager Name", d.dept_no "Dept Num"
FROM employees e
JOIN dept_manager d
ON e.emp_no = d.emp_no
WHERE e.emp_no in
(SELECT emp_no from dept_manager);


-- show all department managers names and their departments
select CONCAT(first_name, ' ', last_name) 'Manager', dept_name 'Department Name'
from dept_manager dm
    join employees e on dm.emp_no = e.emp_no
    join departments d on dm.dept_no = d.dept_no;


-- show all employees and their departments
select CONCAT(e.first_name, ' ', e.last_name) "Employee", d.dept_name
from dept_emp de
join employees e on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no;


-- employees, depts and their managers
select CONCAT(e.first_name, ' ', e.last_name) "Employee", d.dept_name, dm.emp_no 'Manager No'
from dept_emp de
join employees e on e.emp_no = de.emp_no
join dept_manager dm on dm.dept_no = de.dept_no
join departments d on d.dept_no = de.dept_no;

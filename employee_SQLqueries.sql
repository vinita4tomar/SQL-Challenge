-- List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, salaries.salary
FROM employees AS emp
	INNER JOIN salaries ON
	emp.emp_no = salaries.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- List the manager of each department along with their department number, department name,  
-- employee number, last name, and first name
SELECT dept.dept_no, dept.dept_name, emp.emp_no, emp.first_name, emp.last_name
FROM departments AS dept
	INNER JOIN department_managers AS mgrs ON
	dept.dept_no = mgrs.dept_no
		INNER JOIN employees AS emp ON
		mgrs.emp_no = emp.emp_no ;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name 
SELECT dept.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN department_employees AS dep_emp ON
	emp.emp_no = dep_emp.emp_no
		INNER JOIN departments AS dept ON
		dep_emp.dept_no = dept.dept_no ;
			
-- List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B 
SELECT emp_no, first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN department_employees AS dep_emp ON
	emp.emp_no = dep_emp.emp_no
		INNER JOIN departments AS dept ON
		dep_emp.dept_no = dept.dept_no AND
		dept.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN department_employees AS dep_emp ON
	emp.emp_no = dep_emp.emp_no
		INNER JOIN departments AS dept ON
		dep_emp.dept_no = dept.dept_no AND
		dept.dept_name IN ('Sales', 'Development') ;

-- List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name) AS counter
FROM employees
GROUP BY last_name
ORDER BY counter desc;


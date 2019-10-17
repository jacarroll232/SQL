-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select * from employees;

-- 2. List employees who were hired in 1986.
select * from employees
where hire_date 
BETWEEN '1986-01-01' AND '1986-12-31';

--Gets count of all employees based on employee ID
SELECT count(emp_no) AS Employee_Count FROM employees; --Total of 300024 Employees in 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT * from dept_manager; --dept_no, emp_no
Select * from departments; --dept_no
select * from employees; -- emp_no

-- --inner join on employees and dept_manager
SELECT e.emp_no, dm.dept_no, e.first_name, e.last_name, e.hire_date, dm.from_date, dm.to_date
FROM employees AS e
INNER JOIN dept_manager AS dm ON
    e.emp_no=dm.emp_no;

--complete inner joins of all parameters.
SELECT e.emp_no, dm.dept_no, dp.dept_name, e.last_name, e.first_name,
    e.hire_date, dm.from_date, dm.to_date
from employees e 
inner join dept_manager dm on e.emp_no=dm.emp_no
inner join departments dp on dm.dept_no=dp.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * from dept_employee; --dept_no, emp_no
Select * from departments; --dept_no
select * from employees; -- emp_no

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
from employees e 
inner join dept_employee de on e.emp_no=de.emp_no
inner join departments dp on de.dept_no=dp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name like 'Hercules' and last_name like 'B%';

--testing nested query on joined table.
select * from (select * from employees
where first_name like 'Hercules' and last_name like 'B%') as e
where hire_date between '1986-01-01' and '1986-12-31';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
from employees e 
inner join dept_employee de on e.emp_no=de.emp_no
inner join departments dp on de.dept_no=dp.dept_no
where dept_name ='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
from employees e 
inner join dept_employee de on e.emp_no=de.emp_no
inner join departments dp on de.dept_no=dp.dept_no
where dept_name = 'Development' or dept_name = 'Sales';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--count unique needed for this portion.
select 
	last_name,
	count (last_name)
from employees
group by last_name
order by count desc;
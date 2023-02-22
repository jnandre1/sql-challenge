create table departments(
	dept_no VARCHAR(4) not null primary key,
	dept_name VARCHAR not null
)
;
select *
from departments
;

Create table titles(
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title varchar not null
)
;
select *
from titles
;

Create table employees (
	emp_no INT primary key,
	emp_title VARCHAR not null references titles(title_id),
	birth_date date not null,
	first_name VARCHaR(50) NOT NULL,
	last_name VARCHAR(50) not null,
	sex varchar(1) not null,
	hire_date date not null
)
;
select *
from employees
;
create table dept_emp(
	emp_no INT references employees(emp_no),
	dept_no varchar REFERENCES departments(dept_no)
)
;

select *
from dept_emp
;

create table dept_manager(
	dept_no VARCHAR(4) REFERENCES departments(dept_no),
	emp_no INT references employees(emp_no)
)
;
select *
from dept_manager
;

create table salaries (
	emp_no INT references employees(emp_no),
	salary INT NOT NULL
);
select *
from salaries
;
select *
from employees
;
--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s ON
s.emp_no=e.emp_no
;
--

--List the first name, last name, and hire date for the employees who were hired in 1986

select first_name, last_name, hire_date
from employees
where hire_date >= '19860101'
	and hire_date < '19861231'
;

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name.
select *
from dept_manager
;
select * 
from departments
;
select *
from employees
;
select m.dept_no, m.emp_no, d.dept_name, e.first_name, e.last_name
from dept_manager as m
inner join departments as d
on d.dept_no=m.dept_no
inner join employees as e
on e.emp_no= m.emp_no
;
--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
select *
from employees
;
select *
from dept_emp
;
select * 
from departments
;
select de.emp_no, de.dept_no, d.dept_name, e.first_name, e.last_name
from dept_emp as de
inner join departments as d
on d.dept_no=de.dept_no
inner join employees as e
on e.emp_no= de.emp_no
;
--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B
select *
from employees
;
select first_name, last_name, sex
from employees
where first_name like 'Hercules'
	and last_name like 'B%'
;
--List each employee in the Sales department, including their employee number, last name, and first name.
select * 
from departments
;
--sales d007
select *
from dept_emp
;
select de.emp_no, de.dept_no, e.first_name, e.last_name
from dept_emp as de
inner join employees as e
on de.emp_no=e.emp_no
where dept_no like 'd007'
;

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select * 
from departments
;
--sales d007 development d005
select de.emp_no, de.dept_no, e.first_name, e.last_name, d.dept_name
from dept_emp as de
inner join employees as e
on de.emp_no=e.emp_no
inner join departments as d
on d.dept_no=de.dept_no
where d.dept_no like 'd007' or de.dept_no like 'd005'
;

--List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).
select last_name, count (last_name) as "Last Name"
from employees
group by last_name
order by "Last Name" DESC
;






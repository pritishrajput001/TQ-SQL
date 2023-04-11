use testdbc;
#1.	write a query to Get all employees with their respective departments
 select e.FIRST_NAME,e.LAST_NAME,e.DEPARTMENT_ID,d.DEPARTMENT_NAME
 from employees e, departmentS d
 where e.DEPARTMENT_ID=d.DEPARTMENT_ID;
 
#2.	Query to find no of males and females in each department 
SELECT e.*
from employees e
where 

#2. Write a query to find the names (first_name, last name), department ID and name of all the employees.  
SELECTe.first_name,e.last_name,e.department_id,d.department_name
FROM employees e 
JOIN departments d ON e.department_id = d.department_id;

#3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.  
select * from employees;
select * from departments;
select * from jobs;
select * from countries;
SELECT e.first_name,e.last_name,j.job_title,e.department_id,d.department_name,c.country_name 
FROM employees e JOIN jobs j join departments d join countries c
ON e.job_id = j.job_id and e.department_id = d.department_id and c.country_name = "London";

#4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).  
SELECT e.employee_id,e.last_name,e.manager_id,m.last_name as manager_name
FROM employees e JOIN employees m ON e.manager_id = m.employee_id;

#5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.  
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Jones')
ORDER BY hire_date;

#6. Write a query to get the department name and number of employees in the department.
SELECT departments.department_name,COUNT(*) AS num_employees
FROM departments
JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_id;

#or 
select department_name, count(*) as total
from employees e join departments d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID
group by e.DEPARTMENT_ID
order by total asc;
  
#7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
  SELECT employees.employee_id,jobs.job_title,DATEDIFF(job_history.end_date, job_history.start_date) AS duration_days
FROM job_history
JOIN employees ON job_history.employee_id = employees.employee_id
JOIN jobs ON job_history.job_id = jobs.job_id
WHERE job_history.department_id = 90;

#8. Write a query to display the department ID, department name and manager first name.  
SELECT departments.department_id, departments.department_name, employees.first_name AS manager_first_name
FROM departments
JOIN employees ON departments.manager_id = employees.employee_id;

#or

select department_id,d.DEPARTMENT_ID,e.FIRST_NAME
from departments d join employee e
on d.MANAGER_ID=e.EMPLOYEE_ID;



#9. Write a query to display the department name, manager name, and city.  
SELECT departments.department_name, CONCAT(managers.first_name, ' ', managers.last_name) AS manager_name,locations.city
FROM departments
JOIN employees AS managers ON departments.manager_id = managers.employee_id
JOIN locations ON departments.location_id = locations.location_id;

#or

select department_id,d.DEPARTMENT_ID,e.FIRST_NAME
from departments d join employee e join location l
on d.MANAGER_ID=e.EMPLOYEE_ID and d.LOCATION_ID=l.LOCATION_ID;


#10.Write a query to display the job title and average salary of  employees.  
SELECT departments.department_name, 
CONCAT(managers.first_name, ' ', managers.last_name) AS manager_name, 
locations.city
FROM departments
JOIN employees AS managers ON departments.manager_id = managers.employee_id
JOIN locations ON departments.location_id = locations.location_id;

#or

select JOB_TITLE,avg(SALARY) as Averagesal
from employees e join jobs j
on e.JOB_ID=j.JOB_ID
group by j.JOB_ID;

#11.Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.  
SELECT jobs.job_title, 
CONCAT(employees.first_name, ' ', employees.last_name) AS employee_name, 
employees.salary - jobs.min_salary AS salary_difference
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id;

#12.Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary 
SELECT job_history.* 
FROM job_history
JOIN employees ON job_history.employee_id = employees.employee_id
WHERE employees.salary > 10000;

#13.Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.  
SELECT departments.department_name, 
CONCAT(employees.first_name, ' ', employees.last_name) AS manager_name, 
employees.hire_date, 
employees.salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.employee_id = departments.manager_id AND DATEDIFF(CURRENT_DATE(), employees.hire_date) > 15*365;
#14.	In which city the Nikhil lives
#15.	Get the count of all employees where Nikhil as a manager 
#16.	Per job how many employess in marketing department get more than 40000
#17.	Get the name of the emp who getting the highest salary in dept 20
#18.	Get the employees who get the maximum salary amongst all managers 
#19.	List of all cities either they are in mp or up 
#20.	Get the count of all cities in india 
#21.	Sum salary of employee working in mumbai 
#22.	Get the list of the managers of the organization

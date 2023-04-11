
#Write a query to display first day of the month

select subdate(adddate(curdate(),interval 1 day), interval day(curdate()) day);

# write a query to display last day of the month

select subdate(adddate(curdate(), interval 1 month), interval day(curdate())day);

#  write a query to get first date of the current year

select extract(year from curdate());

select makedate(extract(year from curdate()),1);

# 
#use testdbc;
select FIRST_NAME, birth_date,date_format(from_days(datediff(curdate(),birth_date)),"%Y")+0
as Age from employees;


# show the employee names who have been hired in june

select date_format(hire_date,"%Y") as HireYear
from employees;

# Write a query to get years in which more than 10 employee joined

select first_name 
from employees
where year(hire_date)=1986;

#write a query to get employee id ,last name and date of first salary of the employee
select EMPLOYEE_ID,LAST_NAME,LAST_DAY(hire_date) as 'Date of first salary'
from employees;

# write a qury to get first_name , hire date and experience of the employees

select first_name, hire_date,datediff(curdate(),hire_date)/365 'EXPERIENCE'
FROM EMPLOYEES;

#update the salary of employees by 20 percent who are working in IT department
update employees e join departments d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID
set e.salary =e.salary+(0.2*e.salary)
where d.DEPARTMENT_NAME="IT";

use studentdb;

# increase salary of employees by 10% who are teaching more than one course
use studentdb;
update faculty f join coursefaculty cf
on f.Facultyid=cf.Facultyid
set f.salary=f.salary+(0.1*f.salary);

#Update the salary of faculty by 10% who is teaching "Java"

update faculty f join coursefaculty cf join cource c
on f.faculty_id =cf.faculty_id and 





# String functions

select length("java") from dual;

select concat("Rohit", " Khomane");

#check index

select instr("java", 'a');

#return substring(start, length)

select substr("hello", 3,4);

select substr("Programming", 3,4); # 4 characters from 3rd index

select substr("Programming", -3,2);

select length(concat("Rohit", " Khomane"));


select ascii('t');

select format("0.481","Percent");

select upper("java");

select lower("Program");

#repeat
select repeat("java",7);

# add @ gmail.com to all the employees

select * from employees;

update employees
set email = concat(email, "@gmail.com");

use bikedb;

select * from customer;

select if(gender like 'Female', concat("Mrs.", first_name),concat("Mr.",first_name))as firstname, last_name
from customer;


select  concat(if(gender like 'Female', concat("Mrs.", first_name),concat("Mr.",first_name)), " ",last_name) as 'Fullname'
from customer;

#Title case

select concat(upper(substring(first_name,1,1)), lower(substring(first_name,2, length(first_name)))) as TitleName
from customer;


# replace string

update customer 
set last_name= replace(last_name, "Gupta","Mittal");

select * from customer;

#All the employees working in a department
select DEPARTMENT_ID, group_concat (FIRST_NAME," ") AS EmployeeNames
from employees
group by DEPARTMENT_ID;



#findinset

select find_in_set("Delhi","Delhi,Mumbai,Chennai");
select find_in_set("Banglore","Delhi,Mumbai,Chennai");
select find_in_set("Chennai","Delhi,Mumbai,Chennai");

# Date and time

select curdate();


# show the firstname , id and experience of the employee in the company

select FIRST_NAME,EMPLOYEE_ID,datediff(curdate(),hire_date)/365 as EXPERIENCE
FROM employees;


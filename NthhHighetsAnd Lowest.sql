use testdbc;

select distinct(salary) from employees;

select distinct(salary) from employees
order by salary desc;

select count(distinct (SALARY))
from employees;

# 3rd highest
select distinct salary 
from employees e1
where 3=(select count(distinct (SALARY))
				from employees e2
                where e1.salary<=e2.salary);
                
# 4th highest
select distinct salary 
from employees e1
where 4=(select count(distinct(SALARY))
				FROM employees e2
                where e1.salary>=e2.salary);
                
select distinct salary 
from employees
order by salary desc
limit 2,1;

select min(salary) from
(select distinct(SALARY) FROM employees
order by SALARY desc
limit 3) as ThirdHighest;
                
select distinct (salary) from employees
order by salary asc
limit 4;

select max(SALARY) FROM
(SELECT distinct(Salary) from employees
order by salary asc
limit 4) as FourthLowest;





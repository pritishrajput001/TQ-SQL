#alter
use employeedatabase;
select*from employee;
select*from department;
select*from city;
select*from location;

select*from employee 
where ename like 'p%';

select*from employee
where email is not null;

select *from employee
where empsalary>75000;

select*from employee
where deptid=506;

select*from employee
where ename like 'r%';

select *from employee;
alter table employee
add column designetion text;
select *from employee;

select *from employee order by empsalary asc;

select *from employee order by empsalary desc;

select*from employee;
select deptid,count(*) as total from employee 
group by deptid order by deptid asc;

select *from employee;
alter table employee add column experince float;
update employee set empsalary = empsalary+(empsalary+0.2) 
where experince >=4;

select *from employee;
alter table employee add column experince float;
update employee set empsalary = empsalary+(empsalary+0.1) 
where experince >=3;

select *from employee where department 
in(select deptid from department 
where dname= "purchase");

select *from organizations;
select *from department
where cimpanyid in(select cimpaniyid from organizations
where companyname in ('LogicSoftech'));

select*from department;
select*from emplyee
where deptid in(select deptid from employee 
where deptid in ('501','502'));

select *from employee;
select count (deptid) as count from employee;

select *from employee;
select avg(empsalary) as average   from employee;

select*from employee;
select avg(empsalary) as average 
from employee where experience >=5;








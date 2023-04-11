use employeedatabase;

select*from employee;
select*from organizations;
select*from location;
select*from city;
select*from department;

alter table employee
add constraint fk_department
foreign key(deptid)
references department(deptid);



# index in sql
show index from faculty;
show index from student;
select *from faculty;

# index create

alter table faculty
add index(phoneNo);

select *from faculty
where phoneNo=8977665540;


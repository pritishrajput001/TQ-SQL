SELECT * FROM studentdb.faculty;

#Q1. Show all the student whose course id is either 103,102;
select*from student 
where courseid in(103,102);

#Q2Show student name whose name starts with s
select*from student 
where sname like 's%';

#Q3. Show all the faculty whose email id is not null
select *from faculty
where email is not null;

#Q4. Show the number of student in each course
select courseid ,count(*) as student 
from student
group by courseid;

#Q5. Show the numbers of courses according to duration
select duration, count(*) as course from
course group by duration;

select*from course;

#Q6. Increase the fees of all courses by 10%
update course
set fees = fees + (0.1*fees);
select*from course;

#Q7. Increase the salary of faculty by 20% whose 
update faculty set salary =salary+(0.2*salary) 
where experience>=5; 
select*from faculty;

#Q8Delete the course communication
select*from course;
delete from course where cname="Dotnet";
select*from course;

#Q9. Delete the students who has not paid the fees
select *from student;
delete from student where feesstatus="not paid";
select *from student;

#Q10.Show the faculty in desc order of salary
select*from faculty;
select*from faculty order by salary desc;

#Q11. Show the student in asc order of course id and if
#the course is same then desc order of joining date

select*from student
order by courseId asc;
select*from student;



#q12. Show the total student in each course in asc order
select*from student;
select courseId,count(*) as total
from student group by courseId order by courseId;

#q13. Add the column joining date in faculty
select*from faculty;
alter table faculty
add column location text;
select*from faculty;

#q14. Change the column to exp of experience
select*from faculty;
alter table faculty
change column exp experience float;
desc faculty;
select*from faculty;


#nested query

select *from student
where courseid(select courseid
from





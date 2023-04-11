# view in stuentdb

create view fees_issue as
select sid,sname,phoneNo,feesstatus
from student 
where feesstatus in("half","not paid");

select * from fees_issue;

drop view fees_issue;

# change id reflected
update student 
set feesstatus ="fully paid"
where sid=4;

# by using join

create view student_in_course as
select c.courseid,c.cname,count(s.sid)
from student s join course c
on s.courseid=c.courseid
group by s.courseid;

select * from student_in_course;
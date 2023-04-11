use studentdb;

# add number of student in each course

alter table course 
add column scount int
after fees;

# update the student count with already present data

update course
set scount =(select count(*)
			from student 
            group by courseid
            having course.courseid=student.courseid);
		
#course table
# before insert does not allow fees less than 20000;

/*CREATE DEFINER=`root`@`localhost` TRIGGER `course_BEFORE_INSERT` BEFORE INSERT ON `course` FOR EACH ROW BEGIN
if new.fees<20000
then 
signal sqlstate '26000'
set message_text="Fees should be greater than 20000";
end if;

END*/

insert into course
values (105,"Cloud computing","3 months",20000,0); 
use studentdb;

select*from student;
select*from course;

select s.sname,s.feesstatus
from student s join course c
on s.courseid = c.courseid and c.cname="Python";

# Show student whose faculty name is Medha

select s.sname, s.sid, s.feesstatus, f.FacName
from student s join coursefaculty cs join faculty f
on s.courseid= cs.courseId and cs.facultyId= f.facultyId and f.FacName ="Medha";

 # student details whose coursename is java
 select s.*,c.cname
 from student s join course c
 on s.courseid = c.courseid and c.cname="Java";
 
 # student details whose course duration is 3 months
 select s.*,c.cname,c.duration
 from student s join course c
 on s.courseid =c.courseid and c.duration="3 monhs";
 
  # Show the course who faculty salary is greater than 60000

  select c.cname,f.FacName,f.salary
  from course c join coursefaculty cs join faculty f
  on c.courseid =cs.courseid and cs.FacultyId=f.FacultyId and f.salary>60000;
  
  # Self join 
  # show the names of have faculty whose salary is greater than than salary of Shuruti
  select f1.FacName ,f1.salary
  from faculty f1 join faculty f2
  on f1.salary >f2.salary and f2.FacName="Shuruti";
  
  # Show the names whose experience is greater than jayshree
  select f1.FacName, f1.experience
  from faculty f1 join faculty f2
  on f1.experience > f2.experience and f2.FacName="Neha";
  
  # show facutly name whose salary is greater than average salary
  #> Better with subquery
  
  # shoe the course details where faculty id 3
  ALTER TABLE course
 RENAME COLUMN facultyId to FacultyId;
  
  select c.*
  from course c join coursefaculty cf join faculty f
  on c.courseid =cf.courseid and cf.FacultyId=  f.FacultyId and f.FacultyId=3;
  
  # show the faculty details who are teaching more than one course
  select f.*, count(cf.courseid) as TotalCourse
  from faculty f join coursefaculty cf
  on f.FacultyId = cf.FacultyId
  group by cf.FacultyId
  having TotalCourse>1;
 
 
 
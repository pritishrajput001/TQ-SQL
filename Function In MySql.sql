/*CREATE DEFINER=`root`@`localhost` FUNCTION `maxNumber`(a int ,b int ) RETURNS int
    DETERMINISTIC
BEGIN
if(a>b)
then return a;
else 
return b;
end if;
END*/

select maxNumber(10,4);


/*CREATE DEFINER=`root`@`localhost` FUNCTION `addNumbers`(a int, b int) RETURNS int
    DETERMINISTIC
BEGIN
declare ans int;
set ans= a+b;
return ans;
END
*/
select addNumbers(5,3);

/*CREATE DEFINER=`root`@`localhost` FUNCTION `powerNumber`(base int, pow int) RETURNS int
    DETERMINISTIC
BEGIN
 set @ans=1;
 while(pow>=1)
  do
   set @ans= @ans*base;
    set pow=pow-1;
  end while;  
RETURN @ans;
END
*/
select powerNumber(3,4);

/*CREATE DEFINER=`root`@`localhost` FUNCTION `experience`(hiredate date) RETURNS int
    DETERMINISTIC
BEGIN
return(year (curdate())-year (hiredate));
END*/

select employee_id,first_name,experience(hire_date) as 'experience'
from employees;

/*CREATE DEFINER=`root`@`localhost` FUNCTION `voteCheck`(birthdate date) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
set @age =year(curdate())=year(birthdate);
if(@age>=18)
then return 'Y';
else
return 'N';
end if;
END*/
use payroll;
select EMPLOYEE_ID,ename,voteCheck(birth_date) as 'VoteEligibility'
from employee;

/*CREATE DEFINER=`root`@`localhost` FUNCTION `experience`(hiredate date) RETURNS int
    DETERMINISTIC
BEGIN
return(year (curdate())-year (hiredate));
END*/

select employee_id,ename,experience(joining_date) as 'experience'
from employee;


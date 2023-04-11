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

select testdbc.voteCheck(23);
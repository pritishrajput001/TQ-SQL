create database bankdb;
use bankdb;

create table Bank (
    bank_id int primary key,
    name varchar(45) not null,
    Address varchar(45) not null,
    city varchar(45) not null,
    state varchar(45) not null
);

create table customer(
					  cust_id bigint primary key,
					  bank_id bigint
					 );
drop table customer;
alter table customer
add FOREIGN KEY (bank_id) REFERENCES bank (bankid);

# a)Display all bank name, cname , city from all  bank in ascending order
# of bankname  and descending order of city name 

select b.name as bank_name, cm.cname as customer_name, b.city
from Bank b
join Customer c on b.bank_id = c.bank_id
join Customer_Master cm on c.cust_id = cm.Cust_id
order by b.name asc, b.city desc ;

#b)write query to increase balance increase it by 25%  of existing balance for customer whose bank is SBI. 
update Accounts
set Balance = Balance+(0.25*Balance)
where cust_id in (
select c.cust_id
from Customer c join Bank b on c.bank_id = b.bank_id
where b.name = "SBI"
);

#c) find the count of SBI bank customers as per the city.

select b.city, count(c.cust_id) as sbi_customers
from Bank b
join Customer c on b.bank_id = c.bank_id
where b.name = 'SBI'
group by b.city; 

#d)find customer who credits amount more than 20000 in May.

select * from transaction;
select cm.cname
from customer_master cm
inner join customer  c on cm.cust_id = c.cust_id
inner join accounts  a on c.cust_id =a.cust_id
inner join transaction t on a.acc_no=t.acc_no
where t.amount >20000 AND month(t.date)=4 and year(2015);


#e)find the 3rd largest transaction from Axis bank.
select t.transaction_id,t.amount
from transaction t
join accounts a on t.acc_no=a.acc_no
join customer c on a.cust_id =c.cust_id
join bank b on c.bank_id=b.bank_id
where b.name = "AXIS"
ORDER BY t.amount desc
LIMIT 2,1;

#f)create procedure which display all  bank name of customer  whose pan_no is 'APS1023MA' and customer is senior citizen.

/*CREATE DEFINER=`root`@`localhost` PROCEDURE `displaybanknames`(IN pan_number VARCHAR(45))
BEGIN 
SELECT b.name FROM bank b 
JOIN customer c ON b.bank_id=c.bank_id
JOIN customer_master cm ON c.cust_id=cm.custid WHERE cm.pan_no=KPOUR8951Q AND DATEDIFF(NOW(),cm.birth_date)>=60;
END*/

#g) Find the number of customer on the basis of account type
select acc_type, COUNT(*)
from accounts a
join account_Type ba ON a.acctype_id = ba.acctype_id
group by acc_type;

#h) Display the time span of the account being opened

select * from customer_master;
select a.acc_no,cm.cust_id, cm.cname, datediff(curdate(),open_date),"%Y" AS days_open
from accounts a
JOIN customer_master cm ON a.cust_id = cm.cust_id;

#e) Display the accountno, balance, customer name, age of the customer
select a.Acc_no, a.Balance, cm.cname as customer_name, year(curdate()) - year(cm.birth_date) as age
from Accounts a
join Customer c on a.cust_id = c.cust_id
join Customer_Master cm on c.cust_id = cm.Cust_id;


use bikeshowroomdb;
ALTER TABLE model
 RENAME COLUMN modelid to model_id;

#1.	Add the column of email in customer
alter table customer
add column email varchar(28);

#2.	Show the number of bikes sold of a particular model
 select*from purchase;
 select count(*) as num_bikes_sold
from purchase where model_id =9005 ;
 

#3.	Show the total cost of each model name
select*from model;
select*from purchase;
select modelname, sum(mcost) as total_cost
from model
group by modelname;

# 4. Show the number of ratings of each model for each rating type in decreasing order:
select * from feedback_rating;
select * from model;

select * from purchase;
select model.modelname, feedback_rating.rating, count(*) as num_ratings
FROM model JOIN purchase ON model.model_id = purchase.model_id
JOIN feedback_rating ON purchase.rating_id = feedback_rating.rating_id
GROUP BY model.modelname, feedback_rating.rating
ORDER BY model.modelname, num_ratings DESC;

# 5 . Increasing the cost of each bike by 10%:
update model set mcost = mcost +(mcost * 0.1);

# 6 . Show the purchases whose booking amount is greater than 20,000
select * from purchase;
select * from Purchase where booking_amount > 20000;

# 7.  Show the customer whose mobile no is not given
select * from customer;
select * from customer where mobilenum is null;

# 8 . Show the average cost of all the model name
select * from model;
select avg(mcost) as average_cost from model;
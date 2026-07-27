show databases;
USE project_customer_segmentation;
SELECT * from customer;
describe customer;
select count(*) from customer;
show tables;
select count(*) as total_number from customer;
select * from customer limit 10;
describe customer;
select count(*) totalrows, sum(gender IS NUll) gendernull,
sum(invoice_no is null) invoicenull, sum(customer_id is null)cusromer_idnull,sum(age is null)agenull,
sum(category is null) catnull, sum(quantity is null) quannull, sum(price is null)pricenull, sum(payment_method is null)pay_metnull,
sum(invoice_date is null)inv_datenull, sum(shopping_mall is null)shopmalnull from customer;



# 1st question = How is shopping distribution according to gender?

select gender, count(*) as total_shopping from customer group by gender;



# 2nd question = Which gender did we sell more products to?

select gender, sum(quantity) as total_prod_sold from customer group by gender;


# 3rd question = which gender generaed more revenue?

select gender, sum(price*quantity) as Total_revenue from customer group by gender;


# 4th question  = distribution of purchase categary relaive to other columns

#1  category vs gender
select category, gender, count(*) as total_transa from customer group by category, gender order by category;

#2 category vs revenue
select category, sum(price*quantity) as total_revenue from customer group by category order by total_revenue desc;

#3 category vs quantity
select category,sum(quantity) as total_prod_sold from customer group by category order by total_prod_sold desc;

#4 category vs payment_method
select category, payment_method, count(*) as mode_of_transac from customer group by category,payment_method order by category;

#5 category vs shopping mall
select category, shopping_mall, count(*) as total_transac from customer group by category, shopping_mall order by category;




# question 5 how is shopping distributed according to age
select
case
when age between 15 and 25 then "15-25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "56+"
end as age_group, 
count(*) as total_trans
from customer group by age_group order by age_group;



# question 6 = which age cat we sell more products to
select 
case
when age between 18 and 25 then "18-25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "56+"
end as age_group,
sum(quantity) as total_pro_sold from customer
group by age_group order by age_group;



# question 7: which age cat generated more reveneu
select 
case
when age between 18 and 25 then "18-25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "56+"
end as age_group,
sum(quantity*price) as total_reveneu
from customer
group by age_group
order by total_reveneu desc;



# question 8 = distribution of purchase categories relative to other columns
# categoru vs age_group
select 
case
when age between 18 and 25 then "18-25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "56+"
end as age_group,category ,
count(*) as total_tan
from customer
group by category, age_group
order by total_tan , age_group desc;

# category vs shopping mall
select category, shopping_mall, count(*) as total_transac from customer group by category, shopping_mall order by category;



# question 9 does payment method have any relation with other column
# payment method vs gender
select payment_method, gender, count(*) as total_trans from customer group by payment_method, gender order by gender;

# payment method vs category
select payment_method, category, count(*) as total_tran from customer group by payment_method, category order by category;

# payment method vs age_group 
select 
case
when age between 18 and 25 then "18-25"
when age between 26 and 35 then"26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "56+"
end as age_group, payment_method,
count(*) as total_trans from customer 
group by age_group, payment_method 
order by total_trans;



# question 10 = how is the distribution of payment method
select payment_method, count(*) as pay_mode
from customer group by payment_method;



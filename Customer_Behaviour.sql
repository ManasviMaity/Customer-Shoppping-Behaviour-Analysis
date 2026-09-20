use customer_behavior;

select * from customer LIMIT 15;

-- toatl revenue by male vs female customers 
SELECT gender,SUM(purchase_amount) as Revenue 
from customer 
group by gender;

-- which customer used discount but still spent more than avgerage purchase amount 

select customer_id,purchase_amount 
from customer
WHERE discount_applied = 'Yes' and purchase_amount >
(select AVG(purchase_amount) from customer);

-- top 5 products with highest avg review rating 
select item_purchased , ROUND(AVG(review_rating),2) as "Average Product Rating"
from customer
GROUP BY item_purchased
ORDER BY AVG(review_rating) desc 
LIMIT 5;


-- Compare the avarage purchase amount between standard and express shipping 
select shipping_type ,ROUND(AVG(purchase_amount),2) as 'Avg purchase amount' from customer 
where shipping_type IN ('Standard','Express')
group by shipping_type ;


-- do  subscribered customer  spend more? compare avg spend and total revenue between subscribers and non subscribers 
select subscription_status , 
COUNT(customer_id) as total_customers, 
ROUND(AVG(purchase_amount),2) as avg_spend,
ROUND(SUM(purchase_amount),2) as total_revenue 
from customer
group by subscription_status 
order by total_revenue, avg_spend desc ; 


-- which 5 product have the highest % of purchases with discounts applied 

select item_purchased,
ROUND(SUM(case when discount_applied ='Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 , 2) as 'discount_rate' 
from customer 
group by item_purchased 
order by discount_rate
 desc LIMIT 5;
 
 -- segment customer into new , returning and loyal based on their total number of previous purchase and show the count of each segment 
 WITH customer_type as (
 SELECT customer_id , previous_purchases, 
 CASE When previous_purchases = 1 THEN 'New'
      when previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
      ELSE 'Loyal'
      END AS customer_segment 
from customer 
)
select customer_segment, count(*) as number_of_customer from customer_type 
group by customer_segment ;
 
 -- what are top 3 most purchased product within each category 
 with item_count as(
 select category, item_purchased, 
 COUNT(customer_id ) as total_orders ,
 ROW_NUMBER() OVER(PARTITION by category order by count(customer_id) DESC) as item_rank 
 from customer 
 group by category , item_purchased 
 )
 
 select item_rank, category, item_purchased , total_orders from item_count 
 where item_rank <=3;
 
 
 -- are customers who are repeat buyers (more than 5 previous purchase ) also likely to subscribe 
 select subscription_status , 
 count(customer_id ) as repeat_buyers
 from customer 
 where previous_purchases > 5 
 group by subscription_status ;
 
 -- Revenue Contribution of each age group 
 select age_group, sum(purchase_amount) as revenue 
 from customer 
 group by age_group 
 order by revenue desc ;
 
 
-- 1. Count the number of sales transactions for each product.  
--select count(*) from sh.sales
-- 2. Find the average sale amount for each product.
--select prod_id, avg(amount_sold) from sh.sales group by prod_id 
-- 3. Find the maximum and minimum sale amount for each product.
--select prod_id,max(amount_sold),min(amount_sold) from sh.sales group by prod_id
-- 4. Find the total revenue generated by each product.  
--select prod_id, sum(amount_sold) from sh.sales group by prod_id 
-- 5. Count the number of sales transactions for each customer. 
--select cust_id, count(*) from sh.sales group by cust_id
-- 6. Find the average sale amount per customer.  
--select cust_id, avg(amount_sold)as AVG_SAL from sh.sales group by cust_id
-- 7. Find the highest purchase amount for each customer.
--select cust_id, max(amount_sold) from sh.sales group by cust_id
-- 8. Find the lowest purchase amount for each customer.  
--select cust_id, min(amount_sold) from sh.sales group by cust_id
-- 9. Find the total revenue generated by each store location.  
--select c.cust_state_province, sum(amount_sold) from sh.sales s join sh.customers c on s.cust_id=c.cust_id group by s.cust_state_province -- need to ask what the store location
-- 10. Count the number of sales transactions for each region.  
--select cust_state_province,sum(amount_sold) from sales s join customers c on s.cust_id = c.cust_id group by cust_state_province
-- 11. Find the total revenue per region.  
--select cust_state_province, sum(amount_sold) from sh.sales s join sh.customers c on s.cust_id=c.cust_id group by c.cust_state_province
-- 12. Find the average sale amount per region.  
--select cust_state_province, avg(amount_sold) from sh.sales s join sh.customers c on s.cust_id=c.cust_id group by c.cust_state_province
-- 13. Count the number of sales per month.  
--select count(*) as sales from sh.sales group by extract(month from time_id)
-- 14. Find the total revenue per month.  
--select extract(month from time_id),sum(amount_sold) from sh.sales group by extract(month from time_id)
-- 15. Find the product that generated the highest revenue.  
--select prod_name from sh.sales s join sh.products p on p.prod_id = s.prod_id group by s.prod_id having amount_sold = max(s.amount_sold)
--select prod_name,id, max(amount) from (select prod_id as id, sum(amount_sold) as amount from sh.sales group by prod_id order by amount desc) s join sh.products p on p.prod_id=s.id -- need to ask about this
-- 16. Find the most frequently purchased product.  
-- 17. Find the most valuable customer based on total spending.  
-- 18. Find the total revenue per sales channel (e.g., online vs. offline).  
-- 19. Count the number of sales for each payment method.  
-- 20. Find the total revenue generated per payment method.  

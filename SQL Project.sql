select * from pizza_sales;

-- 1. Total Revenue: The sum of the total price of all pizza orders
 select sum(total_price) as "Total Revenue" from pizza_sales;
 
 -- 2. Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
 select sum(total_price)/sum(quantity) as "Average Order value" from pizza_sales;
 
 -- 3. Total Pizzas Sold: The sum of the quantities of all pizza sold.
select sum(quantity) as "Total pizzas sold" from pizza_sales;

-- 4. Total Orders: The total number of orders placed.
select count(order_id) as "Total Orders" from pizza_sales;

-- 5. Average Pizza Per Order: The average number of pizzas sold per order,
-- calculated by dividing the total number of pizzas sold by the total number of
-- orders
select sum(quantity)/count(order_id) as "Average Pizza per Order" from pizza_sales;

-- 6.. Daily trend for total Orders: Create a bar chart that displays the daily trend of
-- total orders over a specific time period. This chart will help us identify any
-- patterns or fluctuations in order volumes on a daily basis.

select count(order_id), order_date from pizza_sales group by order_date;

-- 7. Total Pizza Sold by Pizza Category: 
select pizza_category,sum(quantity) as "Total pizza sold" from pizza_sales group by pizza_category;

-- 8.Top 5 Best Sellers by Revenue, Total Quantity and Total Orders;
select pizza_name,sum(total_price) as "Revenue" from pizza_sales group by pizza_name order by sum(total_price) desc limit 5;
select pizza_name,sum(quantity) as "Total Quantity" from pizza_sales group by pizza_name order by sum(quantity) desc limit 5;
select pizza_name,count(order_id) as "Total Orders" from pizza_sales group by pizza_name order by count(order_id) desc limit 5;

-- 9.Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders;
select pizza_name,sum(total_price) as "Revenue" from pizza_sales group by pizza_name order by sum(total_price) limit 5;
select pizza_name,sum(quantity) as "Total Quantity" from pizza_sales group by pizza_name order by sum(quantity) limit 5;
select pizza_name,count(order_id) as "Total Orders" from pizza_sales group by pizza_name order by count(order_id) limit 5;

-- 10. Maximum price of pizza (TOP 10);
select  pizza_name,max(unit_price) from pizza_sales  group by pizza_name order by max(unit_price) desc limit 10;

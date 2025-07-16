create database Pizza_Sales

use Pizza_Sales

/*Retrieve the total number of orders placed.*/
select count(order_id) as total_orders from orders;

/*Calculate the total revenue generated from pizza sales.*/
select round(sum(order_details.quantity* pizzas.price),2) as total_revenue 
from order_details
join pizzas
on pizzas.pizza_id=order_details.pizza_id;

/*Identify the highest-priced pizza.*/
select top 1(pizzas.price),pizza_types.name from pizzas
join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
order by pizzas.price desc;

/*Identify the most common pizza size ordered.*/
select top 1 pizzas.size, count(order_details.order_details_id ) as order_count
from pizzas
join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size 
order by order_count desc;

/*List the top 5 most ordered pizza types along with their quantities.*/
select top 5 pizza_types.name,sum( order_details.quantity) as quantity
from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name
order by quantity desc;

/*Join the necessary tables to find the total quantity of each pizza category ordered.*/
select sum(order_details.quantity)as total_quantity,pizza_types.category
from pizzas
join order_details
on order_details.pizza_id=pizzas.pizza_id
join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category
order by total_quantity desc;

/*Join relevant tables to find the category-wise distribution of pizzas.*/
select category as category, count(name)
from pizza_types
group by category

/*Determine the top 3 most ordered pizza types based on revenue.*/
select top 3 pizza_types.name ,round(sum(order_details.quantity* pizzas.price),2) as total_revenue
from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.name 
order by total_revenue desc;


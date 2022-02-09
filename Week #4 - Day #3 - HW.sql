--Week 4 - Wednesday Questions



--1. List all customers who live in Texas (use JOINs)

select district, address.address_id, customer_id, first_name , last_name 
from address
join customer on address.address_id = customer.address_id 
where district = 'Texas'


--Answer: 5 total: - Customer ID[6 , 118 , 305 , 400 , 561]



--2. Get all payments above $6.99 with the Customer's Full Name

select payment.customer_id, amount , first_name , last_name 
from payment
join customer on payment.customer_id = customer.customer_id 
where amount > 6.99


--Answer: 1406 customers total



--3. Show all customers names who have made payments over $175(use subqueries)

select * 
from ( 
		select customer.customer_id, first_name, last_name, SUM(amount)
		from payment
		join customer on payment.customer_id = customer.customer_id 
		group by customer.customer_id
	) as aggregated_stuff
where sum > 175


--Answer: 6  Customers total



--4. List all customers that live in Nepal (use the city table)
select country, first_name , last_name  
from ( 
	select address_id , address.city_id , country 
	from ( 
			select city_id , country 
			from city
			join country on city.country_id = country.country_id 
		) as aggregated_stuff
	join address on address.city_id  = aggregated_stuff.city_id
) as next_stuff
join customer on next_stuff.address_id  = customer.address_id
where country = 'Nepal'



--Answer: 1 Customer [Kevin Schuler]




--5. Which staff member had the most transactions?

select staff_id, count(rental_id) as "Rentals Sold"
from rental
group by staff_id  



--Answer: Staff #1 with 8040



--6. How many movies of each rating are there?

select rating as "Rating", count(film_id) as "No. of Movies Per Rating"
from film
group by rating



--Answer: 5 Categories, PG-13 - 223 ; NC-17 - 210 ; R - 195 ; G - 178 ; PG - 194



--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select distinct first_name , last_name 
from(
	select payment.customer_id, amount , first_name , last_name 
	from payment
	join customer on payment.customer_id = customer.customer_id 
	where amount > 6.99
) as seven_plus


--Answer: 



--8. How many free rentals did our stores give away?

select amount, rental_id 
from payment
where amount = 0



--Answer: 24 Total



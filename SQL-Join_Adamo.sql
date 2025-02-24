use sakila;

#1. List the number of films per category.
select * from film_category; 
select * from category; 
	select count(fc.film_id) as film_count, fc.category_id
		from film_category fc
		join category c on fc.category_id = c.category_id
			group by fc.category_id;

#2. Display the first and the last names, as well as the address, of each staff member.
select * from staff; 
select * from address; 
	select s.first_name, s.last_name, s.staff_id, a.address
	from staff s
		join address a on s.address_id = a.address_id;

#3. Display the total amount rung up by each staff member in August 2005.
select * from staff;  
select * from payment; 
	select p.staff_id, sum(p.amount) AS total_amount
		from payment p
		join staff s on p.staff_id = s.staff_id
		where p.payment_date between '2005-08-01' and '2005-08-31'
			group by p.staff_id;

#4. List all films and the number of actors who are listed for each film.
select * from film_actor; 
select * from actor; 
	select fa.film_id, count(fa.actor_id) as number_actors
	from film_actor fa
	join actor a on fa.actor_id = a.actor_id
		group by fa.film_id;

#5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.
select * from payment; 
select * from customer; 
	select c.last_name, p.customer_id, sum(p.amount) as total_amount
	from payment p
	join customer c on p.customer_id = c.customer_id
	group by p.customer_id
		order by c.last_name asc;
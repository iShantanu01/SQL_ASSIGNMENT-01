use mavenmovies


-- Question-1= retrieve the first and the last names of the customers who have a postal code starting with '35'

select first_name,last_name from customer
where address_id in
(select address_id from address
where postal_code like '35%');


-- Question-2 = display the titles and the rental rate of films that have a rental rate between 2.00 and 3.00

select title,rental_rate from film
where rental_rate between 2.00 and 3.00;


-- Question-3 = list the names and release years of films released in the 21st century (after the year 2000)

select title,release_year from film
where release_year > 2000

-- Question-4 =find the actors whose last names contain the letter a.order the results alphabetically by last names

select first_name,last_name from actor_info
where last_name like '%a%'
order by last_name ;


-- Question-5 = retrieve the film titles and the rental duration of top longest films(order by the rental duarion)

select title,rental_duration from film
order by rental_duration desc
limit 5;

-- Question-6 =list the names of the customers who have made more than 20 rentals,ordered by the number of rental duration in decreasing order

select customer_id ,count(amount)from payment
group by customer_id
having count(amount) >20
order by count(amount) desc;


-- question-7 =display the first and last name of the actors who have appointed in at least 3 films,ordered by the number of films in decreasing order
-- ordered by the numbers of films in decreasing order

select first_name,last_name from actor a
 where (select count(film_id)
          from film_actor fa 
          where fa.actor_id= a.actor_id
          order by count(film_id) desc) >3 

-- Question-8 = find the films that have a replacement cost greater than 20.00 and a rental rate less than 3.00

select title,replacement_cost,rental_rate from film
where replacement_cost >20.00 and rental_rate <3.00;

-- Question-9 = retrieve the customer names and their total payments,ordered  by the total payments in decreasing order
-- and limit the result to 10 rows

select first_name,last_name ,sum(amount),customer.customer_id from customer
 inner join payment 
 on customer.customer_id = payment.customer_id
 group by customer_id
 order by customer_id desc
 limit 10

-- Question-10 = list the titles and the release year of the films released before 2005, ordered by release year in ascending order
-- and limit the rows to 5 rows

select title,release_year from film
order by release_year <2005 asc
limit 5;















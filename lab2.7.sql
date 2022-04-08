use sakila;

-- 1 -- How many films are there for each of the categories in the category table.

SELECT name,
COUNT(*) AS cnt
FROM category c
JOIN film_category f
ON f.category_id = c.category_id
GROUP BY name
ORDER BY cnt DESC
;

-- 2 -- Display the total amount rung up by each staff member in August of 2005.

SELECT * from payment;

SELECT first_name, last_name,
sum(amount) AS Amount
FROM staff s
JOIN payment p
using(staff_id)
WHERE payment_date >= '2005-08-01 00:00:00 AM' AND payment_date <= '2005-08-31 00:00:00 PM'
GROUP BY staff_id;

-- 3 --  Which actor has appeared in the most films?

SELECT * FROM ACTOR;
SELECT * FROM FILM_actor;

SELECT first_name, last_name,
COUNT(actor_id) AS Amount
FROM actor a
JOIN film_actor f
using(actor_id)
GROUP BY actor_id
ORDER BY Amount DESC
LIMIT 1;

-- 4 -- Most active customer (the customer that has rented the most number of films)

SELECT customer_id, first_name, last_name,
sum(customer_id) AS rented_films
FROM rental r
JOIN customer c
using (customer_id)
GROUP by customer_id
ORDER BY rented_films DESC
LIMIT 1;

-- 5 -- Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address FROM staff s
JOIN  address a  
ON a.address_id = s.address_id;

-- 6 -- List each film and the number of actors who are listed for that film.

SELECT title, COUNT(actor_id)
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;

-- 7 -- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT first_name,last_name, sum(amount)
from payment p
JOIN customer c 
ON p.customer_id = c.customer_id
GROUP by last_name
ORDER by last_name DESC;

-- 8 --
select * from film_category;
SELECT category_id, COUNT(film_id) as number_of_films
FROM film_category
GROUP BY category_id;
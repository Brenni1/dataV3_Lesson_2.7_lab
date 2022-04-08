use sakila;

-- 1 -- Write a query to display for each store its store ID, city, and country.

select store_id, city, country, address from store s -- added in address
JOIN address a USING(address_id)
JOIN city c USING(city_id)
JOIN country USING(country_id);

-- 2 -- Write a query to display how much business, in dollars, each store brought in.

select * from store s;
select * from customer;

select store_id, SUM(amount)
from store s
JOIN customer c USING (store_id)
JOIN payment p USING (customer_id)
GROUP by store_id;

-- 3 -- Which film categories are longest? -- Sports! (If the question is about the total playtime, not the avg. duration of the films)

select name, sum(length)
from film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
GROUP BY category_id
ORDER BY sum(length) DESC;

-- 4 -- Display the most frequently rented movies in descending order.

select title, COUNT(title) as rental_count
from rental
JOIN inventory USING(inventory_id)
JOIN film USING(film_id)
GROUP By film_id
ORDER BY rental_count DESC;

-- 5 -- List the top five genres in gross revenue in descending order.

select name as 'Genre', sum(amount) as 'Gross Revenue'
	from category 
	join film_category USING(category_id)
	join inventory USING(film_id)
	join rental USING(inventory_id)
	join payment USING(rental_id)
	group by category_id
	order by sum(amount) desc
	limit 5;
    
-- 6 -- Is "Academy Dinosaur" available for rent from Store 1?

-- 7 -- Get all pairs of actors that worked together.

select *
from film_actor fa1
join film_actor fa2 USING(film_id)
join actor a1 ON a1.actor_id = fa1.actor_id
join actor a2 ON a2.actor_id = fa2.actor_id
	WHERE a1.actor_id != a2.actor_id
		ORDER BY fa1.film_id;


SELECT DISTINCT
	fa1.film_id
    ,fa1.actor_id
    ,a.first_name
    ,a.last_name
    ,fa2.actor_id
    ,a1.first_name
    ,a1.last_name
FROM film_actor fa1
	JOIN film_actor fa2 ON fa2.film_id = fa1.film_id
    JOIN actor a ON a.actor_id = fa1.actor_id
    JOIN actor a1 ON a1.actor_id = fa2.actor_id
		WHERE a.actor_id != a1.actor_id
		ORDER BY fa1.film_id
;


-- 8 -- Get all pairs of customers that have rented the same film more than 3 times.

-- 9 -- For each film, list actor that has acted in more films.
-- Week 5 - Monday Questions 

-- 1. How many actors are there with the last name ‘Wahlberg’? 
SELECT COUNT(actor_id) FROM actor WHERE last_name = 'Wahlberg';

-- Answer = 2

-- 2. How many payments were made between $3.99 and $5.99? 

SELECT COUNT (payment_id) FROM payment WHERE amount BETWEEN 3.99 AND 5.99;

-- Answer = 5607

-- 3. What film does the store have the most of? (search in inventory) 

SELECT DISTINCT count(film.title) as COUNT, film.title
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
GROUP BY film.title
HAVING count(film.title) = 8
ORDER BY COUNT DESC, film.title;

-- Answer 8 and there's a lot of them

-- 4. How many customers have the last name ‘William’? 

SELECT COUNT(customer_id) FROM customer WHERE last_name = 'William';

-- Answer = 0

-- 5. What store employee (get the id) sold the most rentals? 

SELECT staff_id, count(rental_id)
FROM rental
GROUP BY staff_id;

-- Answer staff_id 1 = 8040

-- 6. How many different district names are there? 

SELECT count(DISTINCT district) FROM address;

-- Answer = 378

-- 7. What film has the most actors in it? (use film_actor table and get film_id) 

SELECT film_id, count(actor_id) as COUNT
FROM film_actor
GROUP BY film_id
ORDER BY COUNT DESC;

-- Answer = film 508 for 15 times

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 

SELECT COUNT(store_id) 
FROM customer 
WHERE last_name LIKE '%es' AND store_id = 1;

-- Answer = 13

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250) 

SELECT amount, count(payment_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(payment_id) > 250;

-- Answer = 3

-- 10. Within the film table, how many rating categories are there? And what rating has the most  movies total?

SELECT rating, count(film_id) as COUNT
FROM film
GROUP BY rating
ORDER BY COUNT DESC;

-- Answer:
-- 5 Rating Categories
-- PG-13 has the most with 223

# 1: List the number of films per category.

SELECT c.name, COUNT(fc.category_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY film_count DESC;

#  2:Display the first and the last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address_id, a.address
from staff s
join address a on s.address_id = a.address_id
limit 1000;

#  3:Display the total amount rung up by each staff member in August 2005.

SELECT
    s.staff_id,
    s.first_name,
    s.last_name,
    COUNT(r.rental_id) AS total_rentals,
    SUM(f.rental_rate) AS total_amount
FROM
    staff AS s
JOIN
    rental AS r ON s.staff_id = r.staff_id
JOIN
    inventory AS i ON r.inventory_id = i.inventory_id
JOIN
    film AS f ON i.film_id = f.film_id
WHERE
    MONTH(r.rental_date) = 8
    AND YEAR(r.rental_date) = 2005
GROUP BY
    s.staff_id, s.first_name, s.last_name;


#  4:List all films and the number of actors who are listed for each film.

SELECT
    film.film_id,
    film.title,
    COUNT(actor_film.actor_id) AS num_actors
FROM
    film
JOIN
    film_actor AS actor_film ON film.film_id = actor_film.film_id
GROUP BY
    film.film_id, film.title
ORDER BY
    film.film_id;

#  5:Using the payment and the customer tables as well as the JOIN command, list the total
# amount paid by each customer. List the customers alphabetically by their last names.

SELECT c.customer_id, c.last_name, sum(p.amount) as total_amount
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id, c.last_name
order by c.last_name asc;



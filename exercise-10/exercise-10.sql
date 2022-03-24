-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE

SELECT 
    EXTRACT(YEAR FROM payment_date) AS y,
    EXTRACT(MONTH FROM payment_date) AS m,
    EXTRACT(DAY FROM payment_date) AS d,
    rating,
    SUM(amount) as sum
FROM
    film
INNER JOIN 
    inventory
ON
    film.film_id = inventory.film_id
INNER JOIN
    rental
ON
    inventory.inventory_id = rental.inventory_id
INNER JOIN
    payment
ON
    rental.rental_id = payment.rental_id
GROUP BY
    CUBE(y, m, d, rating)
ORDER BY
     rating, y, m, d
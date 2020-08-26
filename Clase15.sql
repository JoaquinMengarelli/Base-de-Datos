CREATE OR REPLACE VIEW lista_de_clientes AS 
SELECT c.customer_id, CONCAT(c.first_name ,' ',c.last_name),  a.address, a.postal_code, a.phone,
ci.city, co.country, 
CASE WHEN c.active THEN "Activado" ELSE "Inactivo" END AS 'Activacion', c.store_id 
FROM customer c 
INNER JOIN address a USING(address_id)
INNER JOIN city ci USING(city_id)
INNER JOIN country co USING(country_id);

CREATE OR REPLACE VIEW detalles_films AS
SELECT f.film_id, f.title, f.description, GROUP_CONCAT(c.name,' ') AS 'categoria',
f.replacement_cost , f.`length`, f.rating, 
GROUP_CONCAT(CONCAT_WS(' ', a.first_name, a.last_name) SEPARATOR ', ') AS 'Actores'
FROM film f 
INNER JOIN film_actor fa USING(film_id)
INNER JOIN actor a USING(actor_id)
INNER JOIN film_category fc USING(film_id)
INNER JOIN category c USING(category_id)

CREATE OR REPLACE VIEW sales_by_film_category AS 
	SELECT category.name, COUNT(*) AS `total_rental` FROM category
		INNER JOIN film_category USING (category_id)
		INNER JOIN film USING (film_id)
		INNER JOIN inventory USING (film_id)
		INNER JOIN rental USING (inventory_id)
		GROUP BY category_id;

CREATE OR REPLACE VIEW sales_by_film_category AS
	SELECT COUNT(*) FROM rental
		INNER JOIN inventory USING (inventory_id)
		INNER JOIN film USING (film_id)
		INNER JOIN film_category USING (film_id)
		GROUP BY film_category.category_id;


CREATE OR REPLACE VIEW actor_information AS
	SELECT actor_id, first_name, last_name, COUNT(*) AS `films_acted_on` FROM actor
		INNER JOIN film_actor USING (actor_id)
		INNER JOIN film USING (film_id)
		GROUP BY actor_id;
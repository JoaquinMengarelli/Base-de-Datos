#1
INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES(1, 'Ignacio', 'Martinez', 'ignacio@gmail.com', 
(select max(address_id) from address 
inner join city using (city_id)
inner join country co using (country_id)
where co.country = "United States"),
1, CURDATE(), CURRENT_TIMESTAMP);


#2
INSERT INTO sakila.rental
(rental_date, inventory_id, customer_id, staff_id, last_update)
VALUES(CURRENT_TIMESTAMP, 
(select MAX(inventory_id) from inventory
inner join film using (film_id)
where film.title = "AGENT TRUMAN"),
1, 
(select staff_id from staff 
inner join store using (store_id)
where store.store_id = 2), CURRENT_TIMESTAMP);


#3
UPDATE sakila.film
SET release_year = 2001
WHERE rating = "G";


#4
set @inv_id = (
select i.inventory_id from inventory i
inner join film f using(film_id)
inner join rental r using(inventory_id)
where r.return_date is null
order by r.rental_date desc
limit 1);

UPDATE sakila.rental 
SET return_date = CURRENT_TIMESTAMP
WHERE inventory_id = @inv_id;


#5
DELETE FROM film WHERE title = "AGENT TRUMAN";
#	This query couldn't delete the film because
#	it has references on others tables.

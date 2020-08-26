SELECT title, rating FROM film
	WHERE length <= ALL (SELECT `length` FROM film);


#UPDATE film SET length = 46 WHERE film_id = 182;
SELECT title FROM film f1
	WHERE `length` < ALL (SELECT `length` FROM film f2
							  WHERE f2.film_id <> f1.film_id);


SELECT DISTINCT customer.*, address.address, payment.amount as 'lowest payment amount' FROM customer, payment, address
    WHERE customer.customer_id = payment.customer_id
    AND customer.address_id = address.address_id
    AND payment.amount <= ALL (SELECT amount FROM payment WHERE payment.customer_id = customer.customer_id);
    
   
   
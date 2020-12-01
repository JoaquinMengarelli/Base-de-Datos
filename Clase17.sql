# Ex 1
select *
from address a
inner join city c using (city_id)
inner join country c2 using (country_id)
where postal_code in ('40301','52625');
# 4ms

select *
from address a
inner join city c using (city_id)
inner join country c2 using (country_id)
where postal_code in ('59025','89668','28396');
# 4ms

create index postalCode 
on address(postal_code);
# 3ms


# Ex 2
# Run queries using actor table, searching for first and last name columns independently. Explain the differences and why is that happening?

select *
from actor a2
where first_name like 'P%';

select *
from actor a2
where last_name like 'G%';

# last name tiene un indice


#Ex 3
# Compare results finding text in the description on table film with LIKE and in the film_text using MATCH ... AGAINST. Explain the results.

select *
from film_text
where description like '%Epic%'
and description like '%Drama%';
# 6 rows - 5ms


select * 
from film_text
where match(title, description) against('Epic,Drama');
# 142 rows - 4ms

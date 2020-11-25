#1
create user data@'%' IDENTIFIED by "data_analyst"; 

#2
grant select, update, delete on sakila.* to 'data'@'%';

#4 si anda xd
update film 
set title = "tituloreloco"
where title = "ACADEMY DINASAUR"

#5 
revoke update on sakila.* from 'data'@'%'
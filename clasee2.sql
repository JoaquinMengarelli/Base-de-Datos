# Base-de-Datos
CREATE DATABASE IF NOT EXISTS imdb;
USE imdb;

DROP TABLE IF EXISTS film, actor, film_actor;

CREATE TABLE film (
	film_id SMALLINT NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	description TEXT, 
	release_year YEAR,
	PRIMARY KEY (film_id)
);

CREATE TABLE actor (
	actor_id SMALLINT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor (
	actor_id SMALLINT NOT NULL,
	film_id SMALLINT NOT NULL,
	PRIMARY KEY  (actor_id, film_id)
);

ALTER TABLE film
	ADD last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE actor
	ADD last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE film_actor 
	ADD CONSTRAINT fk_film_actor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id);

ALTER TABLE film_actor
	ADD CONSTRAINT fk_film_actor_film FOREIGN KEY (film_id) REFERENCES film (film_id);


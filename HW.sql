use sakila;
SELECT * FROM actor;

SELECT first_name, last_name FROM actor;

SELECT actor_id,first_name, last_name 
FROM actor
WHERE first_name LIKE 'Joe';

SELECT actor_id,first_name, last_name 
FROM actor
WHERE last_name LIKE '%GEN%';

SELECT actor_id,first_name, last_name 
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

SELECT country_id,country 
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor
ADD COLUMN description blob AFTER last_name;

ALTER TABLE actor
DROP COLUMN description;

SELECT last_name, count(last_name) 
FROM actor
group by last_name;

SELECT last_name, count(last_name) 
FROM actor
group by last_name
having count(last_name) > 1;

UPDATE actor
SET first_name = 'HARPO'
where last_name = 'WILLIAMS' and first_name = 'GROUCHO';

UPDATE actor
SET first_name = 'GROUCHO'
where last_name = 'WILLIAMS' and first_name = 'HARPO';

CREATE TABLE `address` (
  `address_id` int (10)  NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` geometry NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

SELECT s.first_name, s.last_name, a.address, a.district, a.postal_code
FROM sakila.staff s, sakila.address a
where s.address_id = a.address_id;

SELECT s.first_name, s.last_name, 
	(Select SUM(p.amount) from sakila.payment p where p.staff_id = s.staff_id 
    AND YEAR(p.payment_date) = 2005
    ) AS Total_Amount
FROM sakila.staff s;

SELECT f.title, count(a.actor_id) 
FROM sakila.film f, sakila.film_actor a
WHERE f.film_id = a.film_id
GROUP BY f.title;

SELECT f.title, count(i.inventory_id) 
	FROM inventory i, film f
	where i.film_id = f.film_id
    and f.title =  'Hunchback Impossible'
	group by f.title;



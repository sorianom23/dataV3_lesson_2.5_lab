-- 1. Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name = "Scarlett";

-- 2. How many films (movies) are available for rent and how many films have been rented?
-- 958 Films are available for rent
-- 4580 have been rented
select * from sakila.rental;
select * from sakila.inventory;
select count(distinct film_id) from sakila.inventory;
select count(distinct inventory_id) from sakila.rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
-- Longest Movie Duration is: 185mins
-- Shortest Movie Duration is: 46mins
select * from sakila.film;
select MAX(length) as "Longest Movie Duration", MIN(length) as "Shortest Movie Duration" from sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
-- Average movie duration is 115h and 16mins
select * from sakila.film;
SELECT round(avg(length)) AS hours, round((avg(length)-round(avg(length)))*60) AS minutes FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
-- There are 121
select count(distinct last_name) from sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
-- The company has been operation for 266 days
select * from sakila.rental;
select datediff((select max(rental_date) from sakila.rental),
	(select min(rental_date) from sakila.rental));


-- 7. Show rental info with additional columns month and weekday. Get 20 results.
select *,
date_format(rental_date, '%M') as 'month',
date_format(rental_date, '%d') as 'weekday'
from sakila.rental
limit 20;


-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
--    Weekday() -> 1 is denoted for Sunday and 7 for Saturday
select * from sakila.rental;
select rental_date as 'weekend'
where weekday(rental_date) = 6 OR weekday(rental_date) = 7
from sakila.rental;


-- Control how the date is going to be displayed. "%d" -> day, "%m" -> month, "%Y" -> year
SELECT *, date_format(CONVERT(left(issued,6),date), '%d-%m-%Y') AS 'issued_date' FROM bank.card;
-- "%M" -> month in letters
-- "%y" -> just two digits
SELECT *, date_format(CONVERT(left(issued,6),date), '%d-%M-%y') AS 'issued_date' FROM bank.card;

-- 9. Get release years.
select title as 'Title', release_year as 'Release years' from sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
select title as 'Films' from sakila.film where (lower(title) like '%ARMAGEDDON%');

-- 11. Get all films which title ends with APOLLO.
select title as 'Films' from sakila.film where (lower(title) like '%APOLLO');

-- 12. Get 10 the longest films.
select title, length from sakila.film
order by length DESC
limit 10;

-- 13. How many films include Behind the Scenes content?
select * from sakila.film;
select count(film_id) from sakila.film
where special_features like '%Behind the Scenes%';

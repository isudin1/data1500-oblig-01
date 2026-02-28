-- ============================================================================
-- TEST-SKRIPT FOR OBLIG 1
-- ============================================================================

-- Kjør med: docker-compose exec postgres psql -h -U admin -d data1500_db -f test-scripts/queries.sql

-- En test med en SQL-spørring mot metadata i PostgreSQL (kan slettes fra din script)
select nspname as schema_name from pg_catalog.pg_namespace;

-- OPPGAVE 1 
 SELECT *
 FROM bike;


 --OPPGAVE 2
SELECT last_name, first_name, phone_number
FROM customer
ORDER BY last_name;

-- OPPGAVE 3
SELECT bike.bike_id
FROM bike
JOIN rental
ON bike.bike_id = rental.bike_id
WHERE rental.start_time > '2023-04-01';

-- OPPGAVE 4
SELECT COUNT(*) AS nr_of_customers
FROM customer;

-- OPPGAVE 5
SELECT customer.first_name, customer.last_name,
COUNT (rental.rental_id) AS antall_utleier
FROM customer 
LEFT JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY customer.last_name;

-- OPPGAVE 6
SELECT first_name, last_name
FROM customer
LEFT JOIN rental
ON customer.customer_id = rental.customer_id
WHERE rental.rental_id IS NULL;

--OPPGAVE 7
SELECT bike.bike_id
FROM bike
LEFT JOIN rental
ON bike.bike_id = rental.bike_id
WHERE rental.rental_id IS NULL
ORDER BY bike.bike_id;

--OPPGAVE 8 



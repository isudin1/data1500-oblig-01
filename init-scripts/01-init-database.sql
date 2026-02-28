-- ============================================================================
-- DATA1500 - Oblig 1: Arbeidskrav I våren 2026
-- Initialiserings-skript for PostgreSQL
-- ============================================================================

-- Opprett grunnleggende tabeller



CREATE TABLE station(
    station_id INTEGER PRIMARY KEY,
    station_name VARCHAR(50)
);


CREATE TABLE bike_lock(
    lock_id INTEGER PRIMARY KEY,
    station_id INTEGER,
    FOREIGN KEY (station_id) REFERENCES station(station_id)
);

CREATE TABLE bike(
    bike_id INTEGER PRIMARY KEY,
    lock_id INTEGER,
    FOREIGN KEY (lock_id) REFERENCES bike_lock(lock_id)
);


CREATE TABLE customer(
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE CHECK (email LIKE '%@%'),
    phone_number VARCHAR(8) CHECK (length(phone_number) = 8)
);


CREATE TABLE rental(
    rental_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    bike_id INTEGER,
    start_time TIMESTAMP,
    end_time TIMESTAMP CHECK (end_time IS NULL OR end_time > start_time),
    belop NUMERIC CHECK (belop >= 0),

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (bike_id) REFERENCES bike(bike_id)
);






-- Sett inn testdata

INSERT INTO station (station_id, station_name) VALUES
(1,'Sentrum'),
(2,'Universitetet'),
(3,'Togstasjonen'),
(4,'Biblioteket'),
(5,'Parken');




INSERT INTO bike_lock (lock_id, station_id)
SELECT i, ((i-1) % 5) + 1
FROM generate_series(1,100) AS i;


INSERT INTO bike (bike_id, lock_id)
SELECT i, i
FROM generate_series(1,100) AS i;


INSERT INTO customer (customer_id, first_name, last_name, email, phone_number) VALUES
(1,'Ali','Hassan','ali@mail.no','90000001'),
(2,'Sara','Olsen','sara@mail.no','90000002'),
(3,'Jonas','Berg','jonas@mail.no','90000003'),
(4,'Emma','Nilsen','emma@mail.no','90000004'),
(5,'Omar','Ahmed','omar@mail.no','90000005');




INSERT INTO rental (rental_id, customer_id, bike_id, start_time, end_time, belop) VALUES
(1,1,1,'2023-02-01 08:00','2026-02-01 08:45',49),
(2,2,2,'2023-02-01 09:00','2026-02-01 09:30',39),
(3,3,3,'2024-02-01 10:00','2026-02-01 10:50',55),
(4,4,4,'2025-02-02 08:00','2026-02-02 08:40',45),
(5,5,5,'2026-02-02 09:00','2026-02-02 09:35',35),
(6,1,6,'2026-02-02 10:00','2026-02-02 10:55',60),
(7,2,7,'2026-02-03 08:00','2026-02-03 08:30',30),
(8,3,8,'2026-02-03 09:00','2026-02-03 09:45',48),
(9,4,9,'2026-02-03 10:00','2026-02-03 10:40',44),
(10,5,10,'2026-02-04 08:00','2026-02-04 08:50',52),
(11,1,11,'2026-02-04 09:00','2026-02-04 09:35',35),
(12,2,12,'2026-02-04 10:00','2026-02-04 10:30',30),
(13,3,13,'2026-02-05 08:00','2026-02-05 08:45',49),
(14,4,14,'2026-02-05 09:00','2026-02-05 09:55',60),
(15,5,15,'2026-02-05 10:00','2026-02-05 10:35',35),
(16,1,16,'2026-02-06 08:00','2026-02-06 08:40',45),
(17,2,17,'2026-02-06 09:00','2026-02-06 09:50',55),
(18,3,18,'2026-02-06 10:00','2026-02-06 10:20',25),
(19,4,19,'2026-02-07 08:00','2026-02-07 08:45',49),
(20,5,20,'2026-02-07 09:00','2026-02-07 09:30',39),
(21,1,21,'2026-02-07 10:00','2026-02-07 10:50',55),
(22,2,22,'2026-02-08 08:00','2026-02-08 08:40',45),
(23,3,23,'2026-02-08 09:00','2026-02-08 09:35',35),
(24,4,24,'2026-02-08 10:00','2026-02-08 10:55',60),
(25,5,25,'2026-02-09 08:00','2026-02-09 08:30',30),
(26,1,26,'2026-02-09 09:00','2026-02-09 09:45',48),
(27,2,27,'2026-02-09 10:00','2026-02-09 10:40',44),
(28,3,28,'2026-02-10 08:00','2026-02-10 08:50',52),
(29,4,29,'2026-02-10 09:00','2026-02-10 09:35',35),
(30,5,30,'2026-02-10 10:00','2026-02-10 10:30',30),
(31,1,31,'2026-02-11 08:00','2026-02-11 08:45',49),
(32,2,32,'2026-02-11 09:00','2026-02-11 09:55',60),
(33,3,33,'2026-02-11 10:00','2026-02-11 10:35',35),
(34,4,34,'2026-02-12 08:00','2026-02-12 08:40',45),
(35,5,35,'2026-02-12 09:00','2026-02-12 09:50',55),
(36,1,36,'2026-02-12 10:00','2026-02-12 10:20',25),
(37,2,37,'2026-02-13 08:00','2026-02-13 08:45',49),
(38,3,38,'2026-02-13 09:00','2026-02-13 09:30',39),
(39,4,39,'2026-02-13 10:00','2026-02-13 10:50',55),
(40,5,40,'2026-02-14 08:00','2026-02-14 08:40',45),
(41,1,41,'2026-02-14 09:00','2026-02-14 09:35',35),
(42,2,42,'2026-02-14 10:00','2026-02-14 10:55',60),
(43,3,43,'2026-02-15 08:00','2026-02-15 08:30',30),
(44,4,44,'2026-02-15 09:00','2026-02-15 09:45',48),
(45,5,45,'2026-02-15 10:00','2026-02-15 10:40',44),
(46,1,46,'2026-02-16 08:00','2026-02-16 08:50',52),
(47,2,47,'2026-02-16 09:00','2026-02-16 09:35',35),
(48,3,48,'2026-02-16 10:00','2026-02-16 10:30',30),
(49,4,49,'2026-02-17 08:00','2026-02-17 08:45',49),
(50,5,50,'2026-02-17 09:00','2026-02-17 09:55',60);




-- DBA setninger (rolle: kunde, bruker: kunde_1)
CREATE ROLE customer;

CREATE ROLE customer_1 WITH LOGIN PASSWORD '1234';

GRANT customer TO customer_1;

GRANT CONNECT ON DATABASE postgres TO customer;

GRANT USAGE ON SCHEMA public TO customer;

GRANT SELECT ON station TO customer;
GRANT SELECT ON bike_lock TO customer;
GRANT SELECT ON bike TO customer;
GRANT SELECT ON customer TO customer;


REVOKE ALL ON rental FROM customer;

CREATE VIEW my_rentals AS
SELECT *
FROM rental
WHERE customer_id = 1;

GRANT SELECT ON my_rentals TO customer;


-- Eventuelt: Opprett indekser for ytelse



-- Vis at initialisering er fullført (kan se i loggen fra "docker-compose log"
SELECT 'Database initialisert!' as status;
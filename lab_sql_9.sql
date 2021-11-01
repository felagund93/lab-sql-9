SELECT * FROM rental;

SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'rental' AND COLUMN_NAME = 'rental_date';
  
SHOW FIELDS FROM rental;

DROP TABLE IF EXISTS rentals_may;

CREATE TABLE rentals_may (
  `rental_id` int UNIQUE NOT NULL AUTO_INCREMENT,
  `rental_day` tinyint DEFAULT NULL,
  `rental_time` timestamp DEFAULT NULL,
  `inventory_id` mediumint unsigned DEFAULT NULL,
  `customer_id` smallint unsigned DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned DEFAULT NULL,
  `last_update` timestamp DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT PRIMARY KEY (rental_id)
);

SELECT rental_id, EXTRACT(DAY FROM rental_date) AS rental_day, EXTRACT(HOUR_SECOND FROM rental_date) AS rental_time,  inventory_id, customer_id, return_date, staff_id 
FROM rental WHERE MONTH(rental_date) = 5;

INSERT INTO rentals_may (rental_id, rental_day, rental_time, inventory_id, customer_id, return_date, staff_id)
SELECT rental_id, EXTRACT(DAY FROM rental_date), EXTRACT(HOUR_SECOND FROM rental_date),  inventory_id, customer_id, return_date, staff_id 
FROM rental WHERE MONTH(rental_date) = 5;
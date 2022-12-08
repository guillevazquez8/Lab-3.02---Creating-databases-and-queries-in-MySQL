-- Activity 3: get the total number of flights in the database -----------------------------------------------------------------------------------------------
SELECT 
	COUNT(*) 
FROM 
	flights;

-- 4: get the average flight distance -----------------------------------------------------------------------------------------------------------------
SELECT 
	AVG(flight_mileage) 
FROM 
	flights;

-- 5: get the average number of seats ------------------------------------------------------------------------------------------------------------------
SELECT
	AVG(aircraft_total_seats) 
FROM 
	aircrafts;

-- 6: get the average number of miles flown by customers grouped by status ----------------------------------------------------------------------------
SELECT 
	customer_status, AVG(customer_total_mileage)
FROM 
	customers
GROUP BY customer_status;

-- 7: get the maximum number of miles flown by customers grouped by status ------------------------------------------------------------------------------
SELECT 
	customer_id, customer_name, customer_status, MAX(customer_total_mileage)
FROM 
	customers
GROUP BY customer_status;

-- 8: get the total number of aircraft with a name containing Boeing --------------------------------------------------------------------------------------
SELECT 
	COUNT(*) 
FROM 
	aircrafts
WHERE aircraft_model LIKE 'Boeing%';

-- 9: find all flights with a distance between 300 and 2000 miles ----------------------------------------------------------------------------------------
SELECT 
	flight_id, flight_number, flight_mileage 
FROM 
	flights
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10: find the average flight distance booked grouped by customer status ---------------------------------------------------------------------------------
SELECT
	customer_status, AVG(flight_mileage)
FROM
	customer_details
INNER JOIN	
	flights ON customer_details.flight_id = flights.flight_id
INNER JOIN 
	customers ON customers.customer_id = customer_details.customer_id
GROUP BY customer_status;

-- 11: find the most often booked aircraft by gold status members ----------------------------------------------------------------------------------------
SELECT
	customer_status, aircraft_id,
    COUNT(aircraft_id) AS aircrafts_booked
FROM 
	customer_details
INNER JOIN	
	flights ON customer_details.flight_id = flights.flight_id
INNER JOIN 
	customers ON customers.customer_id = customer_details.customer_id
WHERE
	customer_status = 'Gold'
GROUP BY 
	aircraft_id
ORDER BY
	aircrafts_booked DESC LIMIT 1;



-- Activity 3: get the total number of flights in the database -----------------------------------------------------------------------------------------------
SELECT 
	COUNT(*) 
FROM 
	flights;

-- 4: get the average flight distance -----------------------------------------------------------------------------------------------------------------
SELECT 
	AVG(flightMileage) 
FROM 
	flights;

-- 5: get the average number of seats ------------------------------------------------------------------------------------------------------------------
SELECT
	AVG(aircraftTotalSeats) 
FROM 
	aircrafts;

-- 6: get the average number of miles flown by customers grouped by status ----------------------------------------------------------------------------
SELECT 
	customerStatus, AVG(customerTotalMileage)
FROM 
	customers
GROUP BY customerStatus;

-- 7: get the maximum number of miles flown by customers grouped by status ------------------------------------------------------------------------------
SELECT 
	customerID, customerName, customerStatus, MAX(customerTotalMileage)
FROM 
	customers
GROUP BY customerStatus;

-- 8: get the total number of aircraft with a name containing Boeing --------------------------------------------------------------------------------------
SELECT 
	COUNT(*) 
FROM 
	aircrafts
WHERE aircraftModel LIKE 'Boeing%';

-- 9: find all flights with a distance between 300 and 2000 miles ----------------------------------------------------------------------------------------
SELECT 
	flightID, flightNumber, flightMileage 
FROM 
	flights
WHERE flightMileage BETWEEN 300 AND 2000;

-- 10: find the average flight distance booked grouped by customer status ---------------------------------------------------------------------------------
SELECT
	customerStatus, AVG(flightMileage)
FROM
	customerDetails
INNER JOIN	
	flights ON customerDetails.flightID = flights.flightID
INNER JOIN 
	customers ON customers.customerID = customerDetails.customerID
GROUP BY customerStatus;

-- 11: find the most often booked aircraft by gold status members ----------------------------------------------------------------------------------------
SELECT
	customerStatus, aircraftID,
    COUNT(aircraftID) AS aircraftsBooked
FROM 
	customerDetails
INNER JOIN	
	flights ON customerDetails.flightID = flights.flightID
INNER JOIN 
	customers ON customers.customerID = customerDetails.customerID
WHERE
	customerStatus = 'Gold'
GROUP BY 
	aircraftID
ORDER BY
	aircraftsBooked DESC LIMIT 1;



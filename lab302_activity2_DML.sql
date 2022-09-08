-- Activity 3 ---------------------
SELECT 
	COUNT(*) 
FROM 
	flights;

-- 4 -----------------------------
SELECT 
	AVG(flightMileage) 
FROM 
	flights;

-- 5 -------------------------------
SELECT
	AVG(aircraftTotalSeats) 
FROM 
	aircrafts;

-- 6 --------------------------------
SELECT 
	customerStatus, AVG(customerTotalMileage)
FROM 
	customers
GROUP BY customerStatus;

-- 7 ------------------------------------
SELECT 
	customerID, customerName, customerStatus, MAX(customerTotalMileage)
FROM 
	customers
GROUP BY customerStatus;

-- 8 -----------------------------------
SELECT 
	COUNT(*) 
FROM 
	aircrafts
WHERE aircraftModel LIKE 'Boeing%';

-- 9 ----------------------------------
SELECT 
	flightID, flightNumber, flightMileage 
FROM 
	flights
WHERE flightMileage BETWEEN 300 AND 2000;

-- 10 --------------------------------
SELECT
	customerStatus, AVG(flightMileage)
FROM
	customerDetails
INNER JOIN	
	flights ON customerDetails.flightID = flights.flightID
INNER JOIN 
	customers ON customers.customerID = customerDetails.customerID
GROUP BY customerStatus;

-- 11 -----------------------------------
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



-- Single-Row Subqueries 1
SELECT TrackId, name, MAX(Milliseconds)
FROM tracks;

-- Single-Row Subqueries 2
SELECT TrackId, name, MIN(Milliseconds)
FROM tracks;

-- Single-Row Subqueries 2
SELECT TrackId, name, Bytes, ROUND((SELECT AVG(Bytes) FROM tracks),2) AS Gen_Average
FROM tracks
WHERE Bytes > Gen_Average
ORDER BY Bytes DESC;

-- Multiple-Row Subqueries 1
SELECT CustomerId, FirstName, LastName
FROM customers
WHERE SupportRepId IN 
	(SELECT EmployeeId FROM employees WHERE FirstName="Jane" AND LastName="Peacock")
	OR SupportRepId IN 
	(SELECT EmployeeId FROM employees WHERE FirstName="Margaret" AND LastName="Park");
	
-- Multiple-Row Subqueries 2
SELECT CustomerId, customers.FirstName, customers.LastName
FROM customers
INNER JOIN employees ON customers.SupportRepId = employees.EmployeeId
WHERE employees.FirstName="Jane" AND employees.LastName="Peacock"
	OR employees.FirstName="Margaret" AND employees.LastName="Park"
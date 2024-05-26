-- SQL Practice Problems from LeetCode

-- 584. Find Customer Referee
statement below
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS null;

-- 595. Big Countries
SELECT A.name, A.population, A.area
FROM World A
WHERE area >= 3000000
OR population >= 25000000;

-- 1148. Article Views Istatement below.
SELECT DISTINCT A.author_id AS id
FROM Views A
WHERE author_id = viewer_id 
ORDER BY author_id ASC

-- 1683. Invalid Tweets: Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;


-- 1378. Replace Employee ID With The Unique Identifier: Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
SELECT EU.unique_id, E.name 
FROM Employees E
LEFT JOIN EmployeeUNI EU
ON E.id = EU.id;

-- 1068. Product Sales Analysis I: Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
SELECT product_name, year, price
FROM Sales S
JOIN Product P
ON S.product_id = P.product_id;

-- 1581. Customer Who Visited but Did Not Make Any Transactions: Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
-- NOTE: If no visit ID then there is no transact. for customer on visit
SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;

-- 197. Rising Temperature: Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

-- DATEDIFF condition ensures that the difference between the dates of a.recordDate and b.recordDate is exactly one day (i.e. = 1)

SELECT a.id AS Id
FROM Weather a
JOIN Weather b
ON a.Temperature > b.Temperature
WHERE DATEDIFF(a.recordDate, b.recordDate) = 1;

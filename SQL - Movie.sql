SELECT *
FROM movie_data_sql;

CREATE TABLE movie_clean
AS
SELECT *
FROM movie_data_sql;

SELECT *
FROM movie_clean;

SELECT COUNT(*)
FROM movie_clean;

SELECT COUNT(*) AS Total_Rows
From movie_clean;

SHOW Columns
FROM movie_clean;

describe movie_clean;

SELECT `Movie Title`,
COUNT(*) AS DUPLICATE_COUNT
FROM movie_clean
GROUP BY `Movie Title`
HAVING COUNT(*)>1;

SELECT *
FROM movie_clean
WHERE `Movie Title` IS NULL;

UPDATE movie_clean
SET `Movie Title`= TRIM(`Movie Title`);

UPDATE movie_clean
SET `Genre`= TRIM(`Genre`);

UPDATE movie_clean
SET `Genre`= UPPER(`Genre`);

UPDATE movie_clean
SET Genre = CONCAT(
    UPPER(LEFT(Genre, 1)),
    LOWER(SUBSTRING(Genre, 2))
);

SELECT Budget
FROM movie_clean;

UPDATE movie_clean
SET Budget = REPLACE(Budget,',','');


UPDATE movie_clean
SET Budget = REPLACE(Budget, "$", '');

UPDATE movie_clean
SET `Budget`= TRIM(`Budget`);

SELECT Revenue
FROM movie_clean;

UPDATE movie_Clean
SET Revenue = REPLACE(Revenue, "$", '');
UPDATE movie_Clean
SET Revenue = REPLACE(Revenue, ",", '');

UPDATE movie_clean
SET `Revenue`= TRIM(`Revenue`);

ALTER TABLE movie_clean
MODIFY Budget DECIMAL(15,2);

ALTER TABLE movie_clean
MODIFY Revenue DECIMAL(15,2);

ALTER TABLE movie_clean
ADD COLUMN Release_Year INT;

UPDATE movie_clean
SET Release_Year = YEAR(`Release Date`);

ALTER TABLE movie_clean
ADD COLUMN Profit DECIMAL(15,2);

UPDATE movie_clean
SET Profit = Revenue - Budget;

ALTER TABLE movie_clean
ADD COLUMN ROI DECIMAL(10,2);

UPDATE movie_clean
SET ROI = ((Revenue - Budget) / Budget) * 100;

UPDATE movie_clean
SET `Director (2)` = NULL
WHERE `Director (2)` = '';

SELECT
'Director (2)' AS Column_Name,
COUNT(*) AS Missing_Count
FROM movie_clean
WHERE `Director (2)` IS NULL

UNION ALL

SELECT
'Cast (5)',
COUNT(*)
FROM movie_clean
WHERE `Cast (5)` IS NULL

UNION ALL

SELECT
'Genre',
COUNT(*)
FROM movie_clean
WHERE Genre IS NULL;

SELECT *
FROM movie_clean
WHERE `Wikipedia URL` IS NULL
   OR `Wikipedia URL` NOT LIKE 'https://%';
   
   -- CASE STATEMENTS
   
SELECT
`Movie Title`,
Budget,
Revenue,
Profit,
CASE 
     WHEN Revenue > Budget THEN 'Profitable'
     WHEN Revenue = Budget THEN 'Break-even'
     ELSE 'Loss'
END AS Profit_Status
FROM movie_clean;

SELECT
`Movie Title`,
Budget,

CASE
WHEN Budget < 50000000 THEN 'Low Budget'
WHEN Budget BETWEEN 50000000 AND 150000000 THEN 'Medium Budget'
ELSE 'High Budget'
END AS Budget_Category

FROM movie_clean;

-- SUBQUERY

SELECT
`Movie Title`,
Revenue
FROM movie_clean
WHERE Revenue >
(
SELECT AVG(Revenue)
FROM movie_clean
);

SELECT
	`Movie Title`,
    Profit
    FROM movie_clean
    WHERE Profit =
(
SELECT MAX(Profit)
FROM movie_clean
);

SELECT
`Movie Title`,
Genre,
Budget
FROM movie_clean m1
WHERE Budget >
(
SELECT AVG(Budget)
FROM movie_clean m2
WHERE m1.Genre=m2.Genre
);

-- CTE 
-- FIND THE MOST PROFITABLE MOVIES

WITH PROFIT_MOVIE AS
(
SELECT
  `Movie Title`,
  Genre,
  Profit
FROM movie_clean
)
SELECT *
FROM PROFIT_MOVIE
ORDER BY Profit DESC
LIMIT 10;

WITH PROFIT_MOVIE AS
(
SELECT
  `Movie Title`,
  Genre,
  Profit
FROM movie_clean
)
SELECT *
FROM PROFIT_MOVIE
WHERE Profit >
(
SELECT AVG(Profit)
FROM PROFIT_MOVIE
);

WITH Genre_Revenue AS
(
SELECT
Genre,
SUM(Revenue) AS Total_Revenue
FROM movie_clean
GROUP BY Genre
)
SELECT *
FROM Genre_Revenue;

WITH Genre_Profit AS
(
SELECT
Genre,
AVG(Profit) AS Average_Profit
FROM movie_clean
GROUP BY Genre
)
SELECT *
FROM Genre_Profit;

-- WINDOWS FUNCTION

SELECT
`Movie Title`,
Revenue,
RANK()Over(Order by Revenue DESC
)AS Revenue_Rank
FROM movie_clean;

-- DENSE RANK

SELECT
`Movie Title`,
Revenue,
DENSE_RANK() OVER(ORDER BY Revenue DESC
)AS Revenue_Rank
FROM movie_clean;

-- ROW NUMBER

SELECT
`Movie Title`,
ROW_NUMBER() OVER
(
ORDER BY `Release Date`
)	
FROM movie_clean;

SELECT *
FROM
(SELECT 
`Movie Title`,
Genre,
Revenue,
ROW_NUMBER() OVER(
PARTITION BY Genre
Order BY Revenue DESC
)AS ROW_NUM
FROM movie_clean
)M
WHERE ROW_NUM = 1;
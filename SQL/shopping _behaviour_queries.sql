#BASIC QUERIES
#View all customer shopping records
SELECT * FROM project1.`shopping behavior`;

#show all Total number of purchases
SELECT COUNT(*) AS total_purchases
FROM project1.`shopping behavior`;

#what are Total sales amount?
SELECT SUM(`Purchase Amount (USD)`) AS total_sales
FROM project1.`shopping behavior`;

#what is Average purchase amount?
SELECT AVG(`Purchase Amount (USD)`) AS avg_purchase
FROM project1.`shopping behavior`;

#how many Distinct number of customers?
SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM project1.`shopping behavior`;

#FILTERING (WHERE):
#how many are Purchases by subscribed customers?
SELECT *
FROM project1.`shopping behavior`
WHERE `Subscription Status` = 'Yes';

#Customers with discount applied?
SELECT *
FROM project1.`shopping behavior`
WHERE `Discount Applied` = 'Yes';

#which Purchases in Winter season?
SELECT *
FROM project1.`shopping behavior`
WHERE Season = 'Winter';

#what is High-value purchases (above $100) from customer?
SELECT *
FROM project1.`shopping behavior`
WHERE `Purchase Amount (USD)` >90;

#GROUP BY ANALYSIS
#Sales by category
SELECT Category,
       SUM(`Purchase Amount (USD)`) AS category_sales
FROM project1.`shopping behavior`
GROUP BY Category;

#What is Revenue contribution by location?
SELECT Location,
       SUM(`Purchase Amount (USD)`) AS location_sales
FROM project1.`shopping behavior`
GROUP BY Location;

#which is Average rating by category?
SELECT Category,
       AVG(`Review Rating`) AS avg_rating
FROM project1.`shopping behavior`
GROUP BY Category;

#which Payment method usage count?
SELECT `Payment Method`,
       COUNT(*) AS usage_count
FROM project1.`shopping behavior`
GROUP BY `Payment Method`;

#Subscription vs average spending?
SELECT `Subscription Status`,
       AVG(`Purchase Amount (USD)`) AS avg_spend
FROM project1.`shopping behavior`
GROUP BY `Subscription Status`;

#ORDER BY + Limit
#what are Top 5 highest purchases?
SELECT *
FROM project1.`shopping behavior`
ORDER BY `Purchase Amount (USD)` DESC
LIMIT 5;

#Top 5 customers by total spending?
SELECT `Customer ID`,
       SUM(`Purchase Amount (USD)`) AS total_spent
FROM project1.`shopping behavior`
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 5;

#ADVANCED QUERIES
#Repeat customers (more than 1 previous purchase)
SELECT DISTINCT `Customer ID`
FROM project1.`shopping behavior`
WHERE `Previous Purchases` > 1;

#Customers who spend more than average (SUBQUERY)
SELECT *
FROM project1.`shopping behavior`
WHERE `Purchase Amount (USD)` >
      (SELECT AVG(`Purchase Amount (USD)`)
       FROM project1.`shopping behavior`);

#Purchase type based on amount (CASE)?
SELECT `Customer ID`,
       `Purchase Amount (USD)`,
       CASE
           WHEN `Purchase Amount (USD)` >= 150 THEN 'High Value'
           WHEN `Purchase Amount (USD)` >= 75 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS purchase_category
FROM project1.`shopping behavior`;

#Average purchase amount per category (Window Avg)
SELECT
    Category,
    `Purchase Amount (USD)`,
    AVG(`Purchase Amount (USD)`) OVER (PARTITION BY Category) AS avg_category_sales
FROM project1.`shopping behavior`;

#Compare customer spend to overall average
SELECT
    `Customer ID`,
    `Purchase Amount (USD)`,
    `Purchase Amount (USD)` -
    AVG(`Purchase Amount (USD)`) OVER () AS diff_from_avg
FROM project1.`shopping behavior`;



    








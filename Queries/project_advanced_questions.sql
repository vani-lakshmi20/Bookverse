#14.Find members whose total spending is above average member spend.
SELECT m.name, SUM(b.price*o.quantity) AS total_spent
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.name
HAVING total_spent > (
    SELECT AVG(spend) FROM (
        SELECT SUM(b2.price*o2.quantity) AS spend
        FROM orders o2 JOIN books b2 ON o2.book_id=b2.book_id
        GROUP BY o2.member_id
    ) AS sub
);

#15. Rank genres by total revenue using RANK().
SELECT b.genre, SUM(b.price*o.quantity) AS revenue,
RANK() OVER (ORDER BY SUM(b.price*o.quantity) DESC) AS genre_rank
FROM orders o JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;

#16. Analyze monthly sales trend using a CTE.
WITH monthly AS (
  SELECT DATE_FORMAT(o.order_date,'%Y-%m') AS month, SUM(b.price*o.quantity) AS revenue
  FROM orders o JOIN books b ON o.book_id = b.book_id
  GROUP BY month
)
SELECT * FROM monthly ORDER BY month;

#17.Create a reusable view summarizing total orders and reveune by city;
CREATE VIEW city_summary AS
SELECT m.city, COUNT(*) AS total_orders, SUM(b.price*o.quantity) AS total_revenue
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.city;

SELECT * FROM city_summary;

#18.Rank members by number of orders placed (window function)
SELECT m.name, COUNT(*) AS order_count,
RANK() OVER (ORDER BY COUNT(*) DESC) AS member_rank
FROM orders o
JOIN members m ON o.member_id = m.member_id
GROUP BY m.name;

#19.Find books that have never been ordered (subquery)
SELECT * FROM books
WHERE book_id NOT IN (SELECT DISTINCT book_id FROM orders);

#20.Calculate the return/cancellation rate per genre
SELECT b.genre,
ROUND(SUM(CASE WHEN o.order_status IN
('Cancelled','Returned') THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) 
AS issue_rate_pct
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;

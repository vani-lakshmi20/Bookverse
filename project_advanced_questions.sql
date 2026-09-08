#Members whose spend is above average member spend
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

# Rank genres by revenue
SELECT b.genre, SUM(b.price*o.quantity) AS revenue,
RANK() OVER (ORDER BY SUM(b.price*o.quantity) DESC) AS genre_rank
FROM orders o JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;
# Monthly sales trend (CTE)
WITH monthly AS (
  SELECT DATE_FORMAT(o.order_date,'%Y-%m') AS month, SUM(b.price*o.quantity) AS revenue
  FROM orders o JOIN books b ON o.book_id = b.book_id
  GROUP BY month
)
SELECT * FROM monthly ORDER BY month;

#Create a reusable view: city summary
CREATE VIEW city_summary AS
SELECT m.city, COUNT(*) AS total_orders, SUM(b.price*o.quantity) AS total_revenue
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.city;

SELECT * FROM city_summary;
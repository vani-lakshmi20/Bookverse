
#6.Calculate total revenue generated per genre.
SELECT b.genre, SUM(b.price * o.quantity) AS revenue
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre
ORDER BY revenue DESC;

#7.Find the top 5 members by total spending.
SELECT m.name, SUM(b.price * o.quantity) AS total_spent
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.name
ORDER BY total_spent DESC
LIMIT 5;

#8. Calculate the average order value per membership type.
SELECT m.membership_type, AVG(b.price * o.quantity) AS avg_order_value
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.membership_type;

#9.Identify cities with total order value above 10,000.
SELECT m.city, SUM(b.price * o.quantity) AS total_value
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.city
HAVING total_value > 10000;
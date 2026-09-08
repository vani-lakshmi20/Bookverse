
#8.Calculate total revenue generated per genre.
SELECT b.genre, SUM(b.price * o.quantity) AS revenue
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre
ORDER BY revenue DESC;

#9.Find the top 5 members by total spending.
SELECT m.name, SUM(b.price * o.quantity) AS total_spent
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.name
ORDER BY total_spent DESC
LIMIT 5;

#10. Calculate the average order value per membership type.
SELECT m.membership_type, AVG(b.price * o.quantity) AS avg_order_value
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.membership_type;

#11.Identify cities with total order value above 10,000.
SELECT m.city, SUM(b.price * o.quantity) AS total_value
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN books b ON o.book_id = b.book_id
GROUP BY m.city
HAVING total_value > 10000;

#12. Count total number of orders per city
SELECT m.city, COUNT(*) AS total_orders
FROM orders o
JOIN members m ON o.member_id = m.member_id
GROUP BY m.city;

#13. Find the most popular genre by number of orders
SELECT b.genre, COUNT(*) AS order_count
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre
ORDER BY order_count DESC
LIMIT 1;

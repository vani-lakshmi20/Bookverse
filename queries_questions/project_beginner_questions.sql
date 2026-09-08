
#1.List all books in the Fiction genre.
SELECT * FROM books WHERE genre = 'Fiction';

#2.Find all the books priced above 500.
SELECT * FROM books WHERE price > 500;

#3.Identify the top 10 most expensive books.
SELECT * FROM books ORDER BY price DESC LIMIT 10;

#4.List all the delivered orders.
SELECT * FROM orders WHERE order_status = 'Delivered';

#5.Show all premium members
SELECT * FROM members WHERE membership_type = 'Premium';

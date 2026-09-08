
CREATE DATABASE bookverse;
USE bookverse;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(150),
    genre VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    join_date DATE,
    membership_type VARCHAR(20)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    order_status VARCHAR(20)
);









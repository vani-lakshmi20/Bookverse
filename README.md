# BookVerse 📖 — Bookstore Data Analysis with SQL

A MySQL project I built to practice real-world data analysis on a fictional bookstore's
sales and membership data — going from simple lookups to window functions and views.

## Why this project

I wanted a dataset where the questions actually mattered, not just syntax practice.
A bookstore setup felt right: books, members, and orders naturally connect, so I could
ask real questions like "which cities bring in the most revenue?" or "who are our
highest-spending members?" and answer them with SQL instead of guessing.

## The data

The books table is built from a real Kaggle dataset (Google Books Dataset — 15K+
book records), trimmed down to 500 titles with the fields that mattered: title, author,
genre, and price. Since no public dataset pairs a real book catalog with a specific
store's transactions, I generated the members (80 customers) and orders (800
records) tables myself to make relational analysis possible.

| Table | What's in it |
|---|---|
| books | book_id, title, author, genre, price |
| members | member_id, name, city, join_date, membership_type |
| orders | order_id, member_id, book_id, order_date, quantity, order_status |

## What I analyzed

Getting familiar with the data
1. Books in the Fiction genre
2. Books priced above ₹500
3. Top 10 most expensive books
4. Delivered orders
5. Premium members

Digging into behavior and performance
6. Revenue generated per genre
7. Top 5 members by total spending
8. Average order value by membership type
9. Cities with total order value above ₹10,000

Ranking, trends, and reusable insights
10. Members spending above the average member
11. Genres ranked by revenue using RANK()
12. Monthly sales trend using a CTE
13. A saved view (city_summary) for repeatable city-level reporting

## SQL concepts covered

SELECT · WHERE · ORDER BY · LIMIT · multi-table JOINs · GROUP BY / HAVING ·
aggregate functions · subqueries · Common Table Expressions (CTEs) · RANK() window
function · CREATE VIEW

## What I took away from it

The easy part was writing the SELECTs. The harder (and more useful) part was figuring
out what to ask — e.g. total sales don't tell you much until you break them down by
genre or city. Working through the JOIN logic across three tables, and getting the
subquery for "above-average spenders" to actually work, was probably where I learned
the most.

## Project files

bookverse/
- README.md
- create_tables.sql
- BookVerse_Query_Screenshots.pdf
- Queries/
  - project_beginner_questions.sql
  - project_intermediate_question.sql
  - project_advanced_questions.sql

## Tools used
MySQL · MySQL Workbench · Kaggle dataset · GitHub

## Running it locally
1. Run create_tables.sql to set up the database and tables
2. Import books.csv, members.csv, and orders.csv via MySQL Workbench's
   Table Data Import Wizard
3. Run the query files in order: beginner → intermediate → advanced

# 📘 README: SQL Queries and Database Operations

## 📂 Project Overview

This project contains SQL scripts and queries for managing and analyzing data in a relational database. The focus is on learning and applying SQL syntax for:
- Data filtering with dates
- Aggregations (e.g., MAX)
- Sorting
- Common error handling and fixes

## 🗃️ Database Structure (Example)

- **`orders`**
  - `order_id` (INT, PRIMARY KEY)
  - `customer_id` (INT, FOREIGN KEY)
  - `order_date` (DATE)
  - `total_amount` (DECIMAL)

- **`products`**
  - `product_id` (INT, PRIMARY KEY)
  - `product_name` (VARCHAR)
  - `price` (DECIMAL)

- **`customers`**
  - `customer_id` (INT, PRIMARY KEY)
  - `name` (VARCHAR)
  - `email` (VARCHAR)
  - `address` (VARCHAR)

## 📌 Sample Queries

### 🔍 1. Get all orders placed in the last 30 days from a specific date
```sql
SELECT * FROM orders
WHERE order_date >= DATE_SUB('2025-07-31', INTERVAL 30 DAY);
```

### 📊 2. Get the maximum total order amount
```sql
SELECT MAX(total_amount) FROM orders;
```

### 🔽 3. List all products sorted by price (ascending)
```sql
SELECT * FROM products
ORDER BY price ASC;
```

## 📦 Requirements

- MySQL or compatible RDBMS
- SQL Workbench or CLI tool
- Basic understanding of SQL syntax

mysql> create table customers (
    -> customer_id int auto_increment primary key,
    -> name varchar(20) not null,
    -> email varchar(20) not null,
    -> address varchar(30) not null);
Query OK, 0 rows affected (0.306 sec)

mysql> show tables
    -> ;
+---------------+
| Tables_in_rw7 |
+---------------+
| customers     |
+---------------+
1 row in set (0.035 sec)

mysql> insert into customers (name , email , address)
    -> values("alice" , "alice.1@gmail.com" , "new york"),
    -> ("bob" , "bob.2@gmail.com" , "washington"),
    -> ("charlie" , "charlie.3@gmail.com" , "boston"),
    -> ("chelcy" , "chelcy.4@gmail.com" , "abu dhabi"),
    -> ("zen" , "zen.5@gmail.com" , "london");
Query OK, 5 rows affected (0.066 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from customers
    -> ;
+-------------+---------+---------------------+------------+
| customer_id | name    | email               | address    |
+-------------+---------+---------------------+------------+
|           1 | alice   | alice.1@gmail.com   | new york   |
|           2 | bob     | bob.2@gmail.com     | washington |
|           3 | charlie | charlie.3@gmail.com | boston     |
|           4 | chelcy  | chelcy.4@gmail.com  | abu dhabi  |
|           5 | zen     | zen.5@gmail.com     | london     |
+-------------+---------+---------------------+------------+
5 rows in set (0.010 sec)

mysql> insert into customers (name , email , address)
    -> values("rock" , "rock@gmail.com" , "ahmedabad");
Query OK, 1 row affected (0.112 sec)

mysql> select * from customers
    -> ;
+-------------+---------+---------------------+------------+
| customer_id | name    | email               | address    |
+-------------+---------+---------------------+------------+
|           1 | alice   | alice.1@gmail.com   | new york   |
|           2 | bob     | bob.2@gmail.com     | washington |
|           3 | charlie | charlie.3@gmail.com | boston     |
|           4 | chelcy  | chelcy.4@gmail.com  | abu dhabi  |
|           5 | zen     | zen.5@gmail.com     | london     |
|          11 | rock    | rock@gmail.com      | ahmedabad  |
+-------------+---------+---------------------+------------+
6 rows in set (0.012 sec)

mysql> update customers set customer_id=6 where customer_id=11;
Query OK, 1 row affected (0.053 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers
    -> ;
+-------------+---------+---------------------+------------+
| customer_id | name    | email               | address    |
+-------------+---------+---------------------+------------+
|           1 | alice   | alice.1@gmail.com   | new york   |
|           2 | bob     | bob.2@gmail.com     | washington |
|           3 | charlie | charlie.3@gmail.com | boston     |
|           4 | chelcy  | chelcy.4@gmail.com  | abu dhabi  |
|           5 | zen     | zen.5@gmail.com     | london     |
|           6 | rock    | rock@gmail.com      | ahmedabad  |
+-------------+---------+---------------------+------------+
6 rows in set (0.008 sec)

mysql> delete from customers where customer_id = 6;
Query OK, 1 row affected (0.054 sec)

mysql> select * from customers;
+-------------+---------+---------------------+-----------+
| customer_id | name    | email               | address   |
+-------------+---------+---------------------+-----------+
|           1 | alice   | alice.1@gmail.com   | new york  |
|           2 | bob     | bob.2@gmail.com     | mumbai    |
|           3 | charlie | charlie.3@gmail.com | boston    |
|           4 | chelcy  | chelcy.4@gmail.com  | abu dhabi |
|           5 | zen     | zen.5@gmail.com     | london    |
+-------------+---------+---------------------+-----------+
5 rows in set (0.008 sec)

mysql> select * from customers where name like "%lic%";
+-------------+-------+-------------------+----------+
| customer_id | name  | email             | address  |
+-------------+-------+-------------------+----------+
|           1 | alice | alice.1@gmail.com | new york |
+-------------+-------+-------------------+----------+
1 row in set (0.052 sec)

mysql> CREATE TABLE orders (
    ->     order_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     customer_id INT NOT NULL,
    ->     order_date DATE NOT NULL,
    ->     total_amount INT NOT NULL,
    ->     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    -> );
Query OK, 0 rows affected (0.697 sec)

mysql> show tables
    -> ;
+---------------+
| Tables_in_rw7 |
+---------------+
| customers     |
| orders        |
+---------------+
2 rows in set (0.040 sec)

mysql> insert into orders (customer_id , order_date , total_amount)
    -> value(2 , "2025-07-20" , 5000),
    -> (3,"2025-07-22" , 20000),
    -> (1,"2025-07-24" , 2497),
    -> (5,"2025-07-21" , 974),
    -> (4,"2025-07-19" , 15);
Query OK, 5 rows affected (0.082 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+----------+-------------+------------+--------------+
| order_id | customer_id | order_date | total_amount |
+----------+-------------+------------+--------------+
|        1 |           2 | 2025-07-20 |         5000 |
|        2 |           3 | 2025-07-22 |        20000 |
|        3 |           1 | 2025-07-24 |         2497 |
|        4 |           5 | 2025-07-21 |          974 |
|        5 |           4 | 2025-07-19 |           15 |
+----------+-------------+------------+--------------+
5 rows in set (0.012 sec)

mysql> select * from orders where customer_id=3;
+----------+-------------+------------+--------------+
| order_id | customer_id | order_date | total_amount |
+----------+-------------+------------+--------------+
|        2 |           3 | 2025-07-22 |        20000 |
+----------+-------------+------------+--------------+
1 row in set (0.017 sec)

mysql> update orders set total_amount=12000 where order_id = 5;
Query OK, 1 row affected (0.060 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;
+----------+-------------+------------+--------------+
| order_id | customer_id | order_date | total_amount |
+----------+-------------+------------+--------------+
|        1 |           2 | 2025-07-20 |         5000 |
|        2 |           3 | 2025-07-22 |        20000 |
|        3 |           1 | 2025-07-24 |         2497 |
|        4 |           5 | 2025-07-21 |          974 |
|        5 |           4 | 2025-07-19 |        12000 |
+----------+-------------+------------+--------------+
5 rows in set (0.011 sec)

mysql> select * from orders where order_date >= curdate() - interval 30 day;
+----------+-------------+------------+--------------+
| order_id | customer_id | order_date | total_amount |
+----------+-------------+------------+--------------+
|        1 |           2 | 2025-07-20 |         5000 |
|        2 |           3 | 2025-07-22 |        20000 |
|        3 |           1 | 2025-07-24 |         2497 |
|        4 |           5 | 2025-07-21 |          974 |
|        5 |           4 | 2025-07-19 |        12000 |
+----------+-------------+------------+--------------+
5 rows in set (0.043 sec)

mysql> select max(total_amount) from orders;
+-------------------+
| max(total_amount) |
+-------------------+
|             20000 |
+-------------------+
1 row in set (0.104 sec)

mysql> select min(total_amount) from orders;
+-------------------+
| min(total_amount) |
+-------------------+
|               974 |
+-------------------+
1 row in set (0.011 sec)

mysql> select avg(total_amount) from orders;
+-------------------+
| avg(total_amount) |
+-------------------+
|         8094.2000 |
+-------------------+
1 row in set (0.028 sec)

mysql> create table products (
    -> product_id int auto_increment primary key,
    -> product_name varchar(20) not null,
    -> price varchar(20) not null,
    -> stock int not null);
Query OK, 0 rows affected (0.395 sec)

mysql> insert into products (product_name , price , stock)
    -> values("table" , 450 , 57),
    -> ("chair" , 300 , 92),
    -> ("sofa" , 15000 , 34),
    -> ("bed" , 27000 , 12),
    -> ("stand" , 700 , 57);
Query OK, 5 rows affected (0.065 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from products;
+------------+--------------+-------+-------+
| product_id | product_name | price | stock |
+------------+--------------+-------+-------+
|          1 | table        | 450   |    57 |
|          2 | chair        | 300   |    92 |
|          3 | sofa         | 15000 |    34 |
|          4 | bed          | 27000 |    12 |
|          5 | stand        | 700   |    57 |
+------------+--------------+-------+-------+
5 rows in set (0.009 sec)

mysql> select * from products order by price desc;
+------------+--------------+-------+-------+
| product_id | product_name | price | stock |
+------------+--------------+-------+-------+
|          5 | stand        | 700   |    57 |
|          1 | table        | 450   |    57 |
|          2 | chair        | 300   |    92 |
|          4 | bed          | 27000 |    12 |
|          3 | sofa         | 15000 |    34 |
+------------+--------------+-------+-------+
5 rows in set (0.020 sec)

mysql> select * from products order by price asc;
+------------+--------------+-------+-------+
| product_id | product_name | price | stock |
+------------+--------------+-------+-------+
|          3 | sofa         | 15000 |    34 |
|          4 | bed          | 27000 |    12 |
|          2 | chair        | 300   |    92 |
|          1 | table        | 450   |    57 |
|          5 | stand        | 700   |    57 |
+------------+--------------+-------+-------+
5 rows in set (0.016 sec)

mysql> update products set price = 280 where product_id = 2;
Query OK, 1 row affected (0.062 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from products;
+------------+--------------+-------+-------+
| product_id | product_name | price | stock |
+------------+--------------+-------+-------+
|          1 | table        | 450   |    57 |
|          2 | chair        | 280   |    92 |
|          3 | sofa         | 15000 |    34 |
|          4 | bed          | 27000 |    12 |
|          5 | stand        | 700   |    57 |
+------------+--------------+-------+-------+
5 rows in set (0.010 sec)

mysql> delete from products where stock = 0;
Query OK, 0 rows affected (0.016 sec)

mysql> select * from products where price between 500 and 2000;
+------------+--------------+-------+-------+
| product_id | product_name | price | stock |
+------------+--------------+-------+-------+
|          5 | stand        | 700   |    57 |
+------------+--------------+-------+-------+
1 row in set (0.031 sec)

mysql> select max(price) from products;
+------------+
| max(price) |
+------------+
| 700        |
+------------+
1 row in set (0.027 sec)

mysql> select min(price) from products;
+------------+
| min(price) |
+------------+
| 15000      |
+------------+
1 row in set (0.010 sec)

mysql> select * from products;
+------------+--------------+-------+-------+
| product_id | product_name | price | stock |
+------------+--------------+-------+-------+
|          1 | table        | 450   |    57 |
|          2 | chair        | 280   |    92 |
|          3 | sofa         | 15000 |    34 |
|          4 | bed          | 27000 |    12 |
|          5 | stand        | 700   |    57 |
+------------+--------------+-------+-------+
5 rows in set (0.019 sec)

mysql> select max(price) from products;
+------------+
| max(price) |
+------------+
| 700        |
+------------+
1 row in set (0.016 sec)

mysql> select min(price) from products;
+------------+
| min(price) |
+------------+
| 15000      |
+------------+
1 row in set (0.012 sec)

mysql> create table orderdetails (
    -> orderdetail_id int auto_increment primary key,
    -> order_id int not null,
    -> product_id int not null,
    -> quantity int not null,
    -> sub_total int not null,
    -> foreign key (product_id) references products(product_id),
    -> foreign key (order_id) references orders(order_id)
    -> );
Query OK, 0 rows affected (0.953 sec)

mysql> insert into orderdetails (order_id , product_id , quantity , sub_total)
    -> values(4 , 2 ,8 ,2240),
    -> (3 , 1 , 2 , 900),
    -> (5 , 5 , 4 , 2800),
    -> (1 , 3 , 3 , 45000),
    -> (3 , 1 , 6 , 2700),
    -> (2 , 4 , 4 , 108000);
Query OK, 6 rows affected (0.069 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from orderdetails;
+----------------+----------+------------+----------+-----------+
| orderdetail_id | order_id | product_id | quantity | sub_total |
+----------------+----------+------------+----------+-----------+
|              1 |        4 |          2 |        8 |      2240 |
|              2 |        3 |          1 |        2 |       900 |
|              3 |        5 |          5 |        4 |      2800 |
|              4 |        1 |          3 |        3 |     45000 |
|              5 |        3 |          1 |        6 |      2700 |
|              6 |        2 |          4 |        4 |    108000 |
+----------------+----------+------------+----------+-----------+
6 rows in set (0.009 sec)

mysql> select * from orderdetails order by sub_total desc;
+----------------+----------+------------+----------+-----------+
| orderdetail_id | order_id | product_id | quantity | sub_total |
+----------------+----------+------------+----------+-----------+
|              6 |        2 |          4 |        4 |    108000 |
|              4 |        1 |          3 |        3 |     45000 |
|              3 |        5 |          5 |        4 |      2800 |
|              5 |        3 |          1 |        6 |      2700 |
|              1 |        4 |          2 |        8 |      2240 |
|              2 |        3 |          1 |        2 |       900 |
+----------------+----------+------------+----------+-----------+
6 rows in set (0.023 sec)

mysql> select sum(sub_total) from orderdetails;
+----------------+
| sum(sub_total) |
+----------------+
|         161640 |
+----------------+
1 row in set (0.012 sec)

mysql> select * from orderdetails order by sub_total desc limit 3;
+----------------+----------+------------+----------+-----------+
| orderdetail_id | order_id | product_id | quantity | sub_total |
+----------------+----------+------------+----------+-----------+
|              6 |        2 |          4 |        4 |    108000 |
|              4 |        1 |          3 |        3 |     45000 |
|              3 |        5 |          5 |        4 |      2800 |
+----------------+----------+------------+----------+-----------+
3 rows in set (0.014 sec)

mysql> select * from orderdetails order by quantity desc limit 3;
+----------------+----------+------------+----------+-----------+
| orderdetail_id | order_id | product_id | quantity | sub_total |
+----------------+----------+------------+----------+-----------+
|              1 |        4 |          2 |        8 |      2240 |
|              5 |        3 |          1 |        6 |      2700 |
|              3 |        5 |          5 |        4 |      2800 |
+----------------+----------+------------+----------+-----------+
3 rows in set (0.010 sec)

mysql> select product_id , count(*) from orderdetails group by product_id;
+------------+----------+
| product_id | count(*) |
+------------+----------+
|          1 |        2 |
|          2 |        1 |
|          3 |        1 |
|          4 |        1 |
|          5 |        1 |
+------------+----------+
5 rows in set (0.036 sec)

-- Implicit cross join
SELECT * FROM orders, customers;

-- Implicit inner join
SELECT * FROM orders, customers
    WHERE customers.id = customer_id;

-- Explicit inner join
SELECT * FROM orders JOIN customers
    ON orders.customer_id = customers.id; 

-- Explicit inner join
SELECT * FROM orders 
INNER JOIN customers
    ON orders.customer_id = customers.id; 

-- Explicit Left join (orders, customers)
SELECT * FROM orders 
LEFT JOIN customers
    ON orders.customer_id = customers.id; 

-- Explicit Left join (customers, orders)
SELECT * FROM customers 
LEFT JOIN orders
    ON customers.id = orders.customer_id; 

-- Explicit Left join
SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

-- RIGHT Join
SELECT *
FROM customers 
RIGHT JOIN orders
    ON customers.id = orders.customer_id;


SELECT *
FROM orders 
RIGHT JOIN customers
    ON orders.customer_id = customers.id;

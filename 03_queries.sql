
SELECT p.product_id, p.product_name, c.category_name, p.price, p.unit
FROM products p JOIN categories c ON p.category_id = c.category_id
ORDER BY c.category_name, p.product_name;


SELECT p.product_name, i.quantity, i.reorder_level
FROM products p JOIN inventory i ON p.product_id = i.product_id
WHERE i.quantity <= i.reorder_level;


SELECT c.full_name, o.order_id, o.order_date, o.status, o.total_amount
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;


SELECT SUM(total_amount) AS total_revenue
FROM orders WHERE status = 'DELIVERED';


SELECT p.product_name, SUM(oi.quantity) AS units_sold
FROM order_items oi JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'DELIVERED'
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;


SELECT AVG(total_amount) AS average_order_value
FROM orders WHERE status = 'DELIVERED';


SELECT c.category_name, SUM(oi.line_total) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'DELIVERED'
GROUP BY c.category_name
ORDER BY revenue DESC;


SELECT c.customer_id, c.full_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


SELECT c.full_name, SUM(o.total_amount) AS total_spent
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING SUM(o.total_amount) > (SELECT AVG(total_amount) FROM orders);


SELECT c.full_name, SUM(o.total_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spending_rank
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;


SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(total_amount) AS revenue
FROM orders
WHERE status = 'DELIVERED'
GROUP BY month ORDER BY month;

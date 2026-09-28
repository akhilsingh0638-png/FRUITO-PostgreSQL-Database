
SELECT c.customer_id, c.full_name,
       COUNT(o.order_id) AS orders,
       COALESCE(SUM(o.total_amount),0) AS lifetime_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY lifetime_value DESC;


SELECT c.category_name, p.product_name,
       SUM(oi.line_total) AS revenue,
       RANK() OVER (
           PARTITION BY c.category_id
           ORDER BY SUM(oi.line_total) DESC
       ) AS category_rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name, p.product_id, p.product_name;


SELECT order_id, order_date, total_amount,
       SUM(total_amount) OVER (ORDER BY order_date, order_id) AS running_revenue
FROM orders
WHERE status = 'DELIVERED';


SELECT c.full_name, COUNT(o.order_id) AS order_count
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) > 1;

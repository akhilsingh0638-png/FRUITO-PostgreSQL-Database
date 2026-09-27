CREATE OR REPLACE VIEW vw_product_inventory AS
SELECT p.product_id, p.product_name, c.category_name, p.price,
       i.quantity, i.reorder_level,
       CASE WHEN i.quantity <= i.reorder_level THEN 'REORDER' ELSE 'OK' END AS stock_status
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN inventory i ON p.product_id = i.product_id;

CREATE OR REPLACE VIEW vw_customer_summary AS
SELECT c.customer_id, c.full_name, c.email,
       COUNT(o.order_id) AS total_orders,
       COALESCE(SUM(o.total_amount),0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name, c.email;

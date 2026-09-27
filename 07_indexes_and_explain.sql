-- Inspect a query plan
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 1;

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_orders_customer_date
ON orders(customer_id, order_date);

CREATE INDEX IF NOT EXISTS idx_order_items_order
ON order_items(order_id);

-- Compare query plans before/after indexing where appropriate.

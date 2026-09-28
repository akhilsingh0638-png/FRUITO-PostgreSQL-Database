
BEGIN;

UPDATE inventory
SET quantity = quantity - 2,
    updated_at = CURRENT_TIMESTAMP
WHERE product_id = 1
  AND quantity >= 2;


SELECT * FROM inventory WHERE product_id = 1;


COMMIT;



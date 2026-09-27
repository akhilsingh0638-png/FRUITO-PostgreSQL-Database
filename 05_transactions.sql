-- Example safe inventory deduction
BEGIN;

UPDATE inventory
SET quantity = quantity - 2,
    updated_at = CURRENT_TIMESTAMP
WHERE product_id = 1
  AND quantity >= 2;

-- Verify
SELECT * FROM inventory WHERE product_id = 1;

-- If correct:
COMMIT;

-- If something is wrong instead, use ROLLBACK before COMMIT.

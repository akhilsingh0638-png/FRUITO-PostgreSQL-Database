INSERT INTO categories (category_name) VALUES
('Fruits'), ('Vegetables'), ('Dairy'), ('Beverages'), ('Snacks');

INSERT INTO customers (full_name, email, phone) VALUES
('Aarav Mehta','aarav@example.com','9000000001'),
('Riya Shah','riya@example.com','9000000002'),
('Kabir Patel','kabir@example.com','9000000003'),
('Ananya Rao','ananya@example.com','9000000004'),
('Vivaan Kumar','vivaan@example.com','9000000005');

INSERT INTO addresses (customer_id,address_line,city,state,pincode) VALUES
(1,'12 Lake Road','Mumbai','Maharashtra','400066'),
(2,'44 MG Road','Mumbai','Maharashtra','400050'),
(3,'18 Station Road','Thane','Maharashtra','400601'),
(4,'9 Park Avenue','Navi Mumbai','Maharashtra','400706'),
(5,'71 Main Street','Mumbai','Maharashtra','400092');

INSERT INTO products (category_id,product_name,price,unit) VALUES
(1,'Alphonso Mango',180,'1 kg'),
(1,'Banana',60,'1 dozen'),
(1,'Apple',160,'1 kg'),
(2,'Tomato',45,'1 kg'),
(2,'Potato',40,'1 kg'),
(2,'Spinach',30,'1 bunch'),
(3,'Milk',65,'1 litre'),
(3,'Curd',55,'500 g'),
(4,'Orange Juice',120,'1 litre'),
(5,'Roasted Almonds',220,'250 g');

INSERT INTO inventory (product_id,quantity,reorder_level) VALUES
(1,25,10),(2,80,20),(3,35,10),(4,12,15),(5,50,15),
(6,8,10),(7,40,10),(8,25,8),(9,18,8),(10,14,6);

INSERT INTO coupons (code,discount_percent,expires_at) VALUES
('WELCOME10',10,'2027-12-31'),
('FRUIT5',5,'2027-06-30');

INSERT INTO orders (customer_id,coupon_id,status,total_amount) VALUES
(1,1,'DELIVERED',0),
(2,NULL,'DELIVERED',0),
(1,NULL,'PLACED',0),
(3,2,'DELIVERED',0),
(4,NULL,'DELIVERED',0);

INSERT INTO order_items (order_id,product_id,quantity,unit_price) VALUES
(1,1,2,180),(1,2,1,60),
(2,3,2,160),(2,7,2,65),
(3,10,1,220),(3,8,2,55),
(4,4,3,45),(4,5,2,40),
(5,9,2,120),(5,6,2,30);

UPDATE orders o
SET total_amount = x.total
FROM (
    SELECT order_id, SUM(line_total) AS total
    FROM order_items GROUP BY order_id
) x
WHERE o.order_id = x.order_id;

INSERT INTO payments (order_id,payment_method,payment_status,paid_at) VALUES
(1,'UPI','PAID',CURRENT_TIMESTAMP),
(2,'CARD','PAID',CURRENT_TIMESTAMP),
(3,'UPI','PENDING',NULL),
(4,'COD','PAID',CURRENT_TIMESTAMP),
(5,'UPI','PAID',CURRENT_TIMESTAMP);

INSERT INTO reviews (customer_id,product_id,rating,review_text) VALUES
(1,1,5,'Fresh and tasty'),
(2,3,4,'Good quality'),
(3,4,4,'Fresh vegetables'),
(4,9,5,'Very good juice');

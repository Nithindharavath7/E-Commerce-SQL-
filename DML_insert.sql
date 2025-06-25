-- Categories
INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen');

-- Products
INSERT INTO Products (name, description, price, stock, category_id) VALUES
('Smartphone', 'Android 5G smartphone', 699.99, 50, 1),
('T-Shirt', 'Cotton T-shirt', 19.99, 200, 2),
('Cookbook', 'Healthy recipes', 29.50, 100, 3),
('Blender', '500W kitchen blender', 89.99, 80, 4),
('Laptop', '15-inch i5 laptop', 999.99, 30, 1);

-- Customers
INSERT INTO Customers (name, email, phone, address) VALUES
('Alice Johnson', 'alice@example.com', '9876543210', 'New York, USA'),
('Bob Smith', 'bob@example.com', '8765432109', 'London, UK'),
('Charlie Brown', 'charlie@example.com', '7654321098', 'Sydney, AUS');

-- Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-06-01', 729.49),
(2, '2025-06-05', 1019.98),
(3, '2025-06-10', 49.49);

-- Order Items
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 699.99),
(1, 3, 1, 29.50),
(2, 5, 1, 999.99),
(2, 2, 1, 19.99),
(3, 3, 1, 29.50),
(3, 2, 1, 19.99);

-- Payments
INSERT INTO Payments (order_id, payment_method, payment_status, payment_date) VALUES
(1, 'Credit Card', 'Completed', '2025-06-01'),
(2, 'PayPal', 'Completed', '2025-06-05'),
(3, 'Debit Card', 'Pending', '2025-06-10');

-- Reviews
INSERT INTO Reviews (customer_id, product_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Excellent phone!', '2025-06-02'),
(2, 5, 4, 'Good laptop, decent performance.', '2025-06-06'),
(3, 3, 3, 'Recipes are okay.', '2025-06-11');

-- Insert a category
INSERT INTO Categories (category_name) VALUES ('Electronics');

-- Insert a product (stock = 10)
INSERT INTO Products (name, description, price, stock, category_id)
VALUES ('Headphones', 'Wireless over-ear headphones', 1500.00, 10, 1);

-- Insert a customer
INSERT INTO Customers (name, email, phone, address)
VALUES ('Rahul Sharma', 'rahul@example.com', '9876543210', 'Hyderabad');

-- Insert an order
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, CURDATE(), 3000.00);

-- ✅ TESTING: Insert an order item (quantity = 2)
-- This should:
-- 1. Reduce stock from 10 → 8
-- 2. Log to Stock_Log
-- 3. NOT trigger an error

INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES (1, 1, 2, 1500.00);

-- Categories
INSERT INTO Categories (category_name) VALUES
('Electronics'), ('Fashion'), ('Home Appliances'), ('Books'), ('Toys');

-- Products
INSERT INTO Products (name, description, price, stock, category_id) VALUES
('Bluetooth Speaker', 'Portable speaker with rich bass', 1999.00, 25, 1),
('Wireless Mouse', 'Ergonomic wireless mouse with USB dongle', 499.00, 40, 1),
('T-Shirt', '100% Cotton printed T-shirt', 299.00, 100, 2),
('Microwave Oven', '20L Solo Microwave', 4999.00, 10, 3),
('Pressure Cooker', '3L Stainless Steel Pressure Cooker', 1500.00, 15, 3),
('Novel - The Alchemist', 'Bestselling novel by Paulo Coelho', 399.00, 50, 4),
('Building Blocks Set', '100-piece colorful building blocks', 999.00, 30, 5);

-- Customers
INSERT INTO Customers (name, email, phone, address) VALUES
('Aarav Mehta', 'aarav.mehta@example.com', '9876543210', 'Mumbai, India'),
('Sneha Reddy', 'sneha.reddy@example.com', '9123456780', 'Hyderabad, India'),
('Rahul Sharma', 'rahul.sharma@example.com', '9988776655', 'Delhi, India'),
('Isha Patel', 'isha.patel@example.com', '9812345678', 'Ahmedabad, India'),
('Nikhil Rao', 'nikhil.rao@example.com', '9765432109', 'Bangalore, India');

-- Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-06-01', 2498.00),
(2, '2024-06-05', 899.00),
(3, '2024-06-08', 299.00),
(1, '2024-06-15', 4999.00),
(4, '2024-06-20', 1898.00);

-- Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1999.00),
(1, 2, 1, 499.00),
(2, 3, 3, 299.00),
(3, 3, 1, 299.00),
(4, 4, 1, 4999.00),
(5, 5, 1, 1500.00),
(5, 2, 2, 499.00);

-- Payments
INSERT INTO Payments (order_id, payment_method, payment_status, payment_date) VALUES
(1, 'Credit Card', 'Completed', '2024-06-01'),
(2, 'UPI', 'Completed', '2024-06-05'),
(3, 'Cash on Delivery', 'Pending', NULL),
(4, 'Credit Card', 'Completed', '2024-06-15'),
(5, 'Debit Card', 'Completed', '2024-06-20');

-- Reviews
INSERT INTO Reviews (customer_id, product_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Amazing sound quality!', '2024-06-02'),
(2, 3, 4, 'Very comfortable and soft.', '2024-06-06'),
(3, 3, 3, 'Color faded slightly after wash.', '2024-06-09'),
(4, 4, 5, 'Heats evenly and works perfectly.', '2024-06-21'),
(5, 2, 4, 'Responsive and smooth.', '2024-06-22');

-- ✅ Insert Sample Shipment Data
INSERT INTO Shipments (order_id, shipment_date, delivery_status) VALUES
(1, '2024-06-02', 'Delivered'),
(2, '2024-06-06', 'Delivered'),
(3, NULL, 'Pending'),
(4, '2024-06-16', 'Dispatched'),
(5, '2024-06-21', 'Delivered');

-- Insert Categories
INSERT INTO Categories (category_name) VALUES 
('Electronics'), ('Clothing'), ('Books');

-- Insert Products
INSERT INTO Products (name, description, price, stock, category_id) VALUES
('Bluetooth Speaker', 'Portable speaker with HD sound', 1999.00, 50, 1),
('Wireless Mouse', 'Ergonomic wireless mouse', 499.00, 150, 1),
('Cotton T-Shirt', '100% cotton plain t-shirt', 399.00, 200, 2),
('Denim Jeans', 'Slim-fit stretchable jeans', 999.00, 100, 2),
('Python Programming', 'Learn Python from scratch', 599.00, 80, 3);

-- Insert Customers
INSERT INTO Customers (name, email, phone, address) VALUES 
('John Doe', 'john@example.com', '9876543210', '123 Street, City'),
('Jane Smith', 'jane@example.com', '9123456780', '456 Avenue, City'),
('Alice Brown', 'alice2@example.com', '9988776655', '789 Road, City'); -- changed email

-- Insert Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-06-01', 2498.00),
(2, '2024-06-05', 1398.00),
(1, '2024-06-10', 599.00),
(3, '2024-06-15', 2398.00),
(2, '2024-06-20', 1398.00);

-- Insert Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1999.00),
(1, 2, 1, 499.00),
(2, 4, 1, 999.00),
(2, 3, 1, 399.00),
(3, 5, 1, 599.00),
(4, 1, 1, 1999.00),
(4, 2, 1, 399.00),
(5, 4, 1, 999.00),
(5, 3, 1, 399.00);

-- Insert Payments
INSERT INTO Payments (order_id, payment_method, payment_status, payment_date) VALUES
(1, 'Credit Card', 'Paid', '2024-06-01'),
(2, 'UPI', 'Paid', '2024-06-05'),
(3, 'Debit Card', 'Paid', '2024-06-10'),
(4, 'Net Banking', 'Paid', '2024-06-15'),
(5, 'Cash on Delivery', 'Pending', NULL);

-- Insert Reviews
INSERT INTO Reviews (customer_id, product_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Amazing speaker!', '2024-06-03'),
(2, 4, 4, 'Comfortable jeans', '2024-06-06'),
(3, 5, 5, 'Great for learning Python', '2024-06-12');





-- 1. List All Products with Their Categories and Prices
SELECT p.name AS product, c.category_name, p.price
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;

-- 2. Top 3 Best-Selling Products (by Quantity Sold)
SELECT p.name AS product, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 3;

-- 3. Total Revenue by Month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS revenue
FROM Orders
GROUP BY month
ORDER BY month;

-- 4. Customer Purchase History
SELECT c.name, o.order_id, o.order_date, p.name AS product, oi.quantity, oi.price
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
ORDER BY c.name, o.order_date;

-- 5. Average Product Rating
SELECT p.name AS product, ROUND(AVG(r.rating), 2) AS avg_rating
FROM Products p
JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id
ORDER BY avg_rating DESC;

-- 6. Pending Payments
SELECT p.payment_id, o.order_id, c.name AS customer, p.payment_method, p.payment_status
FROM Payments p
JOIN Orders o ON p.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE p.payment_status = 'Pending';

-- 7. Total Orders and Total Spend per Customer
SELECT c.name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- 8. Low Stock Alert (less than 20 units)
SELECT name AS product, stock
FROM Products
WHERE stock < 20;

-- 9. Products with No Reviews
SELECT p.name
FROM Products p
LEFT JOIN Reviews r ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- 10. Revenue Breakdown by Product
SELECT p.name AS product, SUM(oi.quantity * oi.price) AS total_revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC;

-- 11. Most Active Customers (by Order Count)
SELECT c.name, COUNT(o.order_id) AS order_count
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY order_count DESC
LIMIT 3;

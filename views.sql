-- 1. Top Selling Products View
CREATE VIEW top_selling_products AS
SELECT p.name AS product, SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_quantity_sold DESC;

-- 2. Customer Order History View
CREATE VIEW customer_order_history AS
SELECT c.name AS customer, o.order_id, o.order_date, p.name AS product, oi.quantity, oi.price
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- 3. Monthly Revenue Summary View
CREATE VIEW monthly_revenue_summary AS
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY month;

-- ✅ New View: Average Rating per Product
CREATE VIEW product_avg_rating AS
SELECT p.name AS product_name, AVG(r.rating) AS avg_rating
FROM Products p
JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id;

-- ✅ New View: Most Active Customers by Order Count
CREATE VIEW active_customers AS
SELECT c.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC;

CREATE OR REPLACE VIEW pending_restock_requests AS
SELECT
  r.request_id,
  r.product_id,
  r.product_name,
  r.current_stock,
  r.requested_at,
  r.status
FROM Restock_Requests r
WHERE r.status = 'Pending';


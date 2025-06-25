-- Trigger: Automatically reduce stock after inserting an order item
DELIMITER //

CREATE TRIGGER reduce_stock_after_order
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
  UPDATE Products
  SET stock = stock - NEW.quantity
  WHERE product_id = NEW.product_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER prevent_insufficient_stock
BEFORE INSERT ON Order_Items
FOR EACH ROW
BEGIN
  DECLARE current_stock INT;

  SELECT stock INTO current_stock
  FROM Products
  WHERE product_id = NEW.product_id;

  IF current_stock < NEW.quantity THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Not enough stock available.';
  END IF;
END //

DELIMITER ;

-- 🔁 Trigger: Log stock changes
DELIMITER //

CREATE TRIGGER log_stock_after_order
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
  INSERT INTO Stock_Log (product_id, change_type, quantity_changed)
  VALUES (NEW.product_id, 'ordered', NEW.quantity);
END //

DELIMITER ;

-- ✅ Step 2: Trigger to Log Low Stock Products (threshold = 10 units)
DELIMITER //

CREATE TRIGGER create_restock_request
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
  IF NEW.stock < 10 AND OLD.stock >= 10 THEN
    INSERT INTO Restock_Requests (product_id, product_name, current_stock)
    VALUES (NEW.product_id, NEW.name, NEW.stock);
  END IF;
END //

DELIMITER ;


-- Procedure: Get total spending of a specific customer
DELIMITER //

CREATE PROCEDURE get_customer_spending(IN cust_id INT)
BEGIN
  SELECT c.name AS customer_name, SUM(o.total_amount) AS total_spent
  FROM Customers c
  JOIN Orders o ON c.customer_id = o.customer_id
  WHERE c.customer_id = cust_id
  GROUP BY c.name;
END //

DELIMITER ;

-- ✅ Stored Procedure: Top N Selling Products
DELIMITER //

CREATE PROCEDURE top_selling_products(IN top_n INT)
BEGIN
  SELECT p.name AS product, SUM(oi.quantity) AS total_sold
  FROM Order_Items oi
  JOIN Products p ON oi.product_id = p.product_id
  GROUP BY oi.product_id
  ORDER BY total_sold DESC
  LIMIT top_n;
END //

DELIMITER ;

CALL get_customer_spending(1);
CALL top_selling_products(5);



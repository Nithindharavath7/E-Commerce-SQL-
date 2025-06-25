
-- ✅ Function 1: Apply 10% discount to a price
DELIMITER //

CREATE FUNCTION get_discount(price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN price * 0.90;
END //

-- ✅ Function 2: Calculate 18% GST on a price
CREATE FUNCTION calculate_gst(price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN price * 0.18;
END //

-- ✅ Function 3: Return final price after GST
CREATE FUNCTION price_after_tax(price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN price + (price * 0.18);
END //

DELIMITER ;

-- ✅ UDF: Return total item cost = quantity * unit price
DELIMITER //

CREATE FUNCTION total_item_cost(qty INT, price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN qty * price;
END //

-- ✅ UDF: Return star representation of rating (1 to 5)
CREATE FUNCTION rating_stars(rating INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  DECLARE result VARCHAR(10);
  SET result = REPEAT('⭐', rating);
  RETURN result;
END //

-- ✅ UDF: Delivery days based on delivery status
CREATE FUNCTION delivery_days(status VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
  CASE
    WHEN status = 'Delivered' THEN RETURN 0;
    WHEN status = 'Dispatched' THEN RETURN 2;
    WHEN status = 'Shipped' THEN RETURN 3;
    WHEN status = 'Pending' THEN RETURN 7;
    ELSE RETURN NULL;
  END CASE;
END //

DELIMITER ;



SELECT 
  name, 
  price, 
  get_discount(price) AS discounted_price, 
  calculate_gst(price) AS gst, 
  price_after_tax(price) AS final_price_with_tax
FROM Products;

SELECT rating, rating_stars(rating) AS stars FROM Reviews;



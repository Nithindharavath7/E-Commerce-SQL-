# 🛒 E-Commerce SQL Database Project

This project simulates the backend database of an online store using MySQL. It is designed to handle products, customers, orders, payments, reviews, and includes advanced SQL features like triggers, views, stored procedures, and user-defined functions (UDFs).

---

## 📦 Features

- **8+ normalized tables** for managing products, customers, orders, reviews, and payments.
- **Triggers** to reduce product stock and prevent low-stock orders automatically.
- **Stored Procedures** for customer spending and top-selling product reports.
- **Views** for monthly revenue, top sellers, order history, and customer analytics.
- **User-Defined Functions (UDFs)** for tax calculation, discounts, delivery estimates, and rating display.
- **Restock Logic** using a trigger and view to identify low-stock products.

---

## 🧱 Database Structure

```
1_schema.sql           -- Table creation
2_sample_data.sql      -- Sample data insert
3_views.sql            -- Analytical views
4_triggers.sql         -- Triggers for stock control
5_procedures.sql       -- Stored procedures
6_udfs.sql             -- User-defined functions
7_restock_logic.sql    -- Restock request table, trigger, and view
```

---

## 🛠️ Tech Stack

- MySQL
- MySQL Workbench (or any SQL client)

---

## 🧪 How to Run

1. Run `1_schema.sql` to create all tables.
2. Run `2_sample_data.sql` to insert demo data.
3. Execute files 3 to 7 in order to set up views, triggers, procedures, UDFs, and restock logic.
4. Example usage:
   ```sql
   CALL get_customer_spending(1);
   SELECT * FROM top_selling_products;
   SELECT * FROM pending_restock_requests;
   ```

---

## 📄 Author

Built with passion for SQL, data modeling, and backend systems.


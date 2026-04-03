create database ShopEase;
USE ShopEase;
-- TASK - 1 
-- Data Cleaning & Exploration
select * FROM shopease_orders_2023_2024;

--  How many orders are there in total? How many are Delivered / Returned / Cancelled?
SELECT 
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END) AS returned_orders,
    SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders
FROM shopease_orders_2023_2024;


-- Are there any missing values? Which columns have them, and why do you think they're blank?
SELECT
    SUM(CASE WHEN order_date IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN customer_id IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN customer_age IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_customer_age,
    SUM(CASE WHEN customer_city IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_customer_city,
    SUM(CASE WHEN region IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_region,
    SUM(CASE WHEN category IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN product_name IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_product_name,
    SUM(CASE WHEN quantity IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN unit_price_inr IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_unit_price,
    SUM(CASE WHEN discount_pct IN (NULL, ' ' ,'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_discount_pct,
    SUM(CASE WHEN net_revenue_inr IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_net_revenue,
    SUM(CASE WHEN payment_method IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_payment_method,
    SUM(CASE WHEN delivery_days IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_delivery_days,
    SUM(CASE WHEN return_reason IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_return_reason,
    SUM(CASE WHEN order_status IN (NULL, '', 'nan', 'NaN', 'NAN', 'null', 'NULL') THEN 1 ELSE 0 END) AS missing_order_status
FROM shopease_orders_2023_2024;
-/* Yes there is three columns have missing values:
1. delivery_days (152 missing) – because Cancelled orders never got delivered
2. return_reason (847 missing) – because only Returned orders have a return reason
3. discount_pct (352 missing) – likely 0% discount that was left blank instead of entered as zero*/


--  What is the date range of the dataset? How many orders fall in 2023 vs 2024?
SELECT 
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date,
    SUM(CASE WHEN year = 2023 THEN 1 ELSE 0 END) AS orders_2023,
    SUM(CASE WHEN year = 2024 THEN 1 ELSE 0 END) AS orders_2024
FROM shopease_orders_2023_2024;

--  What is the average delivery_days for Delivered orders, broken down by region?
SELECT 
    region,
    AVG(delivery_days) AS avg_delivery_days,
    COUNT(*) AS delivered_order_count
FROM shopease_orders_2023_2024
WHERE order_status = 'Delivered'
  AND delivery_days IS NOT NULL
GROUP BY region
ORDER BY avg_delivery_days;

--  Which age group (e.g. 18–25, 26–35, 36–45, 46+) placed the most orders?
SELECT 
    CASE 
        WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
        WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
        WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
        WHEN customer_age >= 46 THEN '46+'
    END AS age_group,
    COUNT(*) AS total_orders
FROM shopease_orders_2023_2024
GROUP BY age_group
ORDER BY total_orders DESC;

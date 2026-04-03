
-- TASK 2: SQL / Analysis Queries

-- • Which 3 categories generated the highest total net revenue across both years?
SELECT 
    category,
    SUM(net_revenue_inr) AS total_net_revenue
FROM shopease_orders_2023_2024
GROUP BY category
ORDER BY total_net_revenue DESC
LIMIT 3;

-- • Compare total net revenue 2023 vs 2024 — did the business grow year-on-year?
SELECT 
    year,
    SUM(net_revenue_inr) AS total_net_revenue
FROM shopease_orders_2023_2024
GROUP BY year;

-- • Which region had the highest average order value? Which had the most cancellations?
-- Part 1: Region with highest average order value
SELECT 
    region,
    AVG(net_revenue_inr) AS avg_order_value
FROM shopease_orders_2023_2024
GROUP BY region
ORDER BY avg_order_value DESC
LIMIT 1;

-- Part 2: Region with most cancellations
SELECT 
    region,
    COUNT(*) AS cancellation_count
FROM shopease_orders_2023_2024
WHERE order_status = 'Cancelled'
GROUP BY region
ORDER BY cancellation_count DESC
LIMIT 1;

-- • What is the most common return reason? Which category has the highest return rate?
-- Part 1: Most common return reason
SELECT 
    return_reason,
    COUNT(*) AS return_count
FROM shopease_orders_2023_2024
WHERE order_status = 'Returned'
GROUP BY return_reason
ORDER BY return_count DESC
LIMIT 1;

-- Part 2: Category with highest return rate
SELECT 
    category,
    ROUND(SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS return_rate_percent
FROM shopease_orders_2023_2024
GROUP BY category
ORDER BY return_rate_percent DESC
LIMIT 1;

-- • Which payment method is most popular, and does it vary by region?
-- Part 1: Most popular payment method overall
SELECT 
    payment_method,
    COUNT(*) AS usage_count
FROM shopease_orders_2023_2024
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 1;

-- Part 2: Does it vary by region?
use shopease;
SELECT 
    region,
    payment_method,
    COUNT(*) AS usage_count
FROM shopease_orders_2023_2024
GROUP BY region, payment_method
ORDER BY region, usage_count DESC;

-- • Find the top 5 products by total net revenue.
SELECT 
    product_name,
    SUM(net_revenue_inr) AS total_net_revenue
FROM shopease_orders_2023_2024
GROUP BY product_name
ORDER BY total_net_revenue DESC
LIMIT 5;

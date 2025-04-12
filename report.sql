-- Dashboard
-- 1.Total sales, total profit, total transactions, AOV, avg quantity
SELECT
  COUNT(*) AS total_transactions,
  SUM(total_sale) AS total_revenue,
  SUM(total_sale - cogs) AS total_profit,
  ROUND(SUM(total_sale) / COUNT(*), 2) AS avg_order_value,
  ROUND(AVG(quantiy), 2) AS avg_items_per_order
FROM retail_sales;

-- 2. SALE BY SHIFT
SELECT 
  CASE 
    WHEN HOUR(sale_time) < 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(*) AS total_orders,
  ROUND(SUM(total_sale), 2) AS total_sales
FROM retail_sales
GROUP BY shift;

-- 3. Monthly Sales Trend
SELECT 
  DATE_FORMAT(sale_date, '%Y-%m') AS period,
  ROUND(SUM(total_sale), 2) AS total_sales
FROM retail_sales
GROUP BY period
ORDER BY period;

-- 4.SALE BY AGE GROUP
SELECT 
  CASE 
    WHEN age < 20 THEN 'Under 20'
    WHEN age BETWEEN 20 AND 29 THEN '20s'
    WHEN age BETWEEN 30 AND 39 THEN '30s'
    WHEN age BETWEEN 40 AND 49 THEN '40s'
    ELSE '50+'
  END AS age_group,
  ROUND(SUM(total_sale), 2) AS total_sales,
  COUNT(*) AS orders,
  ROUND(AVG(total_sale), 2) AS avg_order_value
FROM retail_sales
GROUP BY age_group;

-- 5.GENDER SPENDING PATTERNS
SELECT 
  gender,
  COUNT(*) AS total_orders,
  ROUND(SUM(total_sale), 2) AS total_sales,
  ROUND(AVG(total_sale), 2) AS avg_order_value,
  ROUND(AVG(quantiy), 2) AS avg_quantity
FROM retail_sales
GROUP BY gender;

-- 6. CATEGORY,PROFIT,SALES
SELECT 
  category,
  ROUND(SUM(total_sale), 2) AS total_sales,
  ROUND(SUM(total_sale - cogs), 2) AS total_profit,
  ROUND(AVG(total_sale), 2) AS avg_order_value
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;



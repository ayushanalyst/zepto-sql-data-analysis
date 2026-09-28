CREATE TABLE zepto_data(
	SKU_id SERIAL PRIMARY KEY,
	Category VARCHAR(120),
    Name VARCHAR(120) NOT NULL,
    MRP INT,
    DiscountPercent DECIMAL(5,2),
	AvailableQuantity INT,
    DiscountedSellingPrice INT,
    WeightinGMS INT,
    OutofStock Boolean,
    Quantity INT
);
-- Data exploration

-- Count of Rows
SELECT COUNT(*) FROM zepto_data;

-- Sample Data
SELECT *
FROM zepto_data
LIMIT 10;

-- Finding NULL
SELECT *
FROM zepto_data
WHERE
	Name IS NULL
    OR
    Category IS NULL
    OR
    MRP IS NULL
    OR
    DiscountPercent IS NULL
    OR
    AvailableQuantity IS NULL
    OR
    DiscountedSellingPrice IS NULL
    OR
    WeightinGMS IS NULL
    OR
    OutofStock IS NULL
    OR
    Quantity is null;

-- Different Product Category
SELECT DISTINCT category
FROM zepto_data;

-- Product instock vs outofstock
SELECT
	OutofStock,
    COUNT(sku_id)
FROM zepto_data
GROUP BY OutofStock;

-- Product name present multiple time's
SELECT
	Name, COUNT(SKU_id) AS 'Number_of_sku'
FROM zepto_data
GROUP BY name
HAVING COUNT(SKU_id)>1
ORDER BY COUNT(SKU_id) DESC;

-- DELETE value with 0 MRP
SELECT *
FROM zepto_data
WHERE MRP = 0
OR DiscountedSellingPrice = 0;

DELETE FROM zepto_data
WHERE MRP = 0;

-- Convert paise to rupees
UPDATE zepto_data
SET MRP = MRP/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

-- Q1) Found top 10 best-value products based on discount percentage
SELECT
	Name,
    MRP,
    DiscountPercent
FROM zepto_data
ORDER BY DiscountPercent DESC
LIMIT 10;

-- Q2 Identified high-MRP products that are currently out of stock
SELECT
	DISTINCT Name,
	MRP
FROM zepto_data
WHERE OutofStock=1
ORDER BY MRP DESC;

-- Q3 Estimated potential revenue for each product category
SELECT
	category,
    SUM(discountedsellingprice*AvailableQuantity) AS Total_revenue
FROM zepto_data
GROUP BY Category
ORDER BY Total_revenue DESC;

-- Q4) Filtered expensive products (MRP > ₹500) with minimal discount
SELECT
	DISTINCT Name,
    MRP,
    DiscountPercent
FROM zepto_data
WHERE
	MRP>500 AND
    DiscountPercent<10
ORDER BY
	MRP DESC,
    DiscountPercent DESC;
    
-- Q5) Ranked top 5 categories offering highest average discounts
SELECT 
	category,
    ROUND(AVG(discountpercent),2) AS average_discount_percent
FROM Zepto_data
GROUP BY category
ORDER BY ROUND(AVG(discountpercent),2) DESC
LIMIT 5;

-- Q6) Calculated price per gram to identify value-for-money products
SELECT
	DISTINCT Name,
    weightinGMS,
    Discountedsellingprice,
    ROUND(DiscountedSellingPrice/WeightinGMS,2) AS price_per_gram
FROM zepto_data
WHERE WeightinGMS>=100
ORDER BY price_per_gram;

-- Q7) Grouped products based on weight into Low, Medium, and Bulk categories
SELECT
	DISTINCT Name,
    WeightinGMS,
    CASE
		WHEN WeightinGMS<=1000 THEN 'Low'
        WHEN WeightinGMS<=5000 THEN 'Medium'
        ELSE 'Bulk'
	END AS Weight_category
FROM zepto_data;

-- Q8) Measured total inventory weight per product category
SELECT
	category,
    SUM(weightinGMS * AvailableQuantity) AS Total_weight
FROM zepto_data
GROUP BY category
ORDER BY Total_weight;

    
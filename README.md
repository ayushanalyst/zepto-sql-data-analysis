# Zepto SQL Data Analysis

## 📌 Project Overview

This project analyzes Zepto product data using **MySQL** to explore pricing, discounts, inventory, stock availability, and category-level performance.

The project demonstrates the complete SQL workflow from **data exploration and cleaning to business-focused analysis**.

## 🛠️ Tools & Technologies

* MySQL
* MySQL Workbench
* SQL
* CSV Dataset

## 📊 Dataset

The dataset contains product-level information such as:

* Product Category
* Product Name
* MRP
* Discount Percentage
* Available Quantity
* Discounted Selling Price
* Product Weight
* Stock Availability
* Quantity

## 🔍 Analysis Performed

### Data Exploration

* Counted total records
* Reviewed sample data
* Identified NULL values
* Identified distinct product categories
* Analyzed in-stock vs out-of-stock products
* Identified products appearing multiple times

### Data Cleaning

* Identified records with zero MRP
* Removed invalid zero-MRP records
* Converted product prices from paise to rupees

### Business Analysis

The project answers questions such as:

1. What are the top 10 products based on discount percentage?
2. Which high-MRP products are currently out of stock?
3. What is the estimated potential revenue by category?
4. Which expensive products have minimal discounts?
5. Which categories offer the highest average discounts?
6. Which products provide the best price per gram?
7. How can products be categorized based on weight?
8. What is the total inventory weight by category?

## 🧠 SQL Concepts Used

* CREATE TABLE
* SELECT
* WHERE
* DISTINCT
* GROUP BY
* HAVING
* ORDER BY
* LIMIT
* COUNT()
* SUM()
* AVG()
* ROUND()
* CASE statements
* UPDATE
* DELETE
* Aggregate Functions
* Data Cleaning & Business Analysis

## 📁 Project Structure

```text
zepto-sql-data-analysis/
│
├── README.md
├── zepto_analysis.sql
└── zepto_v2.csv
```

## 🎯 Key Learning

This project strengthened practical SQL skills by transforming raw product data into structured business insights through **data exploration, cleaning, aggregation, filtering, and analytical queries**.

## 👤 Author

**Ayush Sharma**

Aspiring Data Analyst | Business Analyst | Operations Analyst

# 🛍️ Customer Shopping Behaviour Analysis

## 📌 Project Overview
This project analyzes customer shopping behaviour to identify purchasing patterns, customer demographics, product performance, and revenue drivers.  
The analysis is performed using **MySQL, Python (Jupyter Notebook), and Power BI** to deliver actionable business insights.

---

## 🎯 Objective
- Understand customer purchasing behaviour
- Identify high-value customers
- Analyze product categories and seasonal trends
- Compare subscription vs non-subscription spending
- Support business decision-making using data

---

## 🗂️ Dataset Information
The dataset includes the following attributes:
- Customer ID
- Age, Gender, Location
- Item Purchased & Category
- Purchase Amount (USD)
- Frequency of Purchases
- Subscription Status
- Discount Applied
- Payment Method
- Season
- Review Rating
- Previous Purchases

---

## 🛠️ Tools & Technologies
| Tool | Purpose |
|-----|--------|
| MySQL | Data storage & analytical queries |
| Python (Pandas, Matplotlib) | Data cleaning, EDA, RFM analysis |
| Jupyter Notebook | Python execution & visualization |
| Power BI | Interactive dashboard & reporting |
| GitHub | Version control & project sharing |

---

## 🧮 SQL Analysis (MySQL)
File: `SQL/shopping_behaviour_queries.sql`

Key analysis performed:
- Total purchases, total sales, average purchase value
- Distinct customer count
- Sales by category and location
- Payment method usage
- Subscription vs spending analysis
- High-value purchases
- Repeat customers
- Subqueries, CASE statements, Window functions

Example:
```sql
SELECT Category,
       SUM(`Purchase Amount (USD)`) AS category_sales
FROM project1.`shopping behavior`
GROUP BY Category;

# Customer Shopping Behavior Analysis

An end-to-end data analytics project analyzing **3,900 customer transactions** to understand shopping patterns, customer segments, product preferences, and subscription behavior.

## Project Overview

This project uses **Python, MySQL, and Power BI** to transform raw customer transaction data into actionable business insights.

### Dataset

* **3,900 rows**
* **18 columns**
* Customer demographics
* Purchase details
* Shopping behavior
* Subscription status
* Review ratings and shipping information
* 37 missing values in the `Review Rating` column

## Tools & Technologies

* **Python** — Data cleaning & feature engineering
* **Pandas** — Data manipulation and exploration
* **MySQL** — SQL-based business analysis
* **Power BI** — Interactive dashboard & visualization

## Project Workflow

**Raw Data → Python → MySQL → SQL Analysis → Power BI Dashboard**

### 1. Data Preparation — Python

* Loaded and explored the dataset using Pandas
* Handled missing review ratings using the median rating by product category
* Standardized column names to `snake_case`
* Created `age_group` and `purchase_frequency_days` features
* Removed the redundant `promo_code_used` column
* Loaded the cleaned data into MySQL

### 2. Business Analysis — MySQL

The analysis focused on key business questions, including:

* Revenue comparison by gender
* High-spending customers using discounts
* Top 5 products by average rating
* Standard vs. Express shipping spending
* Subscribers vs. non-subscribers
* Products most dependent on discounts
* Customer segmentation into **New, Returning, and Loyal**
* Top 3 products within each category
* Relationship between repeat purchases and subscriptions
* Revenue contribution by age group

### 3. Power BI Dashboard

An interactive **Power BI dashboard** was created to visualize the analyzed data and present the key findings in an accessible format.

## Business Recommendations

* **Boost Subscriptions** — Promote exclusive subscriber benefits
* **Build Customer Loyalty** — Reward repeat buyers and encourage movement into the Loyal segment
* **Review Discount Strategy** — Balance increased sales with margin control
* **Improve Product Positioning** — Highlight highly rated and best-selling products
* **Use Targeted Marketing** — Focus on high-revenue age groups and Express-shipping users


## Key Outcome

The project demonstrates an end-to-end analytics workflow, from **data cleaning and feature engineering to SQL analysis and interactive business intelligence reporting**.

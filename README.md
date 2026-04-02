# ShopEase Online Orders Analysis (2023-2024)

## GitHub Repository
🔗 https://github.com/shishirsalunkhe/shopease_orders

## Project Overview
This project analyzes e-commerce order data for ShopEase, covering January 2023 to December 2024. The analysis includes data cleaning, exploratory analysis, SQL queries, and visualizations to uncover business insights.

## Dataset
- **File:** `shopease_orders_2023_2024.csv`
- **Table Name:** `shopease_orders_2023_2024`
- **Rows:** 1,000 orders
- **Time Period:** January 2023 – December 2024
- **Categories:** 7 product categories
- **Regions:** 5 regions (North, South, East, West, Central)
- **Payment Methods:** 6 methods (Credit Card, UPI, Debit Card, Net Banking, COD, Wallet)

## Project Files
- `shopease_orders_2023_2024.csv` - Raw dataset
- `TASK-1.sql` - SQL queries for Task 1 (Data Cleaning & Exploration)
- `TASK-2.sql` - SQL queries for Task 2 (Analysis Queries)
- `TASK-3.ipynb` - Jupyter Notebook for Task 3 (Visualizations)
- `TASK-4.ipynb` - Jupyter Notebook for Task 4 (Written Summary)
- `README.md` - Project documentation

## Key Findings
- **Top revenue category:** Beauty
- **Revenue growth:** Increased in 2024, especially during festive months
- **Problem area:** East and West regions have highest cancellations (35 each)
- **Main customer age group:** 26-35 years
- **Missing values:** delivery_days (152), return_reason (847), discount_pct (352)

## Tools & Libraries Used

### SQL (Tasks 1 & 2)
- Database: MySQL 

### Python (Task 3)
- Language: Python 
- Libraries: pandas, matplotlib

## How to Run

### SQL Queries (Tasks 1 & 2)

-- 1. Create database
```sql
CREATE DATABASE ShopEase;
USE ShopEase;
```

-- 2. Import CSV into table 'shopease_orders_2023_2024'

-- 3. Run queries from TASK-1.sql and TASK-2.sql
-- Python Visualizations (Task 3)

# Install required libraries
```bash
pip install pandas matplotlib
```
# Open Jupyter Notebook
```
jupyter notebook
```
# Run TASK-3.ipynb

## Author
### Shishir Salunkhe 

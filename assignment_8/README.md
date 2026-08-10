# Assignment 8 – Python + SQL Integration

## Project Overview

This project is a simple e-commerce data analysis and reporting system built using Python and SQLite.

The project loads clean datasets into a SQLite database, performs SQL-based analysis, generates sales reports, and handles different edge cases using Python test functions.

## Technologies Used

- Python 3.10
- SQLite
- Pandas
- Jupyter Notebook
- SQL

## Project Structure

assignment_8/
│
├── data/
│   └── raw/
│       ├── order_items.csv
│       ├── orders.csv
│       ├── products.csv
│       └── users.csv
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── ecommerce.db
│   └── reports/
│       ├── monthly_sales_report.csv
│       └── weekly_sales_report.csv
│
├── README.md
└── requirements.txt

## Part 1 – Data Understanding

The datasets were explored and understood before loading them into the database.

The main entities include:

- Users
- Orders
- Order Items
- Products

### Orders

- `order_id`
- `user_id`
- `order_date`
- `order_status`
- `total_amount`

### Order Items

- `order_item_id`
- `order_id`
- `product_id`
- `user_id`
- `quantity`
- `item_price`
- `item_total`

### Products

- `product_id`
- `product_name`
- `category`
- `brand`
- `price`
- `rating`

## Part 2 – Data Analysis

The project performs different analysis tasks on the e-commerce data.

The analysis includes:

- Customer analysis
- Product analysis
- Category performance
- Brand performance
- Revenue analysis
- RFM customer analysis
- Frequently bought together products

## Part 3 – SQL Analytics

SQL queries were used to analyze the SQLite database.

The analysis includes:

- Top products by revenue
- Category performance
- Brand performance
- Customer segments
- RFM scores
- Products frequently bought together

## Part 4 – Python + SQLite Integration

Python was integrated with SQLite to generate sales reports.

The application:

1. Takes the report type as input:
   - Daily
   - Weekly
   - Monthly

2. Takes the start date and end date as input.

3. Connects to the SQLite database.

4. Generates sales reports using SQL queries.

5. Displays:
   - Total orders
   - Total revenue
   - Unique customers
   - Top 3 products
   - Previous period comparison
   - Revenue percentage change
   - Orders percentage change

### Example Monthly Report

```text
SALES SUMMARY REPORT

Report Type     : monthly
Start Date      : 2024-01-01
End Date        : 2024-12-31

SUMMARY

Total Orders    : 10758
Total Revenue   : 6481438.85
Unique Customers: 6614

TOP 3 PRODUCTS

1. Zenith Phone | Quantity Sold: 20 | Revenue: 43399.60
2. Pulse Treat  | Quantity Sold: 32 | Revenue: 39565.44
3. Harbor Onto  | Quantity Sold: 31 | Revenue: 38030.18
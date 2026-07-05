# Superstore Sales Analysis using SQL

## Project Overview
This project analyzes the **Superstore dataset** using SQL in **MySQL Workbench**.  
The main objective of this project is to perform sales analysis by applying:

- **Subqueries**
- **Common Table Expressions (CTEs)**
- **Window Functions**

The project answers important business questions such as:
- finding orders above average sales
- identifying the highest sales order for each customer
- calculating total sales per customer
- finding customers with above-average sales
- ranking customers based on total sales
- identifying top and bottom customers
- finding customers who made only one order

---

## Objective
To analyze sales data from the Superstore dataset using SQL and generate customer-level business insights with the help of **Subqueries, CTEs, and Window Functions**.

---

## Dataset
The project uses the **Superstore dataset**, which contains information related to:
- Orders
- Customers
- Products
- Sales
- Quantity
- Discount
- Profit

The dataset was first imported into a raw table named **`superstore_raw`**.

---

## Database Setup
The raw dataset was imported into **`superstore_raw`** and then split into the following normalized tables:

- **customers**
- **products**
- **orders**

### Tables Created
1. **customers**  
   Stores customer-related details such as customer ID, customer name, segment, country, city, state, postal code, and region.

2. **products**  
   Stores product-related details such as product ID, category, sub-category, and product name.

3. **orders**  
   Stores order-level transactional details such as order ID, dates, sales, quantity, discount, and profit.

---

## SQL Concepts Used

### 1. Subqueries
Used for:
- finding orders where sales are greater than average sales
- finding the highest sales order for each customer

### 2. Common Table Expressions (CTEs)
Used for:
- calculating total sales for each customer
- finding customers whose total sales are above average
- identifying top and bottom customers

### 3. Window Functions
Used for:
- ranking customers based on total sales
- assigning row numbers to orders within each customer
- displaying top 3 customers based on sales

---

## Queries Performed

### Required Queries
1. Find all orders where sales are greater than average sales  
2. Find the highest sales order for each customer  
3. Calculate total sales for each customer  
4. Find customers whose total sales are above average  
5. Rank all customers based on total sales  
6. Assign row numbers to each order within a customer  
7. Display top 3 customers based on total sales  

### Final Combined Query
- Display **Customer Name, Total Sales, and Rank** using **JOIN + CTE + Window Function**

### Mini Project: Customer Sales Insights
1. Top 5 customers  
2. Bottom 5 customers  
3. Customers who made only one order  
4. Customers with above-average sales  
5. Highest order value per customer  

---

## Project Files
This repository contains the following files:

- **01_SQL_SETUP.sql** → database setup, table creation, and data insertion queries  
- **02_Required_Queries.sql** → all required assignment queries  
- **03_Final_Combined_Query.sql** → final combined query  
- **04_Mini_Project_Insights.sql** → mini project queries  
- **Week 3 Task.docx / report.pdf** → report containing query outputs, explanations, and conclusion  
- **README.md** → project documentation  

---

## Tools Used
- **MySQL Workbench**
- **SQL**
- **Superstore Dataset**

---

## Key Insights
- A small group of customers contributes a significant portion of total sales.
- Customers with above-average sales represent high-value customers.
- Ranking customers helps identify top-performing and low-performing customers.
- Customers who placed only one order are useful for retention analysis.
- Highest order value per customer helps identify premium or bulk-purchase customers.

---

## Conclusion
This project demonstrates how SQL can be used to analyze retail sales data and generate meaningful customer-level insights. By applying **Subqueries, CTEs, and Window Functions**, the project identifies high-value customers, sales patterns, customer ranking, and order-level trends from the Superstore dataset.

---
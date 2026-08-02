# Delta Lake MERGE Assignment

## Objective

The objective of this assignment is to implement Delta Lake MERGE functionality in Azure Databricks. The project demonstrates how to load data from a CSV file, convert it into Delta format, perform update and insert operations using the MERGE command, and validate the final output.

---

## Technologies Used

- Azure Databricks
- Apache Spark (PySpark)
- Delta Lake
- Python

---

## Dataset

**Dataset Name:** Superstore Dataset

The dataset contains order details, customer information, product details, sales, quantity, discount, and profit.

---

## Project Workflow

### Step 1: Load CSV Dataset
- Uploaded the Superstore CSV file to Unity Catalog Volume.
- Loaded the dataset into a Spark DataFrame.
- Displayed sample records.

### Step 2: Explore the Dataset
- Displayed the first few rows.
- Examined the schema.
- Verified the number of rows and columns.

### Step 3: Clean Column Names
- Replaced spaces and special characters in column names with underscores.
- Prepared the dataset for Delta Lake operations.

### Step 4: Create Delta Table
- Converted the DataFrame into Delta format.
- Saved the Delta table in Unity Catalog Volume.

### Step 5: Read Delta Table
- Loaded the Delta table.
- Verified successful creation by
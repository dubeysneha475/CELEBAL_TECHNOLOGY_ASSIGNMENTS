# Week 5. Spark Data Processing using PySpark

## Objective

The goal of this assignment is to learn about Apache Spark and how to use it to clean, transform and analyze data with PySpark. We will be working with Spark DataFrames to do this.

This assignment shows how PySpark can be used to process and analyze data quickly and efficiently. We will be using DataFrame operations to do this.

## Tools and Technologies Used

- Python

- PySpark

- Apache Spark

- Google Colab

- Spark DataFrames

- CSV Dataset

## Dataset

We used the **Superstore Sales Dataset** for this assignment.

This dataset has information about:

- Orders

- Customers

- Products

- Categories

- Sales

- Profit

- Quantity

- Discount

- Cities

- States

- Regions

Some questions in the assignment required columns that were not in the Superstore dataset. So we used existing columns. Created new ones to show how to use PySpark.

## Tasks Performed

We covered the following Spark concepts and operations:

1. We learned about the limitations of MapReduce and the advantages of Apache Spark.

2. We understood how Spark uses in-memory computing.

3. We removed duplicate records using the `dropDuplicates()` function.

4. We filtered records based on conditions.

5. We handled values using `na.drop()` and `na.fill()`.

6. We grouped data using `groupBy()`.

7. We used aggregation functions like:

`Count()`

`Sum()`

`Avg()`

`Min()`

`Max()`

8. We learned about Spark DataFrame immutability.

9. We changed the schema and data types.

10. We converted date values into timestamp format.

11. We studied transformations and shuffle operations.

12. We handled empty values.

13. We used `.agg()` to calculate statistics.

14. We learned about the risks of automatic schema inference on data.

15. We built a Spark data-processing pipeline.

## Key Data Processing Operations

### Duplicate Removal

We removed duplicate records using PySparks `dropDuplicates()` function.

### Data Filtering

We filtered DataFrames using conditions to get only the required records.

### Null Value Handling

We handled missing values using functions like:

- `na.drop()`

- `na.fill()`

- `isNotNull()`

### Aggregation

We did aggregation operations using:

- `groupBy()`

- `count()`

- `sum()`

- `avg()`

- `min()`

- `max()`

- `mean()`

### Schema Modification

We changed columns into the data types using casting and timestamp conversion functions.

We changed the `Order Date` column into timestamp format. Renamed it to `event_time`.

### Final Data Processing Pipeline

We made a PySpark pipeline that:

- Removed duplicate records.

- Changed sales values into format.

- Filled missing numerical values with `0`.

- Grouped records using an identifier.

- Calculated total revenue using aggregation.

- Generated the final processed result.

Since the Superstore dataset did not have exact `price` and `store_id` columns we used the `Sales` column as the equivalent numerical value and `Customer ID` as a grouping identifier.

## Output

This assignment produces:

- PySpark code and query results

- Cleaned and transformed data

- Aggregated results

- processed CSV file

- Brief insights for each data-processing operation

## Files in Repository

- `Week5_Spark_Assignment.ipynb`. PySpark implementation and query outputs

- `superstore_raw.csv`. Input Superstore dataset

- `week5_final_result.csv`. Final processed and aggregated result

- `WEEK 5 ASSIGNMENT.pdf`. Assignment report containing questions, answers, outputs and insights

## Key Learnings

From this assignment I learned how Apache Spark processes large datasets efficiently using DataFrames and in-memory computation. I got experience in data cleaning handling missing and inconsistent values, filtering, grouping, aggregation, schema modification and building an end-to-end data-processing pipeline using PySpark.

I also learned about Spark DataFrame immutability, wide transformations, shuffle operations and the importance of handling schema and data types during data processing.

##

This assignment gave me experience, with Apache Spark and PySpark DataFrames. We cleaned, transformed, filtered and aggregated the Superstore dataset using Spark operations.

The final processing pipeline combined data-processing steps and generated an aggregated CSV output. This showed how PySpark can be used to transform data into meaningful and structured information for further analysis.
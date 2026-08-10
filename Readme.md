# Late Transaction Revenue Correction

A real-world Data Engineering project built using Databricks, PySpark, Delta Lake, Auto Loader, Spark SQL, and Medallion Architecture.

The project addresses the problem of late-arriving transactions, where transactions enter the system after their actual transaction date and can make previously generated historical revenue reports inaccurate.

The pipeline identifies late transactions, determines the historical dates affected by them, recalculates the correct revenue, and updates the Gold layer using Delta Lake MERGE without unnecessarily rebuilding the complete dataset.

---

## Objective

The objective of this project is to build a reliable and scalable data engineering pipeline that can:

- Ingest transaction data incrementally
- Store raw data in the Bronze layer
- Clean and validate data in the Silver layer
- Generate daily revenue reports in the Gold layer
- Detect late-arriving transactions
- Identify affected historical dates
- Recalculate revenue only for affected dates
- Correct historical revenue using Delta Lake MERGE
- Perform data quality validation
- Track processing progress using watermark-based processing

---

## Business Problem

In real-world data systems, a transaction may occur on one date but reach the data platform several days later.

For example:

```text
txn_date       = 2024-02-17
ingestion_date = 2024-02-27
```

Since the transaction arrived after its actual transaction date, it is considered a late-arriving transaction.

If the daily revenue report was generated before this transaction arrived, the historical revenue for that transaction date would be incorrect.

Reprocessing the entire historical dataset every time a late transaction arrives is inefficient and does not scale well.

This project solves the problem by identifying the affected historical dates and correcting only the required revenue records.

---

## Solution

The pipeline follows this approach:

```text
Detect Late Transactions
        ↓
Identify Affected Historical Dates
        ↓
Recalculate Revenue for Affected Dates
        ↓
Apply Delta Lake MERGE
        ↓
Validate Corrected Gold Data
```

Instead of rebuilding the complete Gold dataset, only the affected historical records are corrected.

---

## Architecture

The project follows the Medallion Architecture:

```text
                    SOURCE
                       │
                       ▼
                CSV Transaction Data
                       │
                       ▼
              Databricks Auto Loader
                       │
                       ▼
              ┌─────────────────┐
              │  BRONZE LAYER   │
              │    Raw Data     │
              │   Delta Table   │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │  SILVER LAYER   │
              │    Cleaning     │
              │   Validation    │
              │  Deduplication  │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │   GOLD LAYER    │
              │ Daily Revenue   │
              └────────┬────────┘
                       │
                       ▼
            Late Transaction Detection
                       │
                       ▼
             Affected Historical Dates
                       │
                       ▼
              Revenue Recalculation
                       │
                       ▼
                Delta Lake MERGE
                       │
                       ▼
              Corrected Gold Revenue
                       │
                       ▼
              Data Quality Validation
                       │
                       ▼
              Watermark Tracking
```

---

## Workflow

### 1. Bronze Layer — Raw Data Ingestion

Raw transaction CSV files are ingested using Databricks Auto Loader.

The Bronze layer stores the incoming data in Delta format and uses checkpointing to support reliable incremental ingestion.

### 2. Silver Layer — Data Cleaning and Validation

The Bronze data is transformed into a clean Silver dataset.

The processing includes:

- Converting transaction dates into proper date format
- Converting ingestion dates into proper date format
- Removing duplicate transactions using txn_id
- Filtering invalid transaction amounts
- Preparing the dataset for downstream processing

### 3. Gold Layer — Daily Revenue Reporting

The cleaned Silver data is aggregated to generate daily revenue metrics.

The Gold layer acts as the reporting layer containing revenue information grouped by transaction date.

### 4. Late Transaction Detection

A transaction is classified as late when:

```text
ingestion_date > txn_date
```

The pipeline identifies these late-arriving transactions using PySpark.

### 5. Affected Historical Date Identification

After detecting late transactions, the pipeline extracts the unique transaction dates associated with those late records.

Only these historical dates need to be corrected.

### 6. Revenue Recalculation

For every affected historical date, revenue is recalculated using the available Silver-layer transaction data.

This ensures that late-arriving transactions are included in the corrected historical revenue.

### 7. Delta Lake MERGE

The corrected revenue is applied to the Gold Delta table using Delta Lake MERGE.

The MERGE operation:

- Updates existing affected dates
- Inserts dates that do not already exist
- Leaves unaffected historical records unchanged

This avoids rebuilding the complete Gold table.

### 8. Data Quality Validation

The pipeline performs data quality checks to validate the processed data.

The checks include:

- Null transaction IDs
- Duplicate transaction IDs
- Negative transaction amounts

### 9. Watermark-Based Processing

A watermark control table is maintained to track the latest successfully processed date.

The project also configures a Spark streaming watermark to manage late-arriving data and support incremental processing.

---

## Technology Stack

- Databricks
- Apache Spark
- PySpark
- Delta Lake
- Auto Loader
- Spark SQL
- Python
- Medallion Architecture

---

## Dataset

The project uses a transaction dataset containing 2,000 records.

The main fields used in the pipeline are:

| Column | Description |
|---|---|
| txn_id | Unique transaction identifier |
| user_id | Customer identifier |
| txn_date | Date on which the transaction occurred |
| amount | Transaction amount |
| ingestion_date | Date on which the transaction entered the system |

The most important fields for detecting delayed transactions are:

- txn_date
- ingestion_date

---

## Key Data Engineering Concepts

### Auto Loader

Used for incremental ingestion of incoming CSV files into the Bronze layer.

### Medallion Architecture

The pipeline separates data processing into:

```text
Bronze → Silver → Gold
```

Bronze contains raw data, Silver contains cleaned and validated data, and Gold contains business-level revenue information.

### Delta Lake

Delta Lake is used for reliable storage and transactional updates.

### Delta MERGE

MERGE is used to correct only the historical records affected by late transactions.

### Late-Arriving Data

Late transactions are identified using:

```text
ingestion_date > txn_date
```

### Data Quality

The pipeline validates transaction IDs, duplicates, and transaction amounts before relying on the processed data.

### Watermark

Watermark configuration is used to manage late-arriving data and track processing progress.

---

## Key Feature

The most important feature of this project is selective historical correction.

Instead of recalculating the entire revenue history:

```text
Entire Historical Dataset
        ↓
Full Reprocessing
```

the pipeline performs:

```text
Late Transactions
        ↓
Affected Dates
        ↓
Recalculate Only Those Dates
        ↓
Delta MERGE
        ↓
Corrected Gold Data
```

This makes the pipeline more efficient and scalable.

---

## Complete Project Flow

```text
CSV Source
    ↓
Auto Loader
    ↓
Bronze Delta Layer
    ↓
Silver Cleaning & Validation
    ↓
Gold Daily Revenue
    ↓
Late Transaction Detection
    ↓
Affected Historical Dates
    ↓
Revenue Recalculation
    ↓
Delta Lake MERGE
    ↓
Corrected Gold Revenue
    ↓
Data Quality Checks
    ↓
Watermark Tracking
    ↓
Final Gold Validation
```

---

## Project Status

**Completed**

- [x] Databricks setup
- [x] Source CSV ingestion
- [x] Bronze layer
- [x] Auto Loader ingestion
- [x] Bronze validation
- [x] Silver layer
- [x] Silver validation
- [x] Gold revenue layer
- [x] Gold validation
- [x] Late transaction detection
- [x] Affected historical date identification
- [x] Revenue recalculation
- [x] Delta Lake MERGE
- [x] Data quality validation
- [x] Watermark configuration
- [x] Final Gold validation

---

## Project Outcome

The project successfully implements a complete data engineering pipeline for handling late-arriving transactions and correcting affected historical revenue.

The pipeline successfully:

- Ingests transaction data using Auto Loader
- Processes data through Bronze, Silver, and Gold layers
- Detects late-arriving transactions
- Identifies affected historical dates
- Recalculates corrected revenue
- Updates the Gold layer using Delta Lake MERGE
- Performs data quality validation
- Tracks processing progress using watermark-based processing

The final outcome is a more reliable historical revenue reporting process without unnecessarily reprocessing the complete dataset.

---

## Conclusion

The Late Transaction Revenue Correction project demonstrates how modern data engineering technologies can be used to solve real-world delayed-data problems.

By combining Databricks, PySpark, Delta Lake, Auto Loader, Spark SQL, and Medallion Architecture, the pipeline provides a structured approach for ingesting, cleaning, processing, validating, and correcting transaction data.

The use of affected-date identification and Delta Lake MERGE makes the correction process more efficient by updating only the historical records impacted by late-arriving transactions.

---

## Future Scope

The project can be further enhanced by:

- Developing a FastAPI backend to expose processed data through REST APIs
- Adding a web-based dashboard for revenue and pipeline monitoring
- Scheduling the pipeline using Databricks Jobs
- Implementing advanced data quality frameworks and automated validation
- Adding monitoring and alerting for pipeline failures
- Adding detailed revenue analytics and reporting
- Deploying the complete pipeline in a production cloud environment

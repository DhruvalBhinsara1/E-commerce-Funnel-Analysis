# E-Commerce Funnel Analysis Project

## Overview

This project analyzes customer behavior in an e-commerce funnel using real behavioral data from a multi-category online store. The focus is on understanding user journeys from product views to purchases, identifying drop-off points, and deriving actionable business insights to improve conversion rates.

## Dataset

-   **Source:** Kaggle (REES46 E-commerce Behavior Dataset)
-   **Events Tracked:** Product views, cart additions, cart removals, purchases
-   **Key Columns:**
    -   `event_time`: Timestamp of each user action
    -   `event_type`: Type of event (view, cart, remove_from_cart, purchase)
    -   `product_id`, `category_code`, `brand`, `price`: Product details
    -   `user_id`, `user_session`: User and session identifiers
-   **Note:** The dataset is pre-cleaned, allowing us to begin directly with data import and analysis.

## Tech Stack

-   **Data Import & Management:** SQL Server Management Studio (SSMS Import Wizard), SQL Server
-   **Analysis & Metrics:** SQL Server (T-SQL), Python (pandas, matplotlib, seaborn in Jupyter Notebook)
-   **Visualization:** Tableau, Power BI, Python (Seaborn, Plotly, Matplotlib)
-   **Documentation:** Jupyter Notebooks, Markdown
-   **Version Control:** Git, GitHub

## Objectives

-   Import the cleaned CSV dataset into SQL Server for efficient querying
-   Verify data integrity and perform initial validation
-   Map user journeys through the e-commerce funnel
-   Calculate conversion rates and identify drop-off points
-   Analyze performance by product categories, brands, and user segments
-   Create visualizations and dashboards for insights
-   Provide business recommendations for funnel optimization

## Methodology

### [x] 1. Data Import to SQL Server

-   **Tech Used:** SQL Server Management Studio (SSMS) Import Wizard
-   **Steps:**
    -   Launch SSMS and connect to the target database
    -   Right-click on the database > Tasks > Import Data
    -   Select Flat File Source, browse to the CSV file
    -   Configure column mappings and data types (DATETIME for event_time, NVARCHAR for strings, BIGINT for IDs, DECIMAL for price)
    -   Execute the import and verify success
-   **Checks:** Confirm row count matches the CSV, no import errors, and sample data looks correct

### [x] 2. Data Validation

-   **Tech Used:** SQL Server (T-SQL queries)
-   **Steps:**
    -   Run `SELECT COUNT(*) FROM ecommerce_events` to verify total rows
    -   Check for nulls: `SELECT COUNT(*) FROM ecommerce_events WHERE event_time IS NULL OR user_id IS NULL`
    -   Validate data types: `SELECT TOP 10 * FROM ecommerce_events` to inspect sample records
    -   Ensure event types are valid: `SELECT DISTINCT event_type FROM ecommerce_events`
-   **Checks:** Data completeness, no unexpected nulls in key columns, correct data types, and logical consistency (e.g., prices > 0)

Deleted **68673** records where price was *0* or in negative.

### [x] 3. Exploratory Data Analysis (EDA)

-   **Tech Used:** SQL Server for queries, Python (pandas, matplotlib/seaborn in Jupyter Notebook) for advanced analysis and visualization
-   **Steps:**
    -   **SQL:** Analyze event distribution: `SELECT event_type, COUNT(*) FROM ecommerce_events GROUP BY event_type`
    -   **SQL:** Check time range: `SELECT MIN(event_time), MAX(event_time) FROM ecommerce_events`
    -   **SQL:** Identify top products/categories: `SELECT TOP 10 category_code, COUNT(*) FROM ecommerce_events GROUP BY category_code ORDER BY COUNT(*) DESC`
    -   **SQL:** User behavior patterns: `SELECT user_id, COUNT(DISTINCT user_session) FROM ecommerce_events GROUP BY user_id HAVING COUNT(DISTINCT user_session) > 1`
    -   **Python:** Trend analysis: Load data into pandas, use datetime functions to analyze daily/hourly event patterns, create plots with matplotlib/seaborn
-   **Checks:** Event type frequencies, temporal patterns, popular categories/brands, user engagement metrics, data quality issues

### [x] 4. Funnel Mapping

-   **Tech Used:** SQL Server (T-SQL with window functions and CTEs)
-   **Steps:**
    -   Define funnel stages and assign sequence numbers per session
    -   Use CTEs to track user journeys: `WITH SessionEvents AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY user_session ORDER BY event_time) AS step FROM ecommerce_events)`
    -   Identify conversion paths and drop-offs
-   **Checks:** Correct session grouping, logical event sequences, funnel progression rates

### 5. Metrics Calculation

-   **Tech Used:** SQL Server (T-SQL aggregations), Python (pandas for advanced calculations)
-   **Steps:**
    -   Calculate conversion rates: `SELECT COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_session END) * 1.0 / COUNT(DISTINCT user_session) FROM ecommerce_events`
    -   Compute drop-off rates between stages
    -   Revenue analysis: `SELECT SUM(price) FROM ecommerce_events WHERE event_type = 'purchase'`
    -   Segment metrics by category/brand/user type
-   **Checks:** Accurate percentages, revenue totals, segment comparisons

### 6. Visualization & Reporting

-   **Tech Used:** Tableau/Power BI (for dashboards), Python (matplotlib, seaborn, plotly in Jupyter)
-   **Steps:**
    -   Create funnel charts showing conversion at each stage
    -   Build heatmaps for drop-off analysis
    -   Develop time-series plots for trend analysis
    -   Design interactive dashboards with filters for categories/brands
-   **Checks:** Visual accuracy, interactivity, clear insights presentation

### 7. Insights & Recommendations

-   **Tech Used:** Analysis of metrics and visualizations
-   **Steps:**
    -   Identify bottlenecks in the funnel
    -   Compare high vs. low-performing segments
    -   Formulate actionable recommendations (e.g., optimize cart flow for low-conversion categories)
-   **Checks:** Business relevance, feasibility of suggestions

## Deliverables

-   SSMS import configuration and table schema
-   Data validation queries
-   Analysis notebooks with SQL and Python code
-   Visualization files and dashboards
-   Summary report with key findings and recommendations

## Expected Outcomes

This project demonstrates proficiency in:

-   Handling large-scale e-commerce event data
-   SQL Server data management and analysis
-   Funnel analytics and conversion optimization
-   Data-driven business insights and visualization

The analysis provides practical recommendations for improving e-commerce performance, focusing on user experience enhancements and targeted marketing strategies.
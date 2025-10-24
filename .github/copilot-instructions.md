# E-Commerce Funnel Analysis - AI Agent Instructions

## Project Architecture

This project analyzes e-commerce user behavior data from a multi-category online store, focusing on conversion funnel optimization. The architecture follows a hybrid SQL + Python approach:

- **Data Storage**: SQL Server database (`Funnel_Purchases`) with monthly tables named by date (e.g., `2019-Oct`, `2019-Nov`)
- **Data Flow**: CSV imports → SQL Server → Python analysis → CSV exports + visualizations
- **Analysis Pattern**: SQL for basic aggregations, Python/pandas for advanced analytics and plotting

## Key Components

- `Data Set/`: Raw CSV files (monthly e-commerce event data)
- `SQL Queries/EDA.sql`: T-SQL queries for initial data exploration
- `Python NoteBooks/EDA.ipynb`: Jupyter notebook for Python-based analysis
- `EDA Results (SQL + Python)/`: CSV outputs from analysis queries

## Database Connection Pattern

Always use pyodbc with this connection string for local SQL Server:
```python
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost;'
    'DATABASE=Funnel_Purchases;'
    'Trusted_Connection=yes;'
)
```

## Data Schema

Core table structure (from CSV imports):
- `event_time`: DATETIME (timestamp of user action)
- `event_type`: NVARCHAR (view/cart/remove_from_cart/purchase)
- `product_id`, `category_code`, `brand`: NVARCHAR
- `price`: DECIMAL
- `user_id`, `user_session`: BIGINT/NVARCHAR

## Analysis Workflow

1. **Data Import**: Use SSMS Import Wizard to load CSV files into SQL Server tables
2. **Validation**: Check row counts, nulls, data types using T-SQL queries
3. **EDA**: 
   - SQL: Event distribution, time ranges, top categories
   - Python: Trend analysis, user segmentation, visualizations
4. **Funnel Mapping**: Use CTEs and window functions to track user journeys
5. **Metrics**: Calculate conversion rates, drop-offs, revenue by segments

## Coding Patterns

- **SQL Queries**: Use `dbo.[TableName]` syntax for table references
- **Python**: Import data with `pd.read_sql(query, conn)`, export results to CSV
- **Table Naming**: Monthly tables like `2019-Oct` - reference with square brackets: `[2019-Oct]`
- **Results Export**: Save analysis outputs as CSV files in `EDA Results (SQL + Python)/`

## Common Queries

Event distribution:
```sql
SELECT event_type, COUNT(*) FROM dbo.[2019-Oct] GROUP BY event_type
```

Time range check:
```sql
SELECT MIN(event_time), MAX(event_time) FROM dbo.[2019-Oct]
```

Top categories:
```sql
SELECT TOP 10 category_code, COUNT(*) FROM dbo.[2019-Oct] 
GROUP BY category_code ORDER BY COUNT(*) DESC
```

## Visualization Stack

- **Primary**: Python (matplotlib, seaborn, plotly) in Jupyter notebooks
- **Alternative**: Tableau, Power BI for dashboards
- **Export Pattern**: Generate CSV results first, then create visualizations

## Development Setup

1. Install SQL Server and SSMS
2. Create `Funnel_Purchases` database
3. Import CSV files using SSMS Import Wizard
4. Set up Python environment with pandas, pyodbc, matplotlib, seaborn
5. Use Jupyter notebooks for interactive analysis

## File Organization Convention

- Raw data: `Data Set/` (monthly CSV files)
- SQL analysis: `SQL Queries/` (T-SQL scripts)
- Python analysis: `Python NoteBooks/` (Jupyter notebooks)
- Results: `EDA Results (SQL + Python)/` (CSV outputs)
- Documentation: `Idea.md` (project overview and methodology)</content>
<parameter name="filePath">e:\E-commerce Funnel Analysis\.github\copilot-instructions.md
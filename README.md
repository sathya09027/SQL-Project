# 🌍 Global Layoffs Data Analysis (SQL EDA Project)

 Project Type: SQL Data Analysis Portfolio Project

## Objective

The objective of this project is to perform Exploratory Data Analysis (EDA) on global layoff data to identify trends, patterns, and key insights across companies, industries, countries, and time periods.

## Why This Project Matters

This project simulates a real-world business intelligence scenario where economic layoff data is analyzed to uncover trends and strategic insights.

- Demonstrates the ability to analyze large-scale workforce reduction data using SQL.
- Identifies macroeconomic layoff patterns across industries, countries, and time.
- Applies advanced SQL concepts such as CTEs and window functions for ranking and rolling totals.
- Transforms raw operational data into actionable business insights.
- Mimics the workflow of a Business Intelligence Analyst performing time-series and trend analysis.

## Dataset

- Dataset: Global Layoffs Dataset
- Contains information about:

   - Company name
   - Industry
   - Country & location
   - Date of layoffs
   - Total employees laid off
   - Percentage laid off
   - Funds raised
   - Company stage

The cleaned dataset was stored in:

`world_layoffs.layoffs_staging2`

## Data Cleaning

Before performing exploratory analysis, the dataset was cleaned and standardized to ensure accuracy and consistency.

The following data cleaning steps were performed:

- Removed duplicate records.
- Standardized date format for time-series analysis.
- Converted blank values to NULL.
- Trimmed whitespace from company names.
- Handled missing industry and country values.
- Ensured numeric fields (total_laid_off, percentage_laid_off) were properly formatted.

## Key Business Questions

- Which companies were most impacted?
- Which industries experienced the highest layoffs?
- Yearly layoff trends
- Monthly rolling totals of layoffs

## Exploratory Data Analysis (EDA)

Exploratory Data Analysis was performed to uncover patterns, trends, and anomalies in global layoff data.

The analysis included:

- Examining overall dataset structure and summary statistics.
- Identifying maximum and minimum layoff events.
- Detecting companies that laid off 100% of their workforce.
- Analyzing total layoffs by company, industry, country, and stage.
- Evaluating yearly and monthly layoff trends.
- Ranking top companies per year using window functions.
- Calculating rolling monthly totals to observe cumulative layoff growth over time.

This analysis helped reveal macroeconomic patterns and industry-level workforce reductions across different time periods.

## Sample SQL Queries

-- Remove duplicate records

DELETE t1
FROM world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
ON t1.company = t2.company
AND t1.location = t2.location
AND t1.date = t2.date
AND t1.total_laid_off = t2.total_laid_off
AND t1.id > t2.id;

-- Trim whitespace from company names

UPDATE world_layoffs.layoffs_staging2
SET company = TRIM(company);

-- Convert blank industry values to NULL

UPDATE world_layoffs.layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Standardize date format

UPDATE world_layoffs.layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

-- Remove rows where both total_laid_off and percentage_laid_off are NULL

DELETE FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

## 📈 Key Insights

- Several startups laid off 100% of their workforce, indicating business shutdowns.
- A few companies raised billions in funding but still experienced major layoffs.
- Layoffs peaked significantly during certain years, showing economic downturn impact.
- The technology industry recorded one of the highest total layoffs.
- Rolling monthly totals reveal consistent growth in layoffs during recession periods.

## Tools Used

- SQL (MySQL)
- Window Functions
- Common Table Expressions (CTEs)
- Aggregate Functions (SUM, MAX, MIN)
- Group By & Ranking Functions

## Concepts Demonstrated

- Exploratory Data Analysis (EDA)
- Aggregate Analysis using SUM(), MAX(), and MIN()
- Multi-dimensional Grouping (Company, Industry, Country, Stage)
- Time-Series Analysis using YEAR() and monthly aggregation
- Outlier Detection (100% workforce layoffs)
- Window Functions (DENSE_RANK, Rolling Totals)
- CTE-Based Query Structuring
- Ranking Analysis by Year
- Cumulative Trend Analysis using SUM() OVER()
- Business Insight Generation from Raw Operational Data

## Conclusion

This project demonstrates the ability to transform raw layoff data into actionable business insights using advanced SQL techniques such as window functions, ranking, and time-series analysis.

## Skills Demonstrated

SQL | MySQL | EDA | Window Functions | CTE | Data Cleaning | Business Intelligence

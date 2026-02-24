# 🌍 Global Layoffs Data Analysis (SQL EDA Project)

📂 Project Type: SQL Data Analysis Portfolio Project

## 📌 Objective

The objective of this project is to perform Exploratory Data Analysis (EDA) on global layoff data to identify trends, patterns, and key insights across companies, industries, countries, and time periods.

## 🔍 Key Business Questions

- Which companies were most impacted
- Which industries experienced the highest layoffs
- Yearly layoff trends
- Monthly rolling totals of layoffs

## 🛠 Tools Used

- SQL (MySQL)
- Window Functions
- Common Table Expressions (CTEs)
- Aggregate Functions (SUM, MAX, MIN)
- Group By & Ranking Functions

## 📊 Dataset

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

## 🔎 Steps Performed

### 1️⃣ Data Exploration

  - Checked complete dataset using SELECT *
  - Identified maximum layoffs in a single event
  - Analyzed percentage of layoffs to detect companies that laid off 100% workforce

### 2️⃣ Company-Level Analysis

  - Top 5 largest single-day layoffs
  - Companies with highest total layoffs
  - Ranking top 3 companies per year using:
    - CTE
    - DENSE_RANK() window function

### 3️⃣ Location & Industry Analysis

Total layoffs by:

  - Country
  - Location
  - Industry
  - Company stage

### 4️⃣ Time-Based Trend Analysis

- Year-wise total layoffs

- Monthly layoffs trend

- Rolling cumulative layoffs using:

  - Window functions
  - Running total calculation

## 📈 Key Insights

- Several startups laid off 100% of their workforce, indicating business shutdowns.
- A few companies raised billions in funding but still experienced major layoffs.
- Layoffs peaked significantly during certain years, showing economic downturn impact.
- The technology industry recorded one of the highest total layoffs.
- Rolling monthly totals reveal consistent growth in layoffs during recession periods.

## 🧠 Concepts Demonstrated

- Aggregate Analysis
- Grouping & Sorting
- Window Functions
- CTE (Common Table Expressions)
- Business Trend Analysis
- Time-Series Analysis

## 📌 Conclusion

This project demonstrates strong SQL skills in performing real-world business data analysis.
It highlights the ability to extract insights, identify trends, and apply advanced SQL concepts such as window functions and ranking for analytical reporting.

## 🛠 Skills Demonstrated

SQL | MySQL | EDA | Window Functions | CTE | Data Cleaning | Business Intelligence

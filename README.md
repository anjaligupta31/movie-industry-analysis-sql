# Movie Industry Data Analysis | MySQL

## Project Overview

This project focuses on analyzing movie industry data using MySQL to explore financial performance, profitability, genre-level trends, and movie characteristics.

The project demonstrates the application of SQL for data cleaning, transformation, exploratory data analysis, and business-oriented querying. It involves preparing a clean dataset, calculating key financial metrics such as profit and return on investment (ROI), and identifying high-performing movies using advanced SQL techniques.

The analysis uses aggregations, conditional logic, subqueries, Common Table Expressions (CTEs), and window functions to extract meaningful insights from movie-level data.

## Project Objectives

- Clean and standardize movie data for reliable analysis.
- Calculate movie profitability using budget and revenue.
- Evaluate return on investment (ROI) across movies.
- Categorize movies by budget and profitability status.
- Identify the highest-revenue and most-profitable movies.
- Compare movie budgets and profitability across genres.
- Rank movies based on revenue and release date.
- Identify the highest-revenue movie within each genre.

## Key Analysis Areas

- Data cleaning and handling missing values
- Budget and revenue analysis
- Profit and ROI calculations
- Profitability classification
- Budget segmentation
- Genre-level revenue and average profit
- Top 10 most-profitable movies
- Revenue ranking using window functions
- Highest-revenue movie within each genre

## Tools & Technologies

- MySQL
- SQL Data Cleaning
- Exploratory Data Analysis (EDA)
- Aggregate Functions
- CASE Statements
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions: RANK(), DENSE_RANK(), ROW_NUMBER()

## Business Value

This project demonstrates how SQL can be used to transform raw movie data into structured financial and performance analysis. The resulting queries support comparisons of movie profitability, budget allocation, revenue generation, and genre-level performance.

## Technical Implementation

### Data Cleaning & Preparation
- Created a separate working table for data cleaning.
- Checked for duplicate movie titles and missing values.
- Standardized movie titles and genre fields using TRIM() and string functions.
- Cleaned budget and revenue fields by removing currency symbols and thousands separators.
- Converted budget and revenue columns into numeric data types.
- Extracted release year from release date.

### Financial Analysis
- Calculated profit using revenue minus budget.
- Calculated ROI as a percentage of budget.
- Classified movies by profitability status using CASE statements.
- Segmented movies into budget categories.

### Advanced SQL
- Used aggregate functions to analyze revenue and average profit by genre.
- Applied subqueries to identify above-average revenue and maximum-profit movies.
- Used CTEs to structure complex analytical queries.
- Applied RANK() and DENSE_RANK() to rank movies by revenue.
- Used ROW_NUMBER() to sequence movies and identify the highest-revenue movie within each genre.

## Key SQL Concepts

SELECT, WHERE, GROUP BY, HAVING, UPDATE, ALTER TABLE, CASE WHEN, Aggregate Functions, String Functions, Subqueries, CTEs, Window Functions, RANK(), DENSE_RANK(), ROW_NUMBER(), PARTITION BY, and ORDER BY.

# End-to-End-Sales-Data-Warehouse
An end-to-end Business Intelligence solution featuring a custom-built SQL Server data warehouse (star schema) and an interactive Power BI dashboard for retail sales analytics.

# Route Sales Analytics & Business Intelligence Dashboard

## 📌 Project Overview
This project showcases an end-to-end Business Intelligence solution, starting from robust database management and architecture to interactive data visualization. Built as a graduation project, it analyzes retail sales performance across multiple years (2017-2018) to uncover trends in product performance, customer behavior, and store efficiency. 

The project demonstrates professional-grade database design using a star schema, ensuring data integrity and optimized query performance, seamlessly integrated with a Power BI dashboard for actionable business insights.

## 🛠️ Tech Stack
* **Database Management System:** Microsoft SQL Server (SSMS)
* **Data Visualization:** Microsoft Power BI
* **Languages:** SQL (DDL, DML, Data Modeling)

## 🗄️ Data Architecture
The data warehouse is built using a dimensional modeling approach (Star Schema) to optimize analytical querying. 
* **Fact Tables:** `Fact_Sales_2017`, `Fact_Sales_2018` (capturing transactional sales data)
* **Dimension Tables:** * `Dim_Calendar` (Time intelligence)
    * `Dim_Customers` (Customer demographics)
    * `Dim_Products` (Product hierarchy and details)
    * `Dim_Stores` (Location and store attributes)

## 📊 Dashboard Highlights
*(Add a brief sentence here about what your dashboard shows, e.g., "The Power BI dashboard provides a high-level executive summary of revenue, year-over-year growth, and regional performance.")*

Here are a few views of the dashboard and data model:

### Overview & Visualizations
![Dashboard View 1](Screenshot%202026-04-28%20020646.png)
![Dashboard View 2](Screenshot%202026-04-28%20020752.png)
![Dashboard View 3](Screenshot%202026-04-28%20020817.png)

### Detailed Analysis
![Dashboard View 4](Screenshot%202026-04-28%20020842.png)
![Dashboard View 5](Screenshot%202026-04-28%20020905.png)
![Dashboard View 6](Screenshot%202026-04-28%20020926.png)

## 🚀 Getting Started

To run this project locally on your machine:

### 1. Database Setup
1. Clone this repository to your local machine.
2. Open SQL Server Management Studio (SSMS).
3. Open the `SQLQuery1script.sql` file.
4. Execute the script. This will automatically:
   * Create the `Graduation Project_Route` database.
   * Build the complete Star Schema (Fact and Dimension tables).
   * Establish all primary and foreign key constraints for data integrity.

### 2. Launching the Dashboard
1. Ensure you have [Power BI Desktop](https://powerbi.microsoft.com/desktop/) installed.
2. Open the `Grad_BI (5).pbix` file.
3. If prompted, update the data source settings to point to your local SQL Server instance where you just built the database.
4. Refresh the data to populate the visuals.

## 🤝 Connect
Feel free to reach out if you have any questions about the database architecture, the SQL queries used, or the Power BI visualizations.

USE [master]
GO
/****** Object:  Database [Graduation Project_Route]    Script Date: 2/27/2026 8:17:16 PM ******/
CREATE DATABASE [Graduation Project_Route]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Graduation Project_Route', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Graduation Project_Route.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Graduation Project_Route_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Graduation Project_Route_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Graduation Project_Route] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Graduation Project_Route].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Graduation Project_Route] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET ARITHABORT OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Graduation Project_Route] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Graduation Project_Route] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Graduation Project_Route] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Graduation Project_Route] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Graduation Project_Route] SET  MULTI_USER 
GO
ALTER DATABASE [Graduation Project_Route] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Graduation Project_Route] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Graduation Project_Route] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Graduation Project_Route] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Graduation Project_Route] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Graduation Project_Route] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Graduation Project_Route] SET QUERY_STORE = ON
GO
ALTER DATABASE [Graduation Project_Route] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Graduation Project_Route]
GO
/****** Object:  Table [dbo].[Dim_Customers]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customers](
	[customer_id] [smallint] NOT NULL,
	[customer_acct_num] [bigint] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[customer_address] [nvarchar](50) NOT NULL,
	[customer_city] [nvarchar](50) NOT NULL,
	[customer_state_province] [nvarchar](50) NOT NULL,
	[customer_postal_code] [int] NOT NULL,
	[customer_country] [nvarchar](50) NOT NULL,
	[birthdate] [date] NOT NULL,
	[marital_status] [nvarchar](50) NOT NULL,
	[yearly_income] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[total_children] [tinyint] NOT NULL,
	[num_children_at_home] [tinyint] NOT NULL,
	[education] [nvarchar](50) NOT NULL,
	[acct_open_date] [date] NOT NULL,
	[member_card] [nvarchar](50) NOT NULL,
	[occupation] [nvarchar](50) NOT NULL,
	[homeowner] [bit] NOT NULL,
	[Customer Name]  AS (([first_name]+' ')+[last_name]),
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Products]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Products](
	[product_id] [smallint] NOT NULL,
	[product_brand] [nvarchar](50) NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[product_sku] [bigint] NOT NULL,
	[product_retail_price] [float] NOT NULL,
	[product_cost] [float] NOT NULL,
	[product_weight] [float] NOT NULL,
	[recyclable] [tinyint] NULL,
	[low_fat] [tinyint] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Sales_2017]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Sales_2017](
	[transaction_date] [date] NOT NULL,
	[stock_date] [date] NOT NULL,
	[product_id] [smallint] NOT NULL,
	[customer_id] [smallint] NOT NULL,
	[store_id] [tinyint] NOT NULL,
	[quantity] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Sales_2018]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Sales_2018](
	[transaction_date] [date] NOT NULL,
	[stock_date] [date] NOT NULL,
	[product_id] [smallint] NOT NULL,
	[customer_id] [smallint] NOT NULL,
	[store_id] [tinyint] NOT NULL,
	[quantity] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[All_Sales]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[All_Sales] AS
SELECT * FROM dbo.Fact_Sales_2017
UNION ALL
SELECT * FROM dbo.Fact_Sales_2018;
GO
/****** Object:  View [dbo].[vw_Top10_Customers_By_Transactions]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Top10_Customers_By_Transactions] AS
SELECT TOP 10
    c.customer_id,
    c.[Customer Name],
    COUNT(*) AS total_transactions,
    SUM(s.quantity) AS total_units_purchased,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue
FROM dbo.All_Sales s
JOIN dbo.Dim_Customers c ON s.customer_id = c.customer_id
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.[Customer Name]
ORDER BY COUNT(*) DESC;
GO
/****** Object:  View [dbo].[vw_Total_Num_of_Customers]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Total_Num_of_Customers] AS
SELECT 
    COUNT(DISTINCT c.customer_id) AS total_customers
FROM dbo.Dim_Customers c;
GO
/****** Object:  View [dbo].[vw_Top_Customers_Units]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Top_Customers_Units] AS
SELECT TOP 10
    c.customer_id,
    c.[Customer Name],
    SUM(s.quantity) AS total_units_purchased,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit
FROM dbo.All_Sales s
JOIN dbo.Dim_Customers c ON s.customer_id = c.customer_id
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.[Customer Name]
ORDER BY SUM(s.quantity) DESC;
GO
/****** Object:  View [dbo].[vw_Top_5_Products_Overall]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Top_5_Products_Overall] AS
SELECT TOP 5
    p.product_id,
    p.product_name,
    p.product_brand,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit,
    SUM(s.quantity) AS total_units_sold
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.product_brand
ORDER BY SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) DESC;
GO
/****** Object:  View [dbo].[vw_Quarterly_Revenue]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Quarterly_Revenue] AS
SELECT
    DATEPART(YEAR, s.transaction_date) AS Sales_Year,
    DATEPART(QUARTER, s.transaction_date) AS Sales_Quarter,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * p.product_cost) AS total_cost,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY DATEPART(YEAR, s.transaction_date), DATEPART(QUARTER, s.transaction_date);
GO
/****** Object:  View [dbo].[vw_Top_Brands_Revenue]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Top_Brands_Revenue] AS
SELECT TOP 10
    p.product_brand,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit,
    SUM(s.quantity) AS total_units_sold
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY p.product_brand
ORDER BY SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) DESC;
GO
/****** Object:  Table [dbo].[Dim_Stores]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Stores](
	[store_id] [tinyint] NOT NULL,
	[region_id] [tinyint] NOT NULL,
	[store_type] [nvarchar](50) NOT NULL,
	[store_name] [nvarchar](50) NOT NULL,
	[store_street_address] [nvarchar](50) NOT NULL,
	[store_city] [nvarchar](50) NOT NULL,
	[store_state] [nvarchar](50) NOT NULL,
	[store_country] [nvarchar](50) NOT NULL,
	[store_phone] [nvarchar](50) NOT NULL,
	[first_opened_date] [date] NOT NULL,
	[last_remodel_date] [date] NOT NULL,
	[total_sqft] [int] NOT NULL,
	[grocery_sqft] [smallint] NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Returns]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Returns](
	[return_date] [date] NOT NULL,
	[product_id] [smallint] NOT NULL,
	[store_id] [tinyint] NOT NULL,
	[quantity] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Total_Returns_By_Store]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Total_Returns_By_Store] AS
SELECT 
    st.store_id,
    st.store_name,
    COUNT(*) AS total_returns,              -- عدد عمليات المرتجعات
    SUM(r.quantity) AS total_units_returned -- إجمالي الوحدات المرتجعة
FROM dbo.Dim_Returns r
JOIN dbo.Dim_Stores st ON r.store_id = st.store_id
GROUP BY st.store_id, st.store_name;
GO
/****** Object:  View [dbo].[vw_Annual_Performance_Metrics]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Annual_Performance_Metrics] AS
SELECT
    YEAR(s.transaction_date) AS Sales_Year,
    COUNT(*) AS total_transactions,
    SUM(s.quantity) AS total_units_sold,
    SUM(CAST(s.quantity AS FLOAT) * p.product_cost) AS total_cost,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY YEAR(s.transaction_date);
GO
/****** Object:  Table [dbo].[Dim_Region]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Region](
	[region_id] [tinyint] NOT NULL,
	[sales_district] [nvarchar](50) NOT NULL,
	[sales_region] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Regional_Performance_Insights]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Regional_Performance_Insights] AS
SELECT
    r.sales_region,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * p.product_cost) AS total_cost,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
JOIN dbo.Dim_Stores st ON s.store_id = st.store_id
JOIN dbo.Dim_Region r ON st.region_id = r.region_id
GROUP BY r.sales_region;
GO
/****** Object:  View [dbo].[vw_KPI_AOV]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_KPI_AOV] AS
SELECT
    AVG(order_value) AS avg_order_value
FROM (
    SELECT 
        s.transaction_date,
        SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS order_value
    FROM dbo.All_Sales s
    JOIN dbo.Dim_Products p ON s.product_id = p.product_id
    GROUP BY s.transaction_date, s.customer_id
) AS sub;
GO
/****** Object:  View [dbo].[vw_Return_Metrics]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Return_Metrics] AS
SELECT
    YEAR(r.return_date) AS Return_Year,
    COUNT(*) AS total_returns,
    SUM(r.quantity) AS total_units_returned,
    SUM(CAST(r.quantity AS FLOAT) * p.product_retail_price) AS total_return_value,
    SUM(CAST(r.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS lost_profit
FROM dbo.Dim_Returns r
JOIN dbo.Dim_Products p ON r.product_id = p.product_id
GROUP BY YEAR(r.return_date);
GO
/****** Object:  View [dbo].[vw_Brand_Performance]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Brand_Performance] AS
SELECT
    p.product_brand,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * p.product_cost) AS total_cost,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY p.product_brand;
GO
/****** Object:  View [dbo].[vw_Store_Efficiency]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Store_Efficiency] AS
SELECT
    st.store_id,
    st.store_name,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit,
    COUNT(*) AS total_transactions,
    SUM(s.quantity) AS total_units_sold,
    (SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) / COUNT(*)) AS revenue_per_transaction,
    (SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) / SUM(s.quantity)) AS revenue_per_unit
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
JOIN dbo.Dim_Stores st ON s.store_id = st.store_id
GROUP BY st.store_id, st.store_name;
GO
/****** Object:  View [dbo].[vw_Store_Ranking_Status]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Store_Ranking_Status] AS
SELECT
    st.store_id,
    st.store_name,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit,
    RANK() OVER (ORDER BY SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) DESC) AS profit_rank,
    RANK() OVER (ORDER BY SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) DESC) AS revenue_rank
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
JOIN dbo.Dim_Stores st ON s.store_id = st.store_id
GROUP BY st.store_id, st.store_name;
GO
/****** Object:  View [dbo].[vw_Top10_Customers By Transactions]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Top 10 Customers by Number of Transactions
CREATE   VIEW [dbo].[vw_Top10_Customers By Transactions] AS
SELECT TOP 10
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS [Customer Name],
    COUNT(*) AS Total_Transactions
FROM [All_Sales] s
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY Total_Transactions DESC;
GO
/****** Object:  View [dbo].[vw_Average_Pricing_Analysis]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Average_Pricing_Analysis] AS
SELECT
    p.product_brand,
    AVG(p.product_retail_price) AS avg_retail_price,
    AVG(p.product_cost) AS avg_cost,
    AVG(p.product_retail_price - p.product_cost) AS avg_margin
FROM dbo.Dim_Products p
GROUP BY p.product_brand;
GO
/****** Object:  View [dbo].[vw_Market_Basket_Analysis]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Market_Basket_Analysis] AS
SELECT
    s.transaction_date,
    s.customer_id,
    p.product_id,
    p.product_name,
    p.product_brand
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id;
GO
/****** Object:  View [dbo].[vw_Store_Profitability_Insights]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Store_Profitability_Insights] AS
SELECT
    st.store_id,
    st.store_name,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * p.product_cost) AS total_cost,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
JOIN dbo.Dim_Stores st ON s.store_id = st.store_id
GROUP BY st.store_id, st.store_name;
GO
/****** Object:  View [dbo].[vw_Product_Contribution_Insights]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Product_Contribution_Insights] AS
SELECT
    p.product_id,
    p.product_name,
    p.product_brand,
    SUM(CAST(s.quantity AS FLOAT) * p.product_retail_price) AS total_revenue,
    SUM(CAST(s.quantity AS FLOAT) * p.product_cost) AS total_cost,
    SUM(CAST(s.quantity AS FLOAT) * (p.product_retail_price - p.product_cost)) AS total_profit
FROM dbo.All_Sales s
JOIN dbo.Dim_Products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.product_brand;
GO
/****** Object:  View [dbo].[vw_Total Num of Customers]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Total Number of Customers
CREATE   VIEW [dbo].[vw_Total Num of Customers] AS
SELECT COUNT(*) AS Total_Customers
FROM Customers;
GO
/****** Object:  Table [dbo].[Dim_Calendar]    Script Date: 2/27/2026 8:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Calendar](
	[Month] [tinyint] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Full Date]  AS (datefromparts([Year],[Month],[Day]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Sales_2017]  WITH CHECK ADD  CONSTRAINT [FK_Sales2017_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Dim_Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Fact_Sales_2017] CHECK CONSTRAINT [FK_Sales2017_Customer]
GO
ALTER TABLE [dbo].[Fact_Sales_2017]  WITH CHECK ADD  CONSTRAINT [FK_Sales2017_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Dim_Products] ([product_id])
GO
ALTER TABLE [dbo].[Fact_Sales_2017] CHECK CONSTRAINT [FK_Sales2017_Product]
GO
ALTER TABLE [dbo].[Fact_Sales_2017]  WITH CHECK ADD  CONSTRAINT [FK_Sales2017_Store] FOREIGN KEY([store_id])
REFERENCES [dbo].[Dim_Stores] ([store_id])
GO
ALTER TABLE [dbo].[Fact_Sales_2017] CHECK CONSTRAINT [FK_Sales2017_Store]
GO
ALTER TABLE [dbo].[Fact_Sales_2018]  WITH CHECK ADD  CONSTRAINT [FK_Sales2018_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Dim_Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Fact_Sales_2018] CHECK CONSTRAINT [FK_Sales2018_Customer]
GO
ALTER TABLE [dbo].[Fact_Sales_2018]  WITH CHECK ADD  CONSTRAINT [FK_Sales2018_Store] FOREIGN KEY([store_id])
REFERENCES [dbo].[Dim_Stores] ([store_id])
GO
ALTER TABLE [dbo].[Fact_Sales_2018] CHECK CONSTRAINT [FK_Sales2018_Store]
GO
USE [master]
GO
ALTER DATABASE [Graduation Project_Route] SET  READ_WRITE 
GO

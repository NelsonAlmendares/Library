USE [master]
GO
/****** Object:  Database [Library]    Script Date: 9/11/2023 14:17:01 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
ALTER DATABASE [Library] SET QUERY_STORE = ON
GO
ALTER DATABASE [Library] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Library]
GO
/****** Object:  Schema [library]    Script Date: 9/11/2023 14:17:01 ******/
CREATE SCHEMA [library]
GO
/****** Object:  Table [library].[client]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[client_firstName] [nvarchar](100) NOT NULL,
	[client_lastName] [nvarchar](100) NOT NULL,
	[password_client] [nvarchar](30) NOT NULL,
	[client_phone] [nvarchar](12) NOT NULL,
	[client_address] [nvarchar](200) NOT NULL,
	[client_mail] [nvarchar](150) NOT NULL,
	[client_photo] [varbinary](max) NULL,
	[id_statusClient] [int] NOT NULL,
	[client_document] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_client_id_client] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [library].[statusclient]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[statusclient](
	[id_StatusClient] [int] IDENTITY(1,1) NOT NULL,
	[status__client] [nvarchar](50) NULL,
 CONSTRAINT [PK_statusclient_id_StatusClient] PRIMARY KEY CLUSTERED 
(
	[id_StatusClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [library].[all_clients]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [library].[all_clients] (
   [ID], 
   [Name], 
   [Phone], 
   [Address], 
   [Mail], 
   [photo], 
   [DUI], 
   [Status])
AS 
   SELECT 
      cl.id_client AS ID, 
      cl.client_firstName + N' ' + cl.client_lastName AS Name, 
      cl.client_phone AS Phone, 
      cl.client_address AS Address, 
      cl.client_mail AS Mail, 
      cl.client_photo AS photo, 
      cl.client_document AS DUI, 
      sc.status__client AS Status
   FROM (library.client  AS cl 
      INNER JOIN library.statusclient  AS sc 
      ON (cl.id_statusClient = sc.id_StatusClient))
GO
/****** Object:  Table [library].[employee]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[employee](
	[id_employee] [int] IDENTITY(1,1) NOT NULL,
	[employee_firstName] [nvarchar](50) NOT NULL,
	[employee_lastName] [nvarchar](90) NOT NULL,
	[password_employee] [nvarchar](30) NOT NULL,
	[employee_address] [nvarchar](200) NOT NULL,
	[employee_phone] [nvarchar](12) NOT NULL,
	[employee_mail] [nvarchar](200) NOT NULL,
	[employee_photo] [varbinary](max) NULL,
	[id_TypeEmployee] [int] NOT NULL,
	[id_statusEmployee] [int] NOT NULL,
	[username_employee] [varchar](100) NOT NULL,
 CONSTRAINT [PK_employee_id_employee] PRIMARY KEY CLUSTERED 
(
	[id_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [library].[typeemployee]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[typeemployee](
	[id_TypeEmployee] [int] IDENTITY(1,1) NOT NULL,
	[type__employee] [nvarchar](50) NULL,
 CONSTRAINT [PK_typeemployee_id_TypeEmployee] PRIMARY KEY CLUSTERED 
(
	[id_TypeEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [library].[all_employees]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [library].[all_employees] (
   [ID], 
   [Name], 
   [Address], 
   [Phone], 
   [Mail], 
   [Picture], 
   [Assignment])
AS 
   SELECT 
      ep.id_employee AS ID, 
      ep.employee_firstName + N' ' + ep.employee_lastName AS Name, 
      ep.employee_address AS Address, 
      ep.employee_phone AS Phone, 
      ep.employee_mail AS Mail, 
      ep.employee_photo AS Picture, 
      tp.type__employee AS Assignment
   FROM (library.employee  AS ep 
      INNER JOIN library.typeemployee  AS tp 
      ON (ep.id_TypeEmployee = tp.id_TypeEmployee))
   WHERE ep.id_employee = 1
GO
/****** Object:  Table [library].[brands]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[brands](
	[id_brand] [int] IDENTITY(2,1) NOT NULL,
	[brand__name] [nvarchar](40) NULL,
 CONSTRAINT [PK_brands_id_brand] PRIMARY KEY CLUSTERED 
(
	[id_brand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[clasification]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[clasification](
	[id_clasification] [int] IDENTITY(1,1) NOT NULL,
	[clasification__product] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_clasification_id_clasification] PRIMARY KEY CLUSTERED 
(
	[id_clasification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[gender]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[gender](
	[id_gender] [int] IDENTITY(1,1) NOT NULL,
	[product__gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_gender_id_gender] PRIMARY KEY CLUSTERED 
(
	[id_gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[productespecification]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[productespecification](
	[id_especification] [int] IDENTITY(1,1) NOT NULL,
	[product__quantity] [int] NULL,
	[product__author] [nvarchar](100) NOT NULL,
	[product_format] [nvarchar](300) NOT NULL,
	[product_themes] [nvarchar](300) NOT NULL,
	[id_productGender] [int] NOT NULL,
	[id_clasification] [int] NOT NULL,
	[id_product] [int] NOT NULL,
 CONSTRAINT [PK_productespecification_id_especification] PRIMARY KEY CLUSTERED 
(
	[id_especification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[products]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[products](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[product_brand] [int] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[product_price] [numeric](5, 2) NOT NULL,
	[product_photo] [varbinary](max) NULL,
	[date_entry] [date] NULL,
	[product_description] [nvarchar](500) NULL,
	[id_productStatus] [int] NOT NULL,
	[id_productDistributor] [int] NOT NULL,
	[id_review] [int] NULL,
	[id_availability] [int] NOT NULL,
 CONSTRAINT [PK_products_id_product] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [library].[productstatus]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[productstatus](
	[id_productStatus] [int] IDENTITY(1,1) NOT NULL,
	[product__state] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_productstatus_id_productStatus] PRIMARY KEY CLUSTERED 
(
	[id_productStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [library].[allitems]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [library].[allitems] (
   [id], 
   [product_name], 
   [brand__name], 
   [product_price], 
   [product_photo], 
   [date_entry], 
   [product_description], 
   [product__author], 
   [product__state], 
   [product_format], 
   [product__gender], 
   [clasification__product])
AS 
   SELECT 
      p.id_product AS id, 
      p.product_name AS product_name, 
      br.brand__name AS brand__name, 
      N'$' + CAST(p.product_price AS varchar(50)) AS product_price, 
      p.product_photo AS product_photo, 
      p.date_entry AS date_entry, 
      p.product_description AS product_description, 
      pde.product__author AS product__author, 
      ps.product__state AS product__state, 
      pde.product_format AS product_format, 
      ge.product__gender AS product__gender, 
      cl.clasification__product AS clasification__product
   FROM (((((library.products  AS p 
      INNER JOIN library.productstatus  AS ps 
      ON (p.id_productStatus = ps.id_productStatus)) 
      INNER JOIN library.brands  AS br 
      ON (p.product_brand = br.id_brand)) 
      INNER JOIN library.productespecification  AS pde 
      ON (p.id_product = pde.id_product)) 
      INNER JOIN library.gender  AS ge 
      ON (pde.id_productGender = ge.id_gender)) 
      INNER JOIN library.clasification  AS cl 
      ON (pde.id_clasification = cl.id_clasification))
GO
/****** Object:  Table [library].[availability]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[availability](
	[id_availability] [int] IDENTITY(1,1) NOT NULL,
	[book_availability] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_availability_id_availability] PRIMARY KEY CLUSTERED 
(
	[id_availability] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[bills]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[bills](
	[id_bill] [int] IDENTITY(1,1) NOT NULL,
	[sale__correlative] [int] NULL,
	[quantity] [int] NOT NULL,
	[id_sales] [int] NOT NULL,
	[id_client] [int] NOT NULL,
	[date_issue] [date] NULL,
	[comments] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_bills_id_bill] PRIMARY KEY CLUSTERED 
(
	[id_bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[distributor]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[distributor](
	[id_distributor] [int] IDENTITY(1,1) NOT NULL,
	[name_distributor] [nvarchar](120) NOT NULL,
	[comments] [nvarchar](400) NULL,
	[register_date] [date] NULL,
 CONSTRAINT [PK_distributor_id_distributor] PRIMARY KEY CLUSTERED 
(
	[id_distributor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[payment]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[payment](
	[id_payment] [int] IDENTITY(1,1) NOT NULL,
	[type__payment] [nvarchar](40) NULL,
 CONSTRAINT [PK_payment_id_payment] PRIMARY KEY CLUSTERED 
(
	[id_payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[reviews]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[reviews](
	[id_review] [int] IDENTITY(1,1) NOT NULL,
	[name_client] [nvarchar](200) NOT NULL,
	[product_review] [nvarchar](max) NOT NULL,
	[review_date] [date] NULL,
 CONSTRAINT [PK_reviews_id_review] PRIMARY KEY CLUSTERED 
(
	[id_review] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [library].[sales]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[sales](
	[id_sales] [int] IDENTITY(1,1) NOT NULL,
	[date_issue] [date] NOT NULL,
	[sale_address] [nvarchar](200) NOT NULL,
	[sale_total_due] [numeric](5, 2) NULL,
	[type_of_payment] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[id_salePurchaser] [int] NOT NULL,
	[id_employee] [int] NOT NULL,
	[id_statusEmployee] [int] NOT NULL,
 CONSTRAINT [PK_sales_id_sales] PRIMARY KEY CLUSTERED 
(
	[id_sales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[salesreturn]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[salesreturn](
	[id_saleReturned] [int] IDENTITY(1,1) NOT NULL,
	[date_returned] [date] NULL,
	[return__comment] [nvarchar](200) NOT NULL,
	[id_sale] [int] NOT NULL,
 CONSTRAINT [PK_salesreturn_id_saleReturned] PRIMARY KEY CLUSTERED 
(
	[id_saleReturned] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[statusemployee]    Script Date: 9/11/2023 14:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[statusemployee](
	[id_statusEmployee] [int] IDENTITY(1,1) NOT NULL,
	[status_employee] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_statusemployee_id_statusEmployee] PRIMARY KEY CLUSTERED 
(
	[id_statusEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [FK_bill]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_bill] ON [library].[bills]
(
	[id_sales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_billClient]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_billClient] ON [library].[bills]
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_statusClients]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_statusClients] ON [library].[client]
(
	[id_statusClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_statusEmployee]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_statusEmployee] ON [library].[employee]
(
	[id_statusEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_typeEmployee]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_typeEmployee] ON [library].[employee]
(
	[id_TypeEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_clasification]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_clasification] ON [library].[productespecification]
(
	[id_clasification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_gender]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_gender] ON [library].[productespecification]
(
	[id_productGender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_product]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_product] ON [library].[productespecification]
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_availability]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_availability] ON [library].[products]
(
	[id_availability] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_productBrand]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_productBrand] ON [library].[products]
(
	[product_brand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_productDistributor]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_productDistributor] ON [library].[products]
(
	[id_productDistributor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_productStatus]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_productStatus] ON [library].[products]
(
	[id_productStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_employees]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_employees] ON [library].[sales]
(
	[id_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_payment]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_payment] ON [library].[sales]
(
	[type_of_payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_products]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_products] ON [library].[sales]
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_purchaser]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_purchaser] ON [library].[sales]
(
	[id_salePurchaser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_salesReturn]    Script Date: 9/11/2023 14:17:02 ******/
CREATE NONCLUSTERED INDEX [FK_salesReturn] ON [library].[salesreturn]
(
	[id_sale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [library].[bills] ADD  DEFAULT (NULL) FOR [sale__correlative]
GO
ALTER TABLE [library].[bills] ADD  DEFAULT (NULL) FOR [date_issue]
GO
ALTER TABLE [library].[brands] ADD  DEFAULT (NULL) FOR [brand__name]
GO
ALTER TABLE [library].[client] ADD  DEFAULT (NULL) FOR [client_photo]
GO
ALTER TABLE [library].[distributor] ADD  DEFAULT (N'Sin comentarios registrados') FOR [comments]
GO
ALTER TABLE [library].[distributor] ADD  DEFAULT (NULL) FOR [register_date]
GO
ALTER TABLE [library].[employee] ADD  DEFAULT (NULL) FOR [employee_photo]
GO
ALTER TABLE [library].[payment] ADD  DEFAULT (NULL) FOR [type__payment]
GO
ALTER TABLE [library].[productespecification] ADD  DEFAULT ((0)) FOR [product__quantity]
GO
ALTER TABLE [library].[products] ADD  DEFAULT (NULL) FOR [product_photo]
GO
ALTER TABLE [library].[products] ADD  DEFAULT (NULL) FOR [date_entry]
GO
ALTER TABLE [library].[products] ADD  DEFAULT (N'Sin descripción') FOR [product_description]
GO
ALTER TABLE [library].[products] ADD  DEFAULT (NULL) FOR [id_review]
GO
ALTER TABLE [library].[reviews] ADD  DEFAULT (NULL) FOR [review_date]
GO
ALTER TABLE [library].[sales] ADD  DEFAULT (NULL) FOR [sale_total_due]
GO
ALTER TABLE [library].[salesreturn] ADD  DEFAULT (NULL) FOR [date_returned]
GO
ALTER TABLE [library].[statusclient] ADD  DEFAULT (NULL) FOR [status__client]
GO
ALTER TABLE [library].[typeemployee] ADD  DEFAULT (NULL) FOR [type__employee]
GO
ALTER TABLE [library].[bills]  WITH CHECK ADD  CONSTRAINT [bills$FK_bill] FOREIGN KEY([id_sales])
REFERENCES [library].[sales] ([id_sales])
GO
ALTER TABLE [library].[bills] CHECK CONSTRAINT [bills$FK_bill]
GO
ALTER TABLE [library].[bills]  WITH CHECK ADD  CONSTRAINT [bills$FK_billClient] FOREIGN KEY([id_client])
REFERENCES [library].[client] ([id_client])
GO
ALTER TABLE [library].[bills] CHECK CONSTRAINT [bills$FK_billClient]
GO
ALTER TABLE [library].[client]  WITH CHECK ADD  CONSTRAINT [client$FK_statusClients] FOREIGN KEY([id_statusClient])
REFERENCES [library].[statusclient] ([id_StatusClient])
GO
ALTER TABLE [library].[client] CHECK CONSTRAINT [client$FK_statusClients]
GO
ALTER TABLE [library].[employee]  WITH CHECK ADD  CONSTRAINT [employee$FK_statusEmployee] FOREIGN KEY([id_statusEmployee])
REFERENCES [library].[statusemployee] ([id_statusEmployee])
GO
ALTER TABLE [library].[employee] CHECK CONSTRAINT [employee$FK_statusEmployee]
GO
ALTER TABLE [library].[employee]  WITH CHECK ADD  CONSTRAINT [employee$FK_typeEmployee] FOREIGN KEY([id_TypeEmployee])
REFERENCES [library].[typeemployee] ([id_TypeEmployee])
GO
ALTER TABLE [library].[employee] CHECK CONSTRAINT [employee$FK_typeEmployee]
GO
ALTER TABLE [library].[productespecification]  WITH CHECK ADD  CONSTRAINT [productespecification$FK_clasification] FOREIGN KEY([id_clasification])
REFERENCES [library].[clasification] ([id_clasification])
GO
ALTER TABLE [library].[productespecification] CHECK CONSTRAINT [productespecification$FK_clasification]
GO
ALTER TABLE [library].[productespecification]  WITH CHECK ADD  CONSTRAINT [productespecification$FK_gender] FOREIGN KEY([id_productGender])
REFERENCES [library].[gender] ([id_gender])
GO
ALTER TABLE [library].[productespecification] CHECK CONSTRAINT [productespecification$FK_gender]
GO
ALTER TABLE [library].[productespecification]  WITH CHECK ADD  CONSTRAINT [productespecification$FK_product] FOREIGN KEY([id_product])
REFERENCES [library].[products] ([id_product])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [library].[productespecification] CHECK CONSTRAINT [productespecification$FK_product]
GO
ALTER TABLE [library].[products]  WITH CHECK ADD  CONSTRAINT [products$FK_availability] FOREIGN KEY([id_availability])
REFERENCES [library].[availability] ([id_availability])
GO
ALTER TABLE [library].[products] CHECK CONSTRAINT [products$FK_availability]
GO
ALTER TABLE [library].[products]  WITH CHECK ADD  CONSTRAINT [products$FK_productBrand] FOREIGN KEY([product_brand])
REFERENCES [library].[brands] ([id_brand])
GO
ALTER TABLE [library].[products] CHECK CONSTRAINT [products$FK_productBrand]
GO
ALTER TABLE [library].[products]  WITH CHECK ADD  CONSTRAINT [products$FK_productDistributor] FOREIGN KEY([id_productDistributor])
REFERENCES [library].[distributor] ([id_distributor])
GO
ALTER TABLE [library].[products] CHECK CONSTRAINT [products$FK_productDistributor]
GO
ALTER TABLE [library].[products]  WITH CHECK ADD  CONSTRAINT [products$FK_productStatus] FOREIGN KEY([id_productStatus])
REFERENCES [library].[productstatus] ([id_productStatus])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [library].[products] CHECK CONSTRAINT [products$FK_productStatus]
GO
ALTER TABLE [library].[sales]  WITH CHECK ADD  CONSTRAINT [sales$FK_employees] FOREIGN KEY([id_employee])
REFERENCES [library].[employee] ([id_employee])
GO
ALTER TABLE [library].[sales] CHECK CONSTRAINT [sales$FK_employees]
GO
ALTER TABLE [library].[sales]  WITH CHECK ADD  CONSTRAINT [sales$FK_payment] FOREIGN KEY([type_of_payment])
REFERENCES [library].[payment] ([id_payment])
GO
ALTER TABLE [library].[sales] CHECK CONSTRAINT [sales$FK_payment]
GO
ALTER TABLE [library].[sales]  WITH CHECK ADD  CONSTRAINT [sales$FK_products] FOREIGN KEY([id_product])
REFERENCES [library].[products] ([id_product])
GO
ALTER TABLE [library].[sales] CHECK CONSTRAINT [sales$FK_products]
GO
ALTER TABLE [library].[sales]  WITH CHECK ADD  CONSTRAINT [sales$FK_purchaser] FOREIGN KEY([id_salePurchaser])
REFERENCES [library].[client] ([id_client])
GO
ALTER TABLE [library].[sales] CHECK CONSTRAINT [sales$FK_purchaser]
GO
ALTER TABLE [library].[salesreturn]  WITH CHECK ADD  CONSTRAINT [salesreturn$FK_salesReturn] FOREIGN KEY([id_sale])
REFERENCES [library].[sales] ([id_sales])
GO
ALTER TABLE [library].[salesreturn] CHECK CONSTRAINT [salesreturn$FK_salesReturn]
GO
/****** Object:  StoredProcedure [library].[Add_Product]    Script Date: 9/11/2023 14:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [library].[Add_Product]  
   /* First insert params*/@productBrand int,
   @productName nvarchar(50),
   @product_price numeric(5, 2),
   @productPhoto varbinary(max),
   @product_description nvarchar(max),
   @productStatus int,
   @productDistributor int,
   @productReview int,
   /* Second Insert params*/@productQuantity int,
   @productAuthor nvarchar(100),
   @productFormat nvarchar(300),
   @productTheme nvarchar(300),
   @productGender int,
   @productClasification int
AS 
   BEGIN/* Evaluamos la variable y le asignamos un valor nullo   First Insert   GET LAST INSERTD ID*/

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      /* Variable to get last inserted ID*/
      DECLARE
         @last_id int = 0

      /* Variable para evaluar la insercción de la reseña, en caso de ser nula lo dejamos con un valor de 0 para luego actualizarla con el ID correspondiente*/
      DECLARE
         @review_id int

      /* 
      *   SSMA error messages:
      *   M2SS0136: Conversion from datatype NULL to datatype INT is not supported

      SET @review_id = 
         CASE 
            WHEN (@productReview = -1) THEN NULL
            ELSE @productReview
         END
      */



      WHILE @@TRANCOUNT > 0
      
         COMMIT 

      BEGIN TRANSACTION 

      /*
      *   SSMA informational messages:
      *   M2SS0214: The Default Values for the Columns have been added in the Insert Statement based on Project setttings.
      */

      INSERT library.products(
         product_brand, 
         product_name, 
         product_price, 
         product_photo, 
         date_entry, 
         product_description, 
         id_productStatus, 
         id_productDistributor, 
         id_review, 
         id_availability)
         VALUES (
            @productBrand, 
            @productName, 
            @product_price, 
            @productPhoto, 
            CAST(getdate() AS DATE), 
            @product_description, 
            @productStatus, 
            @productDistributor, 
            @review_id, 
            0)

      /*
      *   SSMA warning messages:
      *   M2SS0240: The behaviour of Standard Function SCOPE_IDENTITY may not be same as in MySQL
      */

      SET @last_id = scope_identity()

      IF @last_id > 0
         BEGIN

            INSERT library.productespecification(
               product__quantity, 
               product__author, 
               product_format, 
               product_themes, 
               id_productGender, 
               id_clasification, 
               id_product)
               VALUES (
                  @productQuantity, 
                  @productAuthor, 
                  @productFormat, 
                  @productTheme, 
                  @productGender, 
                  @productClasification, 
                  @last_id)

            WHILE @@TRANCOUNT > 0
            
               COMMIT 

         END
      ELSE 
         WHILE @@TRANCOUNT > 0
         
            ROLLBACK 

   END
GO
/****** Object:  StoredProcedure [library].[delete_Product]    Script Date: 9/11/2023 14:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [library].[delete_Product]  
   @id_to_delete int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      WHILE @@TRANCOUNT > 0
      
         COMMIT 

      BEGIN TRANSACTION 

      /* Tomamos la varible con la que recibimos de parámetro desde visual para eliminar la relación de las 2 tablas*/
      DELETE 
      FROM library.products
      WHERE products.id_product = @id_to_delete

      DELETE 
      FROM library.productespecification
      WHERE productespecification.id_product = @id_to_delete

      WHILE @@TRANCOUNT > 0
      
         COMMIT 

   END
GO
/****** Object:  StoredProcedure [library].[Search_Product]    Script Date: 9/11/2023 14:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [library].[Search_Product]  
   @search_product nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      WHILE @@TRANCOUNT > 0
      
         COMMIT 

      BEGIN TRANSACTION 

      SELECT DISTINCT 
         PR.id_product AS ID, 
         PR.product_name AS Libro, 
         PDE.product__author AS Autor, 
         PR.product_photo AS Picture, 
         BR.brand__name AS Editorial, 
         GE.product__gender AS Género, 
         CL.clasification__product AS Clasificación, 
         N'$' + CAST(PR.product_price AS varchar(50)) AS Precio, 
         PDE.product__quantity AS Cantidad, 
         PDE.product_themes AS Temas, 
         PS.product__state
      /* Unimos las tablas*/
      FROM 
         library.products  AS PR 
            INNER JOIN library.brands  AS BR 
            ON PR.product_brand = BR.id_brand 
            INNER JOIN library.productespecification  AS PDE 
            ON PDE.id_especification <> 0 
            INNER JOIN library.gender  AS GE 
            ON PDE.id_productGender = GE.id_gender 
            INNER JOIN library.clasification  AS CL 
            ON CL.id_clasification = PDE.id_clasification 
            INNER JOIN library.productstatus  AS PS 
            ON PR.id_productStatus = PS.id_productStatus
      WHERE /* Evaluamos donde va a buscar*/
         (
         PR.product_name LIKE N'%' + @search_product + N'%' OR 
         PDE.product__author LIKE N'%' + @search_product + N'%' OR 
         BR.brand__name LIKE N'%' + @search_product + N'%' OR 
         GE.product__gender LIKE N'%' + @search_product + N'%' OR 
         PDE.product_themes LIKE N'%' + @search_product + N'%' OR 
         CL.clasification__product LIKE N'%' + @search_product + N'%') AND 
         PDE.product__quantity <> 0 AND 
         PS.product__state <> 'Agotado'

      WHILE @@TRANCOUNT > 0
      
         COMMIT 

   END
GO
/****** Object:  StoredProcedure [library].[SearchById]    Script Date: 9/11/2023 14:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [library].[SearchById]  
   @paramID int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      WHILE @@TRANCOUNT > 0
      
         COMMIT 

      BEGIN TRANSACTION 

      SELECT 
         PD.id_product AS ID, 
         BR.brand__name AS Editorial, 
         PD.product_name AS Libro, 
         N'$' + CAST(PD.product_price AS varchar(50)) AS Precio, 
         PD.product_photo AS Foto, 
         PDE.product__author AS Autor, 
         PDE.product_format AS Caracteristicas, 
         PDE.product_themes AS Temas, 
         PD.product_description AS Resumen, 
         GE.product__gender AS Género, 
         PDE.product__quantity AS Disponibles, 
         CL.clasification__product AS Clasificación, 
         PS.product__state AS Estado
      FROM 
         library.products  AS PD 
            INNER JOIN library.brands  AS BR 
            ON PD.product_brand = BR.id_brand 
            INNER JOIN library.productstatus  AS PS 
            ON PD.id_productStatus = PS.id_productStatus 
            INNER JOIN library.productespecification  AS PDE 
            ON PD.id_product = PDE.id_product 
            INNER JOIN library.gender  AS GE 
            ON PDE.id_productGender = GE.id_gender 
            INNER JOIN library.clasification  AS CL 
            ON PDE.id_clasification = CL.id_clasification
      WHERE PD.id_product = @paramID

      WHILE @@TRANCOUNT > 0
      
         COMMIT 

   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.Add_Product' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'PROCEDURE',@level1name=N'Add_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.delete_Product' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'PROCEDURE',@level1name=N'delete_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.Search_Product' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'PROCEDURE',@level1name=N'Search_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.SearchById' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'PROCEDURE',@level1name=N'SearchById'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.availability' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'availability'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.bills' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'bills'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.brands' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'brands'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.clasification' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'clasification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.client' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'client'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.distributor' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'distributor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.employee' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.gender' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.payment' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'payment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.productespecification' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'productespecification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.products' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.productstatus' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'productstatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.reviews' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'reviews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.sales' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.salesreturn' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'salesreturn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.statusclient' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'statusclient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.statusemployee' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'statusemployee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.typeemployee' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'typeemployee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.all_clients' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'VIEW',@level1name=N'all_clients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.all_employees' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'VIEW',@level1name=N'all_employees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.allitems' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'VIEW',@level1name=N'allitems'
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO

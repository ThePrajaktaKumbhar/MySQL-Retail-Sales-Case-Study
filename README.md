# 🛒 Retail Sales & Customer Insights - SQL Case Study

## 📌 Project Overview

This project presents a complete **SQL End-to-End Analysis of a Retail Sales Dataset**.  
The analysis focuses on extracting insights related to **customer behavior, product performance, and revenue trends** using SQL.

The project demonstrates SQL skills ranging from **basic queries to advanced analytical techniques**.

---

## 🛠 Tools Used

- MySQL
- SQL Workbench
- GitHub

---

## 📂 Dataset Description

The project uses three main datasets:

### 1️⃣ Customers Table

| Column | Description |
|------|-------------|
CustomerID | Unique customer ID |
CustomerName | Name of customer |
City | Customer city |
RegistrationDate | Date of registration |

---

### 2️⃣ Products Table

| Column | Description |
|------|-------------|
ProductID | Unique product ID |
ProductName | Product name |
Category | Product category |
Price | Product price |

---

### 3️⃣ Orders Table

| Column | Description |
|------|-------------|
OrderID | Unique order ID |
CustomerID | Customer reference |
ProductID | Product reference |
OrderDate | Date of order |
Quantity | Number of items purchased |

---

## 🔗 Database Relationships

Customers → Orders → Products

- **CustomerID** connects Customers and Orders
- **ProductID** connects Orders and Products

---

## 📊 Key SQL Concepts Used

This project demonstrates:

- SELECT Statements
- WHERE Filtering
- GROUP BY
- ORDER BY
- JOINs
- Subqueries
- Common Table Expressions (CTE)
- Window Functions
- Views
- Aggregations

---

## 📈 Business Questions Solved

Some key insights generated:

✔ Top selling products  
✔ Total revenue generated  
✔ Highest spending customers  
✔ Sales by category  
✔ Customer purchase behavior  

---

## 📁 Project Structure

```
sql-retail-case-study
│
├── Retail_Sales_Analysis.sql
├── SQL_Retail_Case_Study.pdf
└── README.md

---

## 🚀 How to Run This Project

1. Import datasets into MySQL.
2. Create the tables.
3. Run the SQL queries from `retail_analysis.sql`.
4. Analyze results.

---

## ⭐ Portfolio Purpose

This project is part of my **SQL Data Analytics Portfolio** demonstrating real-world SQL analysis skills.

---


## 👩‍💻 Author

Prajakta Kumbhar

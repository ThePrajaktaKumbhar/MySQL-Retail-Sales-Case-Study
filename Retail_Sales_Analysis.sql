CREATE DATABASE Case_study2;
USE Case_study2;

CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(50),
    City VARCHAR(40),
    RagistrationDate DATE
);
                       
INSERT INTO Customers VALUES(1,'Rahul Sharma','Mumbai','2023-01-10'),
							(2,'Aditi Varma','Pune','2023-02-12'),
                            (3,'Priya Singh','Delhi','2023-04-05'),
                            (4,'Arjun Patel','Bengaluru','2023-05-20'),
                            (5,'Sneha Nair','Chennai','2023-06-15');
                            
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(40),
    Category VARCHAR(40),
    Price INT
);
                      
INSERT INTO Products VALUES(101,'Laptop','Electronics',55000),
						   (102,'Mobile','Electronics',22000),
                           (103,'Headphones','Accessories',3000),
                           (104,'Office chair','Furniture',9000),
                           (105,'Samrtwatch','Electronics',7000);
                           
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT
);
                    
INSERT INTO Orders VALUES(5001,1,101,'2023-07-01',1),
						 (5002,2,103,'2023-07-03',2),
                         (5003,3,102,'2023-07-07',1),
                         (5004,1,105,'2023-07-11',1),
                         (5005,4,104,'2023-07-12',1),
                         (5006,5,103,'2023-07-13',3),
                         (5007,2,102,'2023-07-15',1),
                         (5008,3,105,'2023-07-17',1);
                         
SELECT 
    *
FROM
    Customers;
    
SELECT 
    *
FROM
    Products;	
    
SELECT 
    *
FROM
    Orders;

-- Basic Level
-- 1. Select all customers from the Customers table.
SELECT 
    *
FROM
    Customers;

-- 2. Show names of all products in the Products table.
SELECT 
    ProductName
FROM
    Products;

-- 3. Retrieve all orders made by CustomerID = 1.
SELECT 
    *
FROM
    Orders
WHERE
    CustomerID = 1;

-- 4. Display unique product categories.
SELECT DISTINCT
    (Category) AS Unique_category
FROM
    Products;

-- 5. List customers who live in Mumbai.
SELECT 
    *
FROM
    Customers
WHERE
    City = 'Mumbai';

-- 6. Show orders placed after ‘2023-07-05’.
SELECT 
    *
FROM
    Orders
WHERE
    OrderDate > '2023-07-05';

-- 7. Show product details for ProductID = 103.
SELECT 
    *
FROM
    Products
WHERE
    ProductID = 103;

-- 8. Count total number of customers.
SELECT 
    COUNT(CustomerID) AS Total_Customers
FROM
    Customers;

-- 9. Count total number of products.
SELECT 
    COUNT(ProductID) AS Total_Products
FROM
    Products;

-- 10. Get total quantity ordered in all orders.
SELECT 
    SUM(Quantity) AS Total_Quantity
FROM
    Orders;

-- 11. Sort all customers by RegistrationDate.
SELECT 
    *
FROM
    Customers
ORDER BY RagistrationDate;

-- 12. Show all orders sorted by OrderDate (latest first).
SELECT 
    *
FROM
    Orders
ORDER BY OrderDate DESC;

-- 13. Display all products costing more than 10000.
SELECT 
    *
FROM
    Products
WHERE
    Price > 10000;

-- 14. Retrieve customers who registered in 2023.
SELECT 
    *
FROM
    Customers
WHERE
    YEAR(RagistrationDate) = 2023;

-- 15. Display orders where quantity is greater than 1.
SELECT 
    *
FROM
    Orders
WHERE
    Quantity > 1;

-- Medium Level
-- 16. Show customer name along with their order details (JOIN).
SELECT 
    c.CustomerName,
    o.OrderID,
    p.ProductName,
    o.OrderDate,
    o.Quantity
FROM
    Customers c
        JOIN
    Orders o ON c.CustomerID = o.CustomerID
        JOIN
    Products p ON p.ProductID = o.ProductID;

-- 17. Show product name and total quantity sold for each product.
SELECT 
    p.ProductName, SUM(o.Quantity) AS Total_Quantity
FROM
    Products p
        JOIN
    Orders o USING (ProductID)
GROUP BY p.ProductName;

-- 18. List customers who bought Electronics category products.
SELECT DISTINCT
    c.CustomerName, p.Category
FROM
    Customers c
        LEFT JOIN
    Orders o USING (CustomerID)
        JOIN
    Products p ON p.ProductID = o.ProductID
WHERE
    p.Category = 'Electronics';


-- 19. Calculate the total revenue (Price × Quantity) for each order.
SELECT 
    p.ProductName,
    ROUND(SUM(p.Price * o.Quantity), 2) AS Total_Revenue
FROM
    Products p
        JOIN
    Orders o USING (ProductID)
GROUP BY p.ProductName;

-- 20. Show total spending by each customer.
SELECT 
    c.CustomerName,
    ROUND(SUM(p.Price * o.Quantity), 2) AS Total_spend
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
        JOIN
    Products p ON p.ProductID = o.ProductID
GROUP BY c.CustomerName;

-- 21. Count how many orders each customer has placed.
SELECT 
    c.CustomerName, SUM(o.Quantity) AS Total_oder_placed
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
GROUP BY c.CustomerName;

-- 22. Show best-selling product (highest total quantity).
SELECT 
    p.ProductName, SUM(Quantity) AS Total_Quantity
FROM
    Products p
        JOIN
    Orders o USING (ProductID)
GROUP BY p.ProductName
ORDER BY Total_Quantity DESC
LIMIT 1;

-- 23. Show number of orders for each product category.
SELECT 
    p.Category, SUM(Quantity) AS Tota_Order
FROM
    Products p
        JOIN
    Orders o USING (ProductID)
GROUP BY p.Category;

-- 24. Show customers who have not placed any orders.
SELECT 
    c.CustomerName
FROM
    Customers c
        LEFT JOIN
    Orders o USING (CustomerID)
WHERE
    o.OrderID IS NULL;

-- 25. Find the most expensive product.
SELECT 
    ProductName, Price
FROM
    Products
ORDER BY Price DESC
LIMIT 1;

-- 26. Find the least expensive product.
SELECT 
    ProductName, Price
FROM
    Products
ORDER BY Price
LIMIT 1;

-- 27. List all orders along with product price and total bill amount.
SELECT 
    o.OrderID,
    p.ProductName,
    p.Price,
    o.Quantity,
    p.Price * o.Quantity AS Total_bill
FROM
    Products p
        JOIN
    Orders o USING (ProductID);


-- 28. Show products that were never ordered.
SELECT 
    ProductName
FROM
    Products
WHERE
    ProductID NOT IN (SELECT 
            ProductID
        FROM
            Orders);

-- 29. Show orders placed between '2023-07-01' and '2023-07-10'.
SELECT 
    *
FROM
    Orders
WHERE
    OrderDate BETWEEN '2023-07-01' AND '2023-07-10';

-- 30. Count how many customers registered city-wise.
SELECT 
    City, COUNT(CustomerID) AS Total_customer
FROM
    Customers
GROUP BY City;

-- 31. Show customers who placed an order on the same date as CustomerID = 3.
SELECT DISTINCT
    c.CustomerName, o.OrderDate
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
WHERE
    OrderDate IN (SELECT 
            OrderDate
        FROM
            Orders
        WHERE
            CustomerID = 3)
        AND c.CustomerID <> 3;

-- 32. Retrieve customers who bought the most expensive product.
SELECT 
    c.CustomerName, p.ProductName, p.Price
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
        JOIN
    Products p USING (ProductID)
WHERE
    p.Price = (SELECT 
            MAX(Price)
        FROM
            Products);

-- 33. List customers who have placed more orders than the average number of orders per customer.
SELECT 
    c.CustomerName, COUNT(o.OrderID) AS Order_placed
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
GROUP BY c.CustomerName
HAVING Order_placed > (SELECT 
        AVG(Order_count)
    FROM
        (SELECT 
            COUNT(OrderID) AS Order_count
        FROM
            Orders
        GROUP BY CustomerID) AS t);

-- 34. Retrieve customers whose total purchase amount is higher than the average customer spending.
SELECT 
    c.CustomerName, SUM(p.Price * o.Quantity) AS Total_Purchase
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
        JOIN
    Products p USING (ProductID)
GROUP BY c.CustomerName
HAVING Total_Purchase > (SELECT 
        AVG(Cust_spend)
    FROM
        (SELECT 
            SUM(p.Price * o.Quantity) AS Cust_spend
        FROM
            Products p
        JOIN Orders o USING (ProductID)
        GROUP BY o.CustomerID) AS C);

-- 35. Find products whose price is higher than every product in Accessories category.
SELECT 
    ProductName, Price
FROM
    Products
WHERE
    Price > ALL (SELECT 
            Price
        FROM
            Products
        WHERE
            Category = 'Accessories'); 

-- Advanced Level
-- 36. Show top 3 customers by total spending.
SELECT 
    c.CustomerName, SUM(p.Price * o.Quantity) AS Total_Spend
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
        JOIN
    Products p USING (ProductID)
GROUP BY c.CustomerName
LIMIT 3;

-- 37. Show month-wise total sales revenue.
SELECT 
    MONTHNAME(o.OrderDate) AS Months,
    ROUND(SUM(p.Price * o.Quantity), 2) AS Total_revenue
FROM
    Orders o
        JOIN
    Products p USING (ProductID)
GROUP BY Months;

-- 38. Display customers who purchased more than 1 category of products.
SELECT 
    c.CustomerName, COUNT(DISTINCT p.Category) AS CategoryCount
FROM
    Customers c
        JOIN
    Orders o USING (CustomerID)
        JOIN
    Products p USING (ProductID)
GROUP BY c.CustomerName
HAVING CategoryCount > 1;


-- 39. Show products whose total revenue > 20,000.
SELECT 
    p.ProductName, SUM(p.Price * o.Quantity) AS Total_revenue
FROM
    Products p
        JOIN
    Orders o USING (ProductID)
GROUP BY p.ProductName
HAVING Total_revenue > 20000;
					  
-- 40 Create a view for customer purchase summary.
CREATE VIEW Cust_Purchases_summary AS
    (SELECT 
        c.CustomerID,
        c.CustomerName,
        COUNT(DISTINCT o.OrderID) AS Total_orders,
        SUM(o.Quantity) AS Total_quantity,
        SUM(p.Price * o.Quantity) AS Total_revenue
    FROM
        Customers c
            LEFT JOIN
        Orders o USING (CustomerID)
            JOIN
        Products p USING (ProductID)
    GROUP BY c.CustomerID , c.CustomerName);

SELECT 
    *
FROM
    Cust_Purchases_summary;

-- 41. Use a CTE to calculate total revenue for each category.
WITH Total_revenue AS(SELECT p.Category,SUM(p.Price*o.Quantity) AS Total
		              FROM Products p JOIN Orders o 
                      USING(ProductID)
                      GROUP BY Category)
SELECT *FROM Total_revenue;

-- 42. Use a Window Function to find category-wise average price.
SELECT DISTINCT Category,AVG(Price) OVER(PARTITION BY Category) AS Avg_price FROM Products;

-- 43. Use a Window Function to rank customers by number of orders.
SELECT RANK() OVER(ORDER BY Total_orders) AS Ranks,CustomerID,CustomerName,Total_orders
FROM(SELECT c.CustomerID,c.CustomerName,COUNT(o.OrderID) AS Total_orders 
FROM Customers c JOIN Orders o
USING(CustomerID) GROUP BY  c.CustomerID,c.CustomerName)AS T;

-- 44. Write a subquery to find products priced above the average product price.
SELECT 
    ProductName, Price
FROM
    Products
WHERE
    Price > (SELECT 
            AVG(Price)
        FROM
            Products);

-- 45. Find products whose price is higher than every product in Accessories category.
SELECT 
    ProductName, Price
FROM
    Products
WHERE
    Price > ALL (SELECT 
            Price
        FROM
            Products
        WHERE
            Category = 'Accessories');




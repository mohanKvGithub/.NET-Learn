/* =============================================
   SALES MANAGEMENT DATABASE - FULL SCRIPT
============================================= */

-- =============================================
-- 1. DROP TABLES (FOR RE-RUN SAFETY)
-- =============================================

IF OBJECT_ID('Payments', 'U') IS NOT NULL DROP TABLE Payments;
IF OBJECT_ID('OrderItems', 'U') IS NOT NULL DROP TABLE OrderItems;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;

-- =============================================
-- 2. CREATE TABLES
-- =============================================

-- Customers
CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) UNIQUE NOT NULL,
    Phone NVARCHAR(20),
    CreatedDate DATETIME2 DEFAULT GETDATE(),
	IsDeleted Bit not null DEFAULT 0,
);

-- Products
CREATE TABLE Products (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500),
    Price DECIMAL(18,2) NOT NULL CHECK (Price > 0),
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0),
    IsActive BIT DEFAULT 1,
	IsDeleted Bit not null DEFAULT 0,
);

-- Orders
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT NOT NULL,
    OrderDate DATETIME2 DEFAULT GETDATE(),
    OrderStatus NVARCHAR(50) DEFAULT 'Pending',
	IsDeleted Bit not null DEFAULT 0,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerId)
        REFERENCES Customers(CustomerId)
        ON DELETE CASCADE
);

-- OrderItems (Junction Table)
CREATE TABLE OrderItems (
    OrderItemId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(18,2) NOT NULL CHECK (UnitPrice > 0),
	IsDeleted Bit not null DEFAULT 0,
    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId)
        ON DELETE CASCADE,

    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId),

    CONSTRAINT UQ_Order_Product UNIQUE (OrderId, ProductId)
);

-- Payments
CREATE TABLE Payments (
    PaymentId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    PaymentDate DATETIME2 DEFAULT GETDATE(),
    Amount DECIMAL(18,2) NOT NULL CHECK (Amount > 0),
    PaymentMethod NVARCHAR(50) NOT NULL,
	IsDeleted Bit not null DEFAULT 0,
    CONSTRAINT FK_Payments_Orders
        FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId)
        ON DELETE CASCADE
);

-- =============================================
-- 3. INDEXES (Performance Optimization)
-- =============================================

CREATE INDEX IX_Orders_CustomerId ON Orders(CustomerId);
CREATE INDEX IX_OrderItems_OrderId ON OrderItems(OrderId);
CREATE INDEX IX_OrderItems_ProductId ON OrderItems(ProductId);
CREATE INDEX IX_Payments_OrderId ON Payments(OrderId);

-- =============================================
-- 4. INSERT SAMPLE DATA
-- =============================================

-- Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES 
('Mohan', 'KV', 'mohan@email.com', '9999999991'),
('John', 'Doe', 'john@email.com', '9999999992');

-- Products
INSERT INTO Products (ProductName, Description, Price, StockQuantity)
VALUES
('Laptop', 'Gaming Laptop', 75000, 10),
('Mouse', 'Wireless Mouse', 1500, 50),
('Keyboard', 'Mechanical Keyboard', 3500, 30);

-- Orders
INSERT INTO Orders (CustomerId, OrderStatus)
VALUES
(1, 'Completed'),
(2, 'Pending');

-- OrderItems
INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice)
VALUES
(1, 1, 1, 75000),
(1, 2, 2, 1500),
(2, 3, 1, 3500);

-- Payments
INSERT INTO Payments (OrderId, Amount, PaymentMethod)
VALUES
(1, 78000, 'Credit Card'),
(2, 3500, 'UPI');

-- =============================================
-- 5. SAMPLE JOIN QUERY (FULL ORDER DETAILS)
-- =============================================

SELECT 
    o.OrderId,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.ProductName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) AS TotalPrice,
    o.OrderStatus
FROM Orders o
JOIN Customers c ON o.CustomerId = c.CustomerId
JOIN OrderItems oi ON o.OrderId = oi.OrderId
JOIN Products p ON oi.ProductId = p.ProductId;

-- =============================================
-- 6. STORED PROCEDURE (GET ORDER SUMMARY)
-- =============================================

IF OBJECT_ID('sp_GetOrderSummary', 'P') IS NOT NULL
    DROP PROCEDURE sp_GetOrderSummary;
GO

CREATE PROCEDURE sp_GetOrderSummary
    @OrderId INT
AS
BEGIN
    SELECT 
        o.OrderId,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
    FROM Orders o
    JOIN Customers c ON o.CustomerId = c.CustomerId
    JOIN OrderItems oi ON o.OrderId = oi.OrderId
    WHERE o.OrderId = @OrderId
    GROUP BY o.OrderId, c.FirstName, c.LastName;
END;
GO

-- =============================================
-- 7. TEST STORED PROCEDURE
-- =============================================

EXEC sp_GetOrderSummary @OrderId = 1;

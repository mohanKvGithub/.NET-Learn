use [.NetLearn]

--------------------------------- Order By ---------------------------------
go
select * from Customers order by LastName
go
select * from Customers order by LastName desc
go
select * from Customers order by Email,LastName
go
select * from Numbers order by num1 desc, num2 asc
go
select * from Numbers order by num1 desc, num2

--------------------------------- Group By ---------------------------------
go
select FirstName from Customers group by FirstName
go
select FirstName, LastName from Customers group by FirstName, LastName
go
select oi.OrderId,o.CustomerId, count(*) as p from Orders o Left join OrderItems oi on o.OrderId=oi.OrderId
group by oi.OrderId,o.CustomerId

--------------------------------- Aggregate Functions ---------------------------------
-- Aggregate function are performed on list of rows (grouped data or table)

--	1) MIN() works with numeric, string, and date data types. returns the smallest value of the selected column.
go
select min(UnitPrice) as minPrice from OrderItems group by Quantity
go
select min(Price) as minPrice from Products

--	2) MAX() works with numeric, string, and date data types. returns the largest value of the selected column.
go
select max(UnitPrice) as maxPrice from OrderItems group by Quantity
go
select max(Price) as maxPrice from Products

--	3) COUNT()
go 
select count(*) from Products -- Counts Total no rows including null
go
select count([Description]) from Products -- Counts Total non null vlaues in column
go 
select count(distinct [Description]) from Products -- Counts unique non null values in column
go
select IsDeleted as Deleted, count(*) as Count from Products group by IsDeleted; 
Go

--	4) SUM() used to calculate the total sum of values within a specified numeric column. Ignores null value

select sum(StockQuantity) from Products;
go
select sum(StockQuantity) from Products group by IsDeleted

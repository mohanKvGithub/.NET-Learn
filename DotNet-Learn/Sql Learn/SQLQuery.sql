use [.NetLearn]
-- ======================================================================================================================================================
-- SELECT
-- ======================================================================================================================================================
go
select dt.num from (select 5 as num) as dt;
go 
select * from Customers; --all columns
go
select FirstName as Fname, LastName as Lname from Customers; -- particular column with specified header
-- ======================================================================================================================================================
-- DISTINCT
-- ======================================================================================================================================================
go
select distinct FirstName,LastName,Phone from Customers;
go
select distinct FirstName from Customers;
go
select count(distinct LastName) from Customers;
go
select sum(distinct num1) from Numbers
go
select avg(distinct num2) from Numbers
go
select max(distinct num1) from Numbers
go
select min(distinct num1) from Numbers
go
-- ======================================================================================================================================================
-- SELECT TOP
-- ======================================================================================================================================================
select top 3 * from Customers
go
select top 50 percent * from Customers
go
select top 2 LastName from Customers group by LastName
go
-- ======================================================================================================================================================
-- ORDER BY
-- ======================================================================================================================================================
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

-- ======================================================================================================================================================
-- GROUP BY
-- ======================================================================================================================================================

go
select FirstName from Customers group by FirstName
go
select FirstName, LastName from Customers group by FirstName, LastName
go
select oi.OrderId,o.CustomerId, count(*) as p from Orders o Left join OrderItems oi on o.OrderId=oi.OrderId
group by oi.OrderId,o.CustomerId


-- ======================================================================================================================================================
-- Aggregate Functions : are performed on list of rows (grouped data or table)
-- ======================================================================================================================================================

	--	1) MIN() works with numeric, string, and date data types. returns the smallest value of the selected column.
go
select min(UnitPrice) as minPrice from OrderItems group by Quantity
go
select min(Price) as minPrice from Products

-- ======================================================================================================================================================
	--	2) MAX() works with numeric, string, and date data types. returns the largest value of the selected column.
go
select max(UnitPrice) as maxPrice from OrderItems group by Quantity
go
select max(Price) as maxPrice from Products

-- ======================================================================================================================================================
	--	3) COUNT()
go 
select count(*) from Products -- Counts Total no rows including null
go
select count([Description]) from Products -- Counts Total non null vlaues in column
go 
select count(distinct [Description]) from Products -- Counts unique non null values in column
go
select IsDeleted as Deleted, count(*) as Count from Products group by IsDeleted; 
go

-- ======================================================================================================================================================
	--	4) SUM() used to calculate the total sum of values within a specified numeric column. Ignores null value

select sum(StockQuantity) from Products;
go
select sum(StockQuantity) from Products group by IsDeleted
go

-- ======================================================================================================================================================
	--	5) AVG() : SUM(column)/COUNT(column) = equal share for each row. Ignores null value

select avg(Price) from Products 
go
select avg(Price) from Products group by Category
go

-- ======================================================================================================================================================
-- HAVING
-- ======================================================================================================================================================
	--to filter using aggregate functions after grouping
select PaymentMethod, count(*) as TotalPayments from Payments group by PaymentMethod having sum(Amount) >10000 and sum(Amount) <50000
go
select PaymentMethod from Payments group by PaymentMethod having count(*) > 10
go
select PaymentMethod from Payments group by PaymentMethod having min(Amount)>10000 
go
select PaymentMethod from Payments group by PaymentMethod having max(Amount)>10000 
go
-- ======================================================================================================================================================
-- EXISTS 
-- ======================================================================================================================================================
	--used in a WHERE clause to check whether a subquery returns any rows.
select * from Customers c where exists(select * from Orders o where o.CustomerId=c.CustomerId and o.OrderStatus='Completed')
go
-- ======================================================================================================================================================
-- ANY 
-- ======================================================================================================================================================
	--TRUE if at least one value in the subquery result-set meet the condition.
select * from Customers c where c.CustomerId = any(select CustomerId from Orders o left join Payments p on p.OrderId=o.OrderId where o.CustomerId=CustomerId and p.PaymentMethod='Cash');
go
select * from Customers c where c.CustomerId = any(select o.CustomerId from Orders o);
go
-- ======================================================================================================================================================
-- ALL 
-- ======================================================================================================================================================
	--TRUE if every value in the subquery result-set meet the condition.
go
select * from Products p where 'Completed'=all(select OrderStatus from Orders o left join OrderItems oi on oi.OrderId=o.OrderId where oi.ProductId=p.ProductId )
go
select * from Products p where p.StockQuantity > all(select sum(Quantity) from OrderItems o where o.ProductId=p.ProductId)
go
-- ======================================================================================================================================================
-- IN 
-- ======================================================================================================================================================
select * from Products where ProductId in(select ProductId from Orders) and Category in('Electronics','Appliances','Furniture');
go
select * from Products where ProductId not in(select ProductId from Orders) and Category in('Electronics','Appliances','Furniture');
go
-- ======================================================================================================================================================
-- BETWEEN  
-- ======================================================================================================================================================
select * from Products where Price between 100 and 1000
go 
select * from Products where Price not between 1100 and 3000
go 
select * from Orders where OrderDate between '2026-02-21' and '2026-02-25'
go
select * from Customers where FirstName between 'ab' and 'gan' order by FirstName
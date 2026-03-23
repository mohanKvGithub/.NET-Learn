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
-- Aggregate function are performed on list of rows 

--	1) MIN()
go
select min(UnitPrice) as minPrice from OrderItems group by Quantity
go
select min(Price) as minPrice from Products

--	2) MAX()
go
select max(UnitPrice) as maxPrice from OrderItems group by Quantity
go
select max(Price) as maxPrice from Products

--	3) COUNT()

use [.NetLearn]
--------------------------------- Group By ---------------------------------
go
select FirstName from Customers group by FirstName
go
select FirstName, LastName from Customers group by FirstName, LastName

--------------------------------- Order By ---------------------------------
go
select * from Customers order by LastName
go
select * from Customers order by LastName desc
go
select * from Customers order by Email,LastName 
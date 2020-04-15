-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    select p.[ProductName] as Product_Name, c.[CategoryName] as Cateory_Name
    from [product] as p
    join [category] as c 
    on p.[categoryid] = c.id
    ORDER BY c.[categoryname];

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    select o.[Id], o.[OrderDate] as Order_Date, s.[CompanyName] as Company_Name
    from [Order] as o
    join [Shipper] as s ON o.[ShipVia] = s.[Id]
    where o.[OrderDate] < [2012-08-09]
    Order By [Order_date] DESC;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    select o.[Quantity], p.[ProductName] as Product_Name
    from [orderDetail] as o
    join [Product] as p ON o.[ProductId] = p.[Id]
    where o.[OrderId] = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    select o.[Id], c.[CompanyName] as Company_Name, e.[LastName]
    from [Order] as o
    join [Customer] as c ON o.[CustomerId] = c.[Id]
    left join [Employee] as e on o.[EmployeeId] = e.[Id];
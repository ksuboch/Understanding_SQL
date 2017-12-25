USE UnderstandingSQL;

-- заказчики и продавцы из одного города
SELECT
    dbo.Customers.Cname,
    dbo.Sellers.Sname,
    dbo.Sellers.City
FROM 
    dbo.Customers, 
    dbo.Sellers
WHERE
    dbo.Customers.City = dbo.Sellers.City;

-- объединение, основанное на неравенстве
SELECT
    Sname,
    Cname
FROM
    dbo.Sellers,
    dbo.Customers
WHERE Sname < Cname
    AND rating < 200;

SELECT
    Onum,
    Cname,
    dbo.Orders.Snum
FROM
    dbo.Customers,
    dbo.Orders,
    dbo.Sellers
WHERE
    dbo.Customers.City <> dbo.Sellers.City
    AND dbo.Orders.Cnum = dbo.Customers.Cnum
    AND dbo.Orders.Snum = dbo.Orders.Snum;

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

-- номера заказов и мена заказчиков
SELECT
    Onum,
    Cname
FROM
    dbo.Customers,
    dbo.Orders
WHERE
    dbo.Customers.Cnum = dbo.Orders.Cnum;

-- номера заказов, имена продавцов, имена заказчиков
SELECT
    Onum,
    Sname,
    Cname
FROM
    dbo.Customers,
    dbo.Orders,
    dbo.Sellers
WHERE
    dbo.Customers.Cnum = dbo.Orders.Cnum
    AND dbo.Sellers.Snum = dbo.Orders.Snum;

-- имя заказчика, имя продавца, ставка комиссионных (для комиссионных больее 12%)
SELECT
    Cname,
    Sname,
    Comm
FROM
    dbo.Customers,
    dbo.Sellers
WHERE
    dbo.Customers.Snum = dbo.Sellers.Snum
    AND dbo.Sellers.Comm > .12;

-- сумма комиссионных для каждого заказа заказчика с рейтингом выше 100
SELECT
    Onum,
    Amt * Comm
FROM
    dbo.Customers,
    dbo.Orders,
    dbo.Sellers
WHERE
    dbo.Orders.Cnum = dbo.Customers.Cnum
    AND dbo.Orders.Snum = dbo.Sellers.Snum
    AND dbo.Customers.Rating > 100;

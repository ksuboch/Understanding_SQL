USE UnderstandingSQL;

-- пары покупателей с одинаковым рейтингом
SELECT
    cust_1.Cname,
    cust_2.Cname,
    cust_1.Rating
FROM
    dbo.Customers cust_1,
    dbo.Customers cust_2
WHERE
    cust_1.Rating = cust_2.Rating
    AND cust_1.Cnum < cust_2.Cnum
ORDER BY
    cust_1.Rating,
    cust_1.Cname,
    cust_2.Cname;

-- поиск заказов одного покупателя, назначенного разным продавцам
SELECT
    ord_1.Onum,
    ord_1.Cnum,
    ord_1.Snum
FROM
    dbo.Orders ord_1,
    dbo.Orders ord_2
WHERE
    ord_1.Cnum = ord_2.Cnum
    AND ord_1.Snum <> ord_2.Snum;

-- комбинации заказчиков с рейтингом 100, 200 и 300
SELECT
    a.Cname,
    b.Cname,
    c.Cname
FROM
    dbo.Customers a,
    dbo.Customers b,
    dbo.Customers c
WHERE
    a.Rating = 100
    AND b.Rating = 200
    AND c.Rating = 300;

-- все заказчики из городов, где продавец Serres(Snum = 1002) имеет клиентов
SELECT
    b.Cnum,
    b.Cname
FROM
    dbo.Customers a,
    dbo.Customers b
WHERE
    a.Snum = 1002
    AND a.City = b.City;

-- пары заказчиков, обслуживаемых одним продавцом
SELECT
    s.Sname,
    cust_1.Snum,
    cust_1.Cname,
    cust_2.Cname
FROM
    dbo.Customers cust_1,
    dbo.Customers cust_2,
    dbo.Sellers s
WHERE
    cust_1.Snum = cust_2.Snum
    AND cust_1.Snum = s.Snum
    AND cust_1.Cnum < cust_2.Cnum;

-- пары продавцов из одного и того-же города
SELECT
    a.City,
    a.Sname,
    b.Sname
FROM
    dbo.Sellers a,
    dbo.Sellers b
WHERE
    a.City = b.City
    AND a.Snum < b.Snum;

-- все пары заказов по заказчикам
SELECT
    c.Cname,
    o_1.Onum,
    o_2.Onum
FROM
    dbo.Customers c,
    dbo.Orders o_1,
    dbo.Orders o_2
WHERE
    o_1.Cnum = o_2.Cnum
    AND o_1.Onum < o_2.Onum
    AND o_1.Cnum = c.Cnum;

-- все заказчики, имеющие такой-же рейтинг, как у Hoffman
SELECT
    cust_1.Cname,
    cust_2.Cname,
    cust_1.Rating
FROM
    dbo.Customers cust_1,
    dbo.Customers cust_2
WHERE
    cust_1.Rating = cust_2.Rating
    AND cust_1.Cnum <> cust_2.Cnum
    AND cust_2.Cname = 'Hoffman';

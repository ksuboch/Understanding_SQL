USE UnderstandingSQL;

-- все заказчики в заказах на 3-е октября
SELECT
    Cname
FROM dbo.Customers otr
WHERE '03/10/1990' IN
    (SELECT Odate
    FROM dbo.Orders inr
    WHERE otr.Cnum = inr.Cnum);

SELECT DISTINCT
    cst.Cname
FROM
    dbo.Customers cst,
    dbo.Orders ord
WHERE
    cst.Cnum = ord.Cnum
    AND ord.Odate = '03/10/1990';

-- продавцы, имеющие более одного заказчика
SELECT
    Snum,
    Sname
FROM
    dbo.Sellers main
    WHERE 1 <
        (SELECT COUNT(*)
        FROM Customers
        WHERE Snum = main.Snum);

-- проверка таблицы заказов
SELECT *
FROM dbo.Orders main
WHERE NOT Snum =
    (SELECT Snum
    FROM dbo.Customers
    WHERE Cnum = main.Cnum);

-- заказы с суммой, превышающей среднюю для заказчика
SELECT *
FROM dbo.Orders otr
WHERE Amt >=
    (SELECT AVG(Amt)
    FROM dbo.Orders inr
    WHERE inr.Cnum = otr.Cnum);

-- сумма заказов на кадую дату, где она была на 2000 больше максимальной
SELECT
    Odate,
    SUM(Amt)
FROM
    dbo.Orders a
GROUP BY
    Odate
HAVING
    SUM(Amt) >
        (SELECT
            2000.00 + MAX(Amt)
        FROM
            dbo.Orders b
        WHERE
            b.Odate = a.Odate);

-- имена и номера заказчиков с максимальными для их города оценками
SELECT
    Cname,
    Cnum
FROM
    dbo.Customers a
WHERE
    Rating =
        (SELECT
            MAX(Rating)
        FROM
            dbo.Customers b
        WHERE
            b.City = a.City);

-- продавцы, имеющие в своих городах клиентов, котрых не обслуживают

SELECT
    Snum,
    Sname
FROM
    dbo.Sellers s
WHERE
    0 <
        (SELECT COUNT(*)
        FROM dbo.Customers c
        WHERE c.City = s.City
            AND c.Snum <> s.Snum);

SELECT DISTINCT
    s.Snum,
    s.Sname
FROM
    dbo.Customers c,
    dbo.Sellers s
WHERE
    c.City = s.City
    AND c.Snum <> s.Snum;

USE UnderstandingSQL;

-- все данные заказов клиента 'Motika'
SELECT *
FROM dbo.Orders
WHERE Snum =
    (SELECT Snum
    FROM dbo.Sellers
    WHERE Sname = 'Motika');

-- все заказы продавцам из Barcelona
SELECT *
FROM dbo.Orders
WHERE Snum =
    (SELECT Snum
    FROM dbo.Sellers
    WHERE City = 'Barcelona');

-- принудительный возврат одного значения из подзапроса
SELECT *
FROM dbo.Orders
WHERE Snum =
    (SELECT DISTINCT Snum
    FROM dbo.Orders
    WHERE Cnum = 2001);

-- агрегатные функции в подзапросе
SELECT *
FROM dbo.Orders
WHERE Amt >
    (SELECT AVG(Amt)
    FROM dbo.Orders
    WHERE Odate = '04/10/1990');

-- подзапрос, возвращащий множество строк
SELECT *
FROM dbo.Orders
WHERE Snum IN
    (SELECT Snum
    FROM dbo.Sellers
    WHERE City = 'London');

-- комиссионные продавцов, обслуживающих покупателей в лондоне
SELECT Comm
FROM dbo.Sellers
WHERE Snum IN
    (SELECT Snum
    FROM dbo.Customers
    WHERE City = 'London');

-- использование выражений в подзапросах
SELECT *
FROM dbo.Customers
WHERE Cnum =
    (SELECT Snum + 1000
    FROM dbo.Sellers
    WHERE Sname = 'Serres');

-- использование подзапросов в предложении HAVING
SELECT
    Rating,
    COUNT(DISTINCT Cnum)
FROM
    dbo.Customers
GROUP BY
    Rating
HAVING
    Rating >
    (SELECT AVG(Rating)
    FROM dbo.Customers
    WHERE City = 'San Jose');

-- все заказы для 'Cisneros'
SELECT *
FROM dbo.Orders
WHERE Cnum =
    (SELECT Cnum
    FROM dbo.Customers
    WHERE Cname = 'Cisneros');

-- имена и рейтнги покупателей, суммы заказов которых выше средней
SELECT
    Cname,
    Rating
FROM dbo.Customers
WHERE Cnum IN
    (SELECT DISTINCT Cnum
    FROM dbo.Orders
    WHERE Amt >
        (SELECT AVG(Amt) FROM dbo.Orders));

-- сумма всех заказов для продавца, у котрого она болше суммы наибольшего заказа
SELECT
    Snum,
    SUM(Amt)
FROM
    dbo.Orders
GROUP BY
    Snum
HAVING
    SUM(Amt) >
        (SELECT MAX(Amt) FROM dbo.Orders);

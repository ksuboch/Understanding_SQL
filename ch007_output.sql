USE UnderstandingSQL;

-- вывод комиссионных в процентах
SELECT
    Snum,
    Sname, 
    City,
    '%',
    Comm * 100
FROM
    dbo.Sellers;

-- количество заказов на дату
SELECT
    'For',
    Odate,
    ', there are ',
    COUNT(DISTINCT Onum),
    ' orders.',
FROM
    dbo.Orders
GROUP BY Odate;

-- упорядочивание данных заказов по убыванию номера покупателя
SELECT
    *
FROM
    dbo.Orders
ORDER BY Cnum DESC;

-- упорядочивание по нескольким столбцам
SELECT
    *
FROM
    dbo.Orders
ORDER BY Cnum DESC, Amt DESC;

-- упорядочивание по групповым полям
SELECT
    Snum,
    Odate,
    MAX(Amt)
FROM
    dbo.Orders
GROUP BY
    Snum, Odate
ORDER BY Snum;

-- использование номера поля для упорядочивания
SELECT
    Sname, 
    Comm
FROM
    dbo.Sellers
ORDER BY 2 DESC;

-- количество заказов каждого из продавцов в порядке убывания
SELECT
    Snum,
    COUNT(DISTINCT Onum)
FROM
    dbo.Orders
GROUP BY 
    Snum
ORDER BY 2 DESC;

-- номер зказа номер продавца и сумма комиссионных (если они - 12%)
SELECT
    Onum,
    Snum,
    .12 * Amt
FROM
    dbo.Orders;

-- лучший рейтинг заказчика в каждом городе
SELECT
    'For the city (',
    City,
    '), the highest rating is: (',
    MAX(Rating),
    ')'
FROM
    dbo.Customers
GROUP BY City;

-- заказчики в порядке убывания рейтинга
SELECT
    Rating,
    Cname,
    Cnum
FROM
    dbo.Customers
ORDER BY
    Rating DESC;

-- сумма заказов по дням в порядке убывания
SELECT
    Odate,
    SUM(Amt)
FROM
    dbo.Orders
GROUP BY
    Odate
ORDER BY 2 DESC;
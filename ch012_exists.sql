USE UnderstandingSQL;

-- данные заказчиков, если один из них из 'San Jose'
SELECT
    Cnum,
    Cname,
    City
FROM
    dbo.Customers
WHERE EXISTS
    (SELECT *
    FROM dbo.Customers
    WHERE City = 'San Jose');

-- номер продавца, в городе которого есть "чужие" клиенты
SELECT DISTINCT Snum
FROM dbo.Customers otr
WHERE EXISTS
    (SELECT *
    FROM dbo.Customers inr
    WHERE inr.Snum = otr.Snum
        AND inr.Cnum <> otr.Cnum);

-- номер, имя и город продавца, в городе которого есть "чужие" клиенты
SELECT DISTINCT
    fst.Snum,
    fst.Sname,
    fst.City
FROM
    dbo.Sellers fst,
    dbo.Customers scnd
WHERE EXISTS
    (SELECT *
    FROM Customers third
    WHERE scnd.Snum = third.Snum
        AND scnd.Cnum <> third.Cnum)
    AND fst.Snum = scnd.Snum;

-- номера продавцов, работающих только с одним покупателем
SELECT DISTINCT
    Snum
FROM
    dbo.Customers otr
WHERE NOT EXISTS
    (SELECT *
    FROM dbo.Customers inr
    WHERE inr.Snum = otr.Snum
        AND inr.Cnum <> otr.Cnum);

-- продавцы с более чем одним закзом
SELECT *
FROM dbo.Sellers fst
WHERE EXISTS
    (SELECT *
    FROM dbo.Customers scnd
    WHERE fst.Snum = scnd.Snum
        AND 1 <
        (SELECT COUNT(*)
        FROM dbo.Orders ord
        WHERE ord.Cnum = scnd.Cnum));

-- все продавцы, имеющие заказчиков с рейтингом 300
SELECT *
FROM dbo.Sellers slr
WHERE EXISTS
    (SELECT *
    FROM dbo.Customers cst
    WHERE cst.Snum = slr.Snum
        AND cst.Rating = 300);

SELECT
    slr.Snum,
    slr.Sname,
    slr.City,
    slr.Comm
FROM dbo.Sellers slr,
     dbo.Customers cst
WHERE
    slr.Snum = cst.Snum
    AND cst.Rating = 300;

-- все продавцы, имеющие в своём городе "чужих" заказчиков
SELECT *
FROM dbo.Sellers slr
WHERE EXISTS
    (SELECT *
    FROM dbo.Customers cst
    WHERE slr.City = cst.City
        AND slr.Snum <> cst.Snum);

-- заказчик, назначенный продавцу, имеющему заказ от другого заказчика
SELECT *
FROM dbo.Customers cst
WHERE EXISTS
    (SELECT *
    FROM dbo.Sellers slr
    WHERE cst.Snum = slr.Snum
        AND 1 <=
            (SELECT COUNT(*)
            FROM dbo.Orders ord
            WHERE ord.Snum = slr.Snum
                AND ord.Cnum <> cst.Cnum));

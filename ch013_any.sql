USE UnderstandingSQL;

-- продавцы, живущие в одном городе с заказчиком
SELECT *
    FROM dbo.Sellers
    WHERE City = ANY
        (SELECT City
            FROM dbo.Customers);

SELECT *
    FROM dbo.Sellers
    WHERE City IN
        (SELECT City
            FROM dbo.Customers);

-- заказчики с рейтинго больше чем у любого заказчика из Рима
SELECT *
    FROM dbo.Customers
    WHERE Rating > ALL
        (SELECT Rating
            FROM dbo.Customers
            WHERE City = 'Rome');

SELECT *
    FROM dbo.Customers otr
    WHERE NOT EXISTS
        (SELECT *
            FROM dbo.Customers inr
            WHERE inr.Rating >= otr.Rating
                AND inr.City = 'Rome');

-- заказчики с рейтингом, не равным рейтингу заказчиков в San Jose
SELECT *
    FROM dbo.Customers
    WHERE Rating NOT IN
        (SELECT Rating
            FROM dbo.Customers
            WHERE City = 'San Jose');

SELECT *
    FROM dbo.Customers
    WHERE NOT Rating = ANY
        (SELECT Rating
            FROM dbo.Customers
            WHERE City = 'San Jose');

-- подзапрос не возвращает значений
SELECT *
    FROM dbo.Customers
    WHERE Rating > ANY
        (SELECT Rating
            FROM dbo.Customers
            WHERE City = 'Boston');
-- ни одного значения для ANY, следовательно, ни одной строки в результате

SELECT *
    FROM dbo.Customers
    WHERE Rating > ALL
        (SELECT Rating
            FROM dbo.Customers
            WHERE City = 'Boston');
-- ни одного значения для ALL, следовательно, все строки в результате

-- использование COUNT вместо EXISTS
SELECT *
    FROM dbo.Customers otr
    WHERE NOT EXISTS
        (SELECT *
            FROM dbo.Customers inr
            WHERE otr.Rating <= inr.Rating
                AND inr.City = 'Rome');

SELECT *
    FROM dbo.Customers otr
    WHERE 1 >
        (SELECT COUNT(*)
        FROM dbo.Customers inr
        WHERE otr.Rating <= inr.Rating
            AND inr.City = 'Rome');

SELECT *
    FROM dbo.Customers
    WHERE Rating >= ALL
    (SELECT Rating
        FROM dbo.Customers
        WHERE Snum = 1002);

SELECT *
    FROM dbo.Sellers otr
    WHERE City <> ALL
    (SELECT City
        FROM dbo.Customers inr
        WHERE inr.Snum = otr.Snum);

SELECT *
    FROM dbo.Orders
    WHERE Amt > ALL
    (SELECT Amt
        FROM dbo.Orders odr, dbo.Customers cst
        WHERE odr.Cnum = cst.Cnum
            AND cst.City = 'London');

SELECT *
    FROM dbo.Orders
    WHERE Amt >
    (SELECT MAX(Amt)
        FROM dbo.Orders odr, dbo.Customers cst
        WHERE odr.Cnum = cst.Cnum
            AND cst.City = 'London');

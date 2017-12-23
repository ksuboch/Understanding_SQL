USE UnderstandingSQL;

-- продавцы из Барселоны или Лондона
SELECT
    *
FROM
    dbo.Sellers
WHERE
    City = 'Barccelona'
    OR City = 'London';

SELECT
    *
FROM
    dbo.Sellers
WHERE
    City IN ('Barcelona', 'London');

-- покупатели, назначенные продавцам с номерами 1001, 1004, 1007
SELECT
    *
FROM
    dbo.Customers
WHERE
    Snum IN (1001, 1007, 1004);

-- продавцы с комиссией от .10 до .12 (граничные значения включаются)
SELECT
    *
FROM
    dbo.Sellers
WHERE
    Comm BETWEEN .10 AND .12;

-- продавцы с комиссией от .10 до .12 (граничные значения не включаются)
SELECT
    *
FROM
    dbo.Sellers
WHERE
    Comm BETWEEN .10 AND .12
    AND NOT Comm IN (.10, .12);

-- все покупатели, чьи имена попали в алфавитный диапазон
SELECT
    *
FROM
    Customers 
WHERE
    Cname BETWEEN 'A' AND 'G';

-- покупатели с именами вида 'G...'
SELECT
    *
FROM
    dbo.Customers
WHERE
    Cname LIKE 'G%';

-- продавцы с именами вида 'P__l...'
SELECT
    *
FROM 
    dbo.Sellers
WHERE
    Sname LIKE 'P__l%';

-- использование экранирующих символов в шаблоне
SELECT
    *
FROM
    dbo.Sellers
WHERE
    Sname LIKE '%/_%' ESCAPE '/';

-- покупатели, у которых не указан город
SELECT
    *
FROM
    dbo.Customers
WHERE
    NOT City IS NULL;

-- использование NOT и IN
SELECT
    *
FROM
    dbo.Sellers
WHERE
    City NOT IN ('London', 'San Jose');

-- все заказы на 3 или 4 октября 1990
SELECT
    *
FROM
    dbo.Orders
WHERE
    Odate IN ('03/10/1990', '04/10/1990');

SELECT
    *
FROM
    dbo.Orders
WHERE
    Odate BETWEEN '03/10/1990' AND '04/10/1990';

-- все заказчики, которых обслуживает Peel или Motika
SELECT
    *
FROM
    dbo.Customers
WHERE
    Snum IN (
        SELECT
            Snum
        FROM
            dbo.Sellers
        WHERE
            Sname IN ('Peel', 'Motika')
    );

-- все заказчики, имена которых начинаются с букв диапазона 'A' - 'G'
SELECT
    *
FROM
    dbo.Customers
WHERE
    Cname LIKE '[A-G]%';

-- все покупаетли, чьи имена начинаются на букву 'C'
SELECT
    *
FROM
    dbo.Customers
WHERE
    Cname LIKE 'C%';

-- все заказы с нулевым или NULL значением Amt
SELECT
    *
FROM
    dbo.Orders
WHERE
    Amt = 0 OR Amt IS NULL;

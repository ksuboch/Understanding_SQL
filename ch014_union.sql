USE UnderstandingSQL;

--все продавцы и покупатели из города 'London'
SELECT Snum, Sname
    FROM dbo.Sellers
    WHERE city = 'London'

    UNION

SELECT Cnum, Cname
    FROM dbo.Customers
    WHERE city = 'London';

--использование констант и выражений в предложении SELECT
SELECT sl.Snum, sl.Sname, od.Onum, 'Highest on', od.Odate
    FROM dbo.Sellers sl, dbo.Orders od
    WHERE sl.Snum = od.Snum
        AND od.Amt =
        (SELECT MAX(Amt)
            FROM dbo.Orders _od
            WHERE od.Odate = _od.Odate)

    UNION

SELECT sl.Snum, sl.Sname, od.Onum, 'Lowest on', od.Odate
    FROM dbo.Sellers sl, dbo.Orders od
    WHERE sl.Snum = od.Snum
        AND od.Amt =
        (SELECT MIN(Amt)
            FROM dbo.Orders _od
            WHERE od.Odate = _od.Odate)

ORDER BY 3;

--продавцы и покупатели, находящиеся в одном и том-же городе
SELECT sl.Snum, sl.Sname, cs.Cname, Comm
    FROM dbo.Sellers sl, dbo.Customers cs
    WHERE sl.City = cs.City

    UNION

SELECT sl.Snum, sl.Sname, 'No Match', Comm
    FROM dbo.Sellers sl
    WHERE NOT sl.City = ANY
        (SELECT City
            FROM dbo.Customers)

ORDER BY 2 DESC;

SELECT Cnum, Cname, Rating, 'High'
    FROM dbo.Customers
    WHERE Rating >= 200

UNION

SELECT Cnum, Cname, Rating, 'Low'
    FROM dbo.Customers
    WHERE Rating < 200;

SELECT Cnum, Cname
    FROM dbo.Customers cs
    WHERE 1 <
        (SELECT COUNT(*)
            FROM dbo.Orders od
            WHERE cs.Cnum = od.Cnum)

UNION

SELECT Snum, Sname
    FROM dbo.Sellers cs
    WHERE 1 <
        (SELECT COUNT(*)
            FROM dbo.Orders od
            WHERE cs.Snum = od.Snum)

ORDER BY 2;

SELECT Snum
    FROM dbo.Sellers
    WHERE City = 'San Jose'

UNION

(SELECT Cnum
    FROM dbo.Customers
    WHERE City = 'San Jose'

UNION ALL

SELECT Onum
    FROM dbo.Orders
    WHERE Odate = '03/10/1990');

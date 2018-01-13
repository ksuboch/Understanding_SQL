USE UnderstandingSQL;
GO

--создание представления с условием
CREATE VIEW Londonstaff
    AS SELECT *
    FROM dbo.Sellers
    WHERE City = 'London';
GO

--создание представления с ограничением набора столбцов
CREATE VIEW Salesown
    AS SELECT Snum, Sname, City
    FROM dbo.Sellers;
GO

--модификация данных через представления
UPDATE Salesown
    SET City = 'Palo Alto'
    WHERE Snum = 1004;
GO

--представление с агрегирующей функцией
CREATE VIEW Ratingcount (Rating, Cnt)
    AS SELECT Rating, COUNT(*)
    FROM dbo.Customers
    GROUP BY Rating;
GO

SELECT *
    FROM Ratingcount
    WHERE Cnt = 3;
GO

--представление с группировками
CREATE VIEW Totalforday (Odate, Cnum, Snum, Onum, AAmt, SAmt)
    AS SELECT Odate,
    COUNT(DISTINCT Cnum),
    COUNT(DISTINCT Snum),
    COUNT(Onum),
    AVG(Amt),
    SUM(Amt)
    FROM Orders
    GROUP BY Odate;
GO

--представление с объединением
CREATE VIEW Nameorders
    AS SELECT Onum, a.Snum, Sname, Cname
    FROM Orders a, Customers b, Sellers c
    WHERE a.Cnum = b.Cnum
      AND a.Snum = c.Snum;
GO

--представление с подзапросом
CREATE VIEW Elitesalesforce
    AS SELECT b.Odate, a.Snum, a.Sname
        FROM Sellers a, Orders b
        WHERE a.Snum = b.Snum
          AND b.Amt =
          (SELECT MAX(Amt)
            FROM Orders c
            WHERE c.Odate = b. Odate);
GO

DROP VIEW dbo.Londonstaff;
DROP VIEW dbo.Salesown;
DROP VIEW dbo.Ratingcount;
DROP VIEW dbo.Totalforday;
DROP VIEW dbo.Nameorders;
DROP VIEW dbo.Elitesalesforce;

USE UnderstandingSQL;
GO

--представление, выводящее города продавцов и покупателей
CREATE VIEW Citymatch (custcity, salecity)
    AS SELECT a.City, b.City
        FROM dbo.Customers a, dbo.Sellers b
        WHERE a.Snum = b.Snum;
GO

DROP VIEW Citymatch;
GO

--readonly предсавление
CREATE VIEW Dateorders (Odate, OCount)
    AS SELECT Odate, COUNT(*)
        FROM dbo.Orders
        GROUP BY Odate;
GO

DROP VIEW Dateorders;
GO

--модифициркемое представление с проверкой значений
CREATE VIEW SJsales (name, number, percentage)
    AS SELECT Sname, Snum, Comm
        FROM dbo.Sellers
        WHERE City = 'San Jose'
        WITH CHECK OPTION;
GO

DROP VIEW SJsales;
GO

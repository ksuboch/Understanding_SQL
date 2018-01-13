USE UnderstandingSQL;

--назначение прав в б.д.
GRANT SELECT, INSERT ON dbo.Orders TO Adrian;
GRANT SELECT, INSERT ON dbo.Orders TO Adrian, Diane;

--права с ограничениями столбцов
GRANT UPDATE (Comm) ON dbo.Sellers TO Diane;
GRANT REFERENCES (Cname, Cnum) ON Customers TO Stephen;

--передача всех привилегий
GRANT ALL ON dbo.Orders TO Stephen;

--передача привилегий всем
GRANT SELECT ON dbo.Orders TO PUBLIC;

--передача привилегий с свозможностью их назначать
GRANT SELECT ON dbo.Customers TO Adrian WITH GRANT OPTION;

--отмена привилегий
REVOKE INSERT ON dbo.Orders FROM Adrian;

GO
--ограничение привилегий по строкам
CREATE VIEW Londoncust
    AS SELECT *
        FROM dbo.Customers
        WHERE City = 'London'
        WITH CHECK OPTION;
GO

GRANT UPDATE ON Londoncust TO Adrian;
GO

--ограничение привилегий по столбцам
CREATE VIEW Claireview
    AS SELECT Snum, Sname
        FROM dbo.Sellers;
GO

GRANT SELECT ON Claireview TO Claire;

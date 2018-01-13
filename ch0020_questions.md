# Вопросы
### 1. Создайте представление которое бы показывало всех заказчиков которые имеют самые высокие оценки.
```sql
CREATE VIEW Topcust
    AS SELECT *
    FROM dbo.Customers
    WHERE Rating =
        (SELECT MAX(Rating)
        FROM dbo.Customers);
GO

DROP VIEW Topcust
GO
```
***
### 2. Создайте представление которое бы показывало количество продавцов в каждом городе.
```sql
CREATE VIEW Citysnum
    AS SELECT City, COUNT(DISTINCT Snum)
    FROM dbo.Sellers;
GO


DROP VIEW Citysnum;
GO
```
***
### 3. Создайте представление которое бы показывало усредненную общую сумму заказ для каждого продавца после его имени. Предполагается, что все имена - уникальны.
```sql
CREATE VIEW Avgamt (Sname, Avgamt, Sumamt)
    AS SELECT Sname, AVG(Amt), SUM(Amt)
    FROM dbo.Orders, dbo.Sellers
    WHERE dbo.Orders.Snum = dbo.Sellers.Snum
    GROUP BY Sname;
GO

DROP VIEW Avgamt;
GO
```
***
### 4. Создайте представление которое бы показывало каждого продавца с многочисленными заказчиками.
```sql
CREATE VIEW Goodseller (Snum, Cnt)
    AS SELECT Snum, COUNT(*)
    FROM dbo.Orders
    GROUP BY Snum
    HAVING COUNT(*) > 1;
GO

DROP VIEW Goodseller;
GO
```

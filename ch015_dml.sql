USE UnderstandingSQL;

--вставка значений
INSERT INTO dbo.Sellers
    VALUES (1001, 'Peel', 'London', .12);

--вставка со значением NULL
INSERT INTO dbo.Sellers
    VALUES (1001, 'Peel', NULL, .12);

--вставка с именованием полей
INSERT INTO dbo.Customers (City, Cname, Cnum)
    VALUES ('London', 'Honman', 2001);

--удвление всех строк из таблицы
DELETE FROM dbo.Sellers;

--удаление одной записи по условию
DELETE FROM dbo.Sellers
    WHERE Snum = 1003;

--удаление нескольких записей по условию
DELETE FROM dbo.Sellers
    WHERE City = 'London';

--безусловная модификация всех строк
UPDATE dbo.Customers
    SET Rating = 200;

--модифицирование строк по условию
UPDATE dbo.Customers
    SET Rating = 200
    WHERE Snum = 1001;

--модификация нескольких полей
UPDATE dbo.Sellers
    SET Sname = 'Gibson', City = 'Boston', Comm = .10
    WHERE Snum = 1004;

--использование выражений для модификации
UPDATE dbo.Sellers
    SET Comm = Comm * 2;

UPDATE dbo.Customers
    SET Rating = NULL
    WHERE City = 'London';

INSERT INTO dbo.Sellers (City, Sname, Comm, Snum)
    VALUES ('San Jose', 'Bianco', NULL, 1100);

DELETE FROM dbo.Orders
    WHERE Cnum =
    (SELECT Cnum
        FROM dbo.Customers
        WHERE Cname = 'Clemens');

UPDATE dbo.Customers
    SET Rating = Rating + 100
    WHERE City = 'Rome';

UPDATE dbo.Customers
    SET Snum =
    (SELECT Snum
        FROM dbo.Sellers
        WHERE Sname = 'Motika')
    WHERE Snum =
    (SELECT Snum
        FROM dbo.Sellers
        WHERE Sname = 'Serres');

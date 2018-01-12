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

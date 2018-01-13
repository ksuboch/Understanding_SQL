USE UnderstandingSQL;

--удаление заказчиков, опслуживаемых продавцами из Лондона
DELETE
    FROM dbo.Customers
    WHERE Snum = ANY
        (SELECT Snum
            FROM dbo.Sellers
            WHERE City = 'London');

--удалить всех продавцов, имевших заказчика с рейтнгом 100
DELETE FROM dbo.Sellers
    WHERE 100 IN
        (SELECT Rating
            FROM dbo.Customers
            WHERE dbo.Sellers.Snum = dbo.Customers.Snum);

--удалить продавцов, получивших наименьший заказ в рамках
--каждого из дней
DELETE FROM dbo.Sellers
    WHERE Snum IN
        (SELECT Snum
            FROM dbo.Orders a
            WHERE Amt =
                (SELECT MIN(Amt)
                    FROM dbo.Orders b
                    WHERE a.Odate = b.Odate));

--удалить продавцов, получивших наименьший заказ в ремках
--каждого из дней, за исключением дней, когда был сделан
--единственный заказ
DELETE FROM dbo.Sellers
    WHERE Snum IN
        (SELECT Snum
            FROM dbo.Orders a
            WHERE Amt =
                (SELECT MIN(Amt)
                    FROM dbo.Orders b
                    WHERE a.Odate = b.Odate)
            AND 1 <
                (SELECT COUNT(*)
                    FROM dbo.Orders c
                    WHERE a.Odate = c.Odate));

--увеличить комиссионные продавцам, назначенным более
--чем одному заказчику
UPDATE dbo.Sellers
    SET Comm = Comm + .01
    WHERE 2 <=
        (SELECT COUNT(*)
            FROM dbo.Customers
            WHERE dbo.Sellers.Snum = dbo.Customers.Snum);

--уменьшить комиссионные продавцов, получивших наименьший
--заказ в рамках каждого дня
UPDATE dbo.Sellers
    SET Comm = Comm - .01
    WHERE Snum =
        (SELECT Snum
            FROM dbo.Orders a
            WHERE Amt =
                (SELECT MIN(Amt)
                    FROM dbo.Orders b
                    WHERE a.Odate = b.Odate));

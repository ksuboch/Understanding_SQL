USE UnderstandingSQL;

-- Номер, имя, город и размер вознаграждения продавцов
SELECT
    Snum,
    Sname,
    City,
    Comm
FROM
    dbo.Sellers;

-- Различные номера продавцов, встречающиеся в таблице заказов
SELECT DISTINCT
    Snum
FROM
    dbo.Orders;

-- Имя и город продавцов, значение City, которых, равно London
SELECT
    Sname,
    City
FROM
    dbo.Sellers
WHERE
    City = 'London';

-- Все поля покупателей, рейтинг которых равен 100
SELECT *
FROM
    dbo.Customers
WHERE Rating = 100;

-- Номера и суммы заказов для всех строк таблицы заказов
SELECT
    Onum,
    Amt
FROM
    dbo.Orders;

-- все строки таблицы заказчиков, для которых номер продавца - 1001
SELECT
    *
FROM
    dbo.Customers
WHERE
    Snum = 1001;

-- таблицу продавцов с колонками в следующем порядке
SELECT
    city,
    sname,
    snum,
    comm
FROM
    dbo.Sellers;

-- рейтинг, сопровождаемый именем каждого заказчика в San Jose
SELECT
    Rating,
    Cname
FROM
    dbo.Customers
WHERE
    City = 'San Jose';

-- уникальные значения Snum из таблицы заказов по порядку
SELECT DISTINCT
    Snum
FROM
    dbo.Orders
ORDER BY
    Snum;

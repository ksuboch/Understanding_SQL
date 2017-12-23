USE UnderstandingSQL;

-- использование предиката Rating > 200
SELECT
    *
FROM
    dbo.Customers
WHERE Rating > 200;

-- использование булевого оператора AND
SELECT
    *
FROM
    dbo.Customers
WHERE
    Rating > 200
    AND City = 'San Jose';

-- использование булевого оператора OR
SELECT
    *
FROM
    dbo.Customers
WHERE
    Rating > 200
    OR City = 'San Jose';

-- использование булевых операторов OR, NOT
SELECT
    *
FROM
    dbo.Customers
WHERE
    City = 'San Jose'
    OR NOT Rating > 200;

-- использование булевых операторов и скобок
SELECT
    *
FROM
    dbo.Customers
WHERE
    NOT(City = 'San Jose'
    OR Rating > 200);

-- использование булевых операторов и скобок
SELECT
    *
FROM 
    dbo.Orders
WHERE
    NOT((Odate = '03/10/1990' AND Snum > 1002)
    OR Amt > 2000.00);

-- все заказы со значением суммы более 1000
SELECT
    *
FROM
    dbo.Orders
WHERE
    Amt > 1000;

-- поля Sname и City для всех продавцов из Лондона с комиссией более .10
SELECT
    Sname,
    City
FROM
    dbo.Sellers
WHERE
    City = 'London' 
    AND Comm > .10;

-- все заказчики с рейтингом не более 100, не находящиеся в Риме
SELECT
    *
FROM
    dbo.Customers
WHERE
    Rating <= 100 AND NOT City = 'Rome';

/* заказы стоимостью менее 1000 и
 заказы сделанные не 03/10/1990 
 или клиентами с номером не более 2003 */
SELECT
    *
FROM
    dbo.Orders
WHERE
    (Amt < 1000 OR
    NOT(Odate = '03/10/1990'
    AND Cnum > 2003));

/* заказы стоимостью мене 1500 и 
 заказы не от 03/10/1990 с номером продавца 
 не более 1006 */
SELECT
    *
FROM
    dbo.Orders
WHERE
    NOT((Odate = '03/10/1990' OR Snum > 1006)
    AND Amt >= 1500);

-- следующие запросы эквивалентны
SELECT
    Snum,
    Sname,
    City,
    Comm
FROM
    dbo.Sellers
WHERE
    (Comm > .12
    OR Comm < .14);

SELECT
    Snum,
    Sname,
    City,
    Comm
FROM
    dbo.Sellers;

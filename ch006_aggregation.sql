USE UnderstandingSQL;

-- сумма всех заказов
SELECT SUM(Amt)
FROM dbo.Orders;

-- "средний чек"
SELECT AVG(Amt)
FROM dbo.Orders;

-- количество продавцов, которым были  сделаны заказы
SELECT COUNT(DISTINCT Snum)
FROM dbo.Orders;

-- количество строк в таблице продавцов
SELECT COUNT(*)
FROM dbo.Customers;

/* количество не-NULL значений в поле Rating
 таблицы Customers (включая дубликаты) */
SELECT COUNT(ALL Rating)
FROM dbo.Customers;

SELECT COUNT(Rating)
FROM dbo.Customers;

-- максимальная сумма заказа для каждого продавца
SELECT snum, MAX(Amt)
FROM dbo.Orders
GROUP BY Snum;

-- максимальная сумма заказа и дата для каждого продавца
SELECT Snum, Odate, MAX(Amt)
FROM dbo.Orders
GROUP BY Snum, Odate;

-- максимальная сумма заказа и дата для заказов > 3000
SELECT Snum, Odate, MAX(Amt)
FROM dbo.Orders
GROUP BY Snum, Odate
HAVING MAX(Amt) > 3000;

-- номер продавца и максимальная сумма заказа за 03.10.1990
SELECT Snum, MAX(Amt)
FROM dbo.Orders
WHERE Odate = '03/10/1990'
GROUP BY Snum;

-- HAVING использует поля, имеющие одно значение на группу
SELECT Snum, MAX(Amt)
FROM dbo.Orders
GROUP BY Snum
HAVING Snum IN (1002, 1007);

-- сумма заказов 03.10.1990
SELECT SUM(Amt)
FROM dbo.Orders
WHERE Odate = '03/10/1990';

-- количество различных городов в таблице заказчиков
SELECT COUNT(DISTINCT City)
FROM dbo.Customers;

-- минимальная сумма для каждого заказчика
SELECT Cnum, MIN(Amt)
FROM dbo.Orders
GROUP BY Cnum;

-- заказчики с именами вида 'G...' в алф. порядке
SELECT Cname
FROM dbo.Customers
WHERE Cname LIKE 'G%'
ORDER BY Cname;

-- наибольший процент продавца в каждом городе
SELECT City, MAX(Comm)
FROM dbo.Sellers
GROUP BY City;

-- число заказчиков на каждый день
SELECT COUNT(DISTINCT Cnum), Odate
FROM dbo.Orders
GROUP BY Odate;
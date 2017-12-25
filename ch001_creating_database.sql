IF DB_ID('UnderstandingSQL') IS NULL
    CREATE DATABASE UnderstandingSQL;
GO

USE UnderstandingSQL;

IF OBJECT_ID('dbo.Orders') IS NOT NULL
	DROP TABLE dbo.Orders;

IF OBJECT_ID('dbo.Customers') IS NOT NULL
	DROP TABLE dbo.Customers;

IF OBJECT_ID('dbo.Sellers') IS NOT NULL
    DROP TABLE dbo.Sellers;
GO

-- Продавцы
CREATE TABLE dbo.Sellers (
    Snum  INT NOT NULL  -- уникальный номер назначенный каждому продавцу
            CONSTRAINT PK_Sellers_Snum PRIMARY KEY,
	Sname VARCHAR(25),  -- имя проадвца
    City  VARCHAR(25),  -- расположение продавца
    Comm  DECIMAL(4, 2) -- комиссионныые продава в десятичной форме
);

INSERT INTO dbo.Sellers(Snum, Sname, City, Comm) VALUES
	(1001, 'Peel'   , 'London'   , 0.12),
	(1002, 'Serres' , 'San Jose' , 0.13),
	(1004, 'Motika' , 'London'   , 0.11),
	(1007, 'Rifkin' , 'Barcelona', 0.15),
	(1003, 'Axelrod', 'New York' , 0.10);
GO

-- Заказчики
CREATE TABLE dbo.Customers (
	Cnum   INT NOT NULL -- уникальный номер назначенный каждому заказчику
            CONSTRAINT PK_Customers_Cnum PRIMARY KEY,
	Cname  VARCHAR(25), -- имя заказчика
	City   VARCHAR(25), -- расположение заказчика
	Rating INT,         -- рейтнг заказчика
	Snum   INT NOT NULL -- номер продавца, назначенного этому заказчику
            CONSTRAINT FK_Customers_Snum FOREIGN KEY
            REFERENCES dbo.Sellers(Snum)
);

INSERT INTO dbo.Customers(Cnum, Cname, City, Rating, Snum) VALUES
	(2001, 'Hoffman' , 'London'  , 100, 1001),
	(2002, 'Giovanni', 'Rome'    , 200, 1003),
	(2003, 'Liu'     , 'San Jose' , 200, 1002),
	(2004, 'Grass'   , 'Berlin'  , 300, 1002),
	(2006, 'Clemens' , 'London'  , 100, 1001),
	(2008, 'Cisneros', 'San Jose', 300, 1007),
	(2007, 'Pereira' , 'Rome'    , 100, 1004);
GO

-- Заказы
CREATE TABLE dbo.Orders (
	Onum  INT NOT NULL    -- уникальный номер заказа
        CONSTRAINT PK_Orders_Onum PRIMARY KEY,
	Amt   DECIMAL(12, 2), -- сумма заказа
	Odate DATE,           -- дата заказа
	Cnum  INT NOT NULL    -- номер заказчика
        CONSTRAINT FK_Orders_Cnum FOREIGN KEY
        REFERENCES dbo.Customers(Cnum),
	Snum  INT NOT NULL    -- номер продавца
        CONSTRAINT FK_Orders_Snum FOREIGN KEY
        REFERENCES dbo.Sellers(Snum)
)

INSERT INTO dbo.Orders(Onum, Amt, Odate, Cnum, Snum) VALUES
	(3001,   18.69, '03/10/1990', 2008, 1007),
	(3003,  767.19, '03/10/1990', 2001, 1001),
	(3002, 1900.10, '03/10/1990', 2007, 1004),
	(3005, 5160.45, '03/10/1990', 2003, 1002),
	(3006, 1098.16, '03/10/1990', 2008, 1007),
	(3009, 1713.23, '04/10/1990', 2002, 1003),
	(3007,   75.75, '04/10/1990', 2004, 1002),
	(3008, 4723.00, '05/10/1990', 2006, 1001),
	(3010, 1309.95, '06/10/1990', 2004, 1002),
	(3011, 9891.88, '06/10/1990', 2006, 1001);
GO

SELECT * FROM dbo.Sellers;

SELECT * FROM dbo.Customers;

SELECT * FROM dbo.Orders;

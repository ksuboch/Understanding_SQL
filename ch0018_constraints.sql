USE UnderstandingSQL;

--создание таблицы с ограничениями
CREATE TABLE dbo.Salespeople
    (Snum  integer  NOT NULL UNIQUE,
     Sname char(10) NOT NULL UNIQUE,
     City  char(10),
     Comm  decimal);


--объявление уникальности группы столбцов
CREATE TABLE dbo.Cust
    (CNum   integer  NOT NULL,
     Cname  char(10) NOT NULL,
     City   char(10),
     Rating integer,
     Snum   integer NOT NULL,
     UNIQUE(Cnum, Snum));

--создание первичного ключа
CREATE TABLE dbo.Salestotal
    (Snum  integer  NOT NULL PRIMARY KEY,
     Sname char(10) NOT NULL UNIQUE,
     City  char(10),
     Comm  decimal);

--первичный ключ из нескольких столбцов
CREATE TABLE dbo.Namefield
    (Firstname char(10) NOT NULL,
     Lastname  char(10) NOT NULL,
     City      char(10),
     PRIMARY KEY (Firstname, Lastname));

--проверка вводимых значений
CREATE TABLE dbo.Salespeople
    (Snum  integer NOT NULL PRIMARY KEY,
     Sname char(10),
     City  char(10) CHECK
     (City IN ('London', 'New York', 'San Jose', 'Barselona')),
     Comm  decimal CHECK(Comm < 1));

CREATE TABLE dbo.Orders
    (Onum integer  NOT NULL UNIQUE,
    Amt   decimal,
    Odate char(10) NOT NULL CHECK (Odate Like '__/__/____'),
    Cnum  integer  NOT NULL,
    Snum  integer  NOT NULL);

CREATE TABLE dbo.Salespeople
    (Snum  integer NOT NULL UNIQUE,
     Sname char(10) NOT NULL UNIQUE,
     City  char(10),
     Comm  decimal,
     CHECK (Comm < .15 OR City = 'Barselona;'));

--установка значений по-умолчанию
CREATE TABLE dbo.Sale
    (Snum  integer NOT NULL UNIQUE,
     Sname char(10) NOT NULL UNIQUE,
     City  char(10) DEFAULT 'New York',
     Comm  decimal CHECK (Comm < 1));

CREATE TABLE dbo.Salesman (
    Snum  INT NOT NULL PRIMARY KEY,
	Sname VARCHAR(25) CHECK (Sname BETWEEN 'A' AND 'M') ,
    City  VARCHAR(25),
    Comm  DECIMAL(4, 2) NOT NULL DEFAULT .1
);

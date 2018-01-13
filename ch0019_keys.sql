USE UnderstandingSQL;

--создание таблицы с внешним ключом
CREATE TABLE dbo.Customers
    (Cnum  integer NOT NULL PRIMARY KEY,
     Cname char(10),
     City  char(10),
     Snum  integer,
     FOREIGN KEY (Snum) REFERENCES dbo.Sellers (Snum));

CREATE TABLE dbo.Customers
    (Cnum  integer NOT NULL PRIMARY KEY,
     Cname char(10),
     City  char(10),
     Snum  integer REFERENCES dbo.Sellers (Snum));

--распространение изменений по зависимым таблицам
CREATE TABLE dbo.Csts
    (Cnum  integer NOT NULL PRIMARY KEY,
     Cname char(10) NOT NULL,
     City  char(10),
     Rating integer,
     Snum integer REFERENCES dbo.Sellers (Snum)
     ON DELETE NO ACTION
     ON UPDATE CASCADE);

--внешние ключи, ссылающиеся обратно к подчинённым таблицам
CREATE TABLE dbo.Employees
    (Empno   integer  NOT NULL PRIMARY KEY,
     Ename   char(10) NOT NULL UNIQUE,
     Manager integer REFERENCES Employees);

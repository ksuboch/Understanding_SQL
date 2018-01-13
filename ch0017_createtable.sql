USE UnderstandingSQL;

--создание таблицы
CREATE TABLE dbo.Salespeople
    (Snum  integer,
     Sname char(10),
     City  char(10),
     Comm  decimal);

--создание неуникального индекса
CREATE INDEX IDX_Salespeople_Sname ON dbo.Salespeople (Sname);

--создание уникального индекса
CREATE UNIQUE INDEX IDX_Salespeople_Snum ON dbo.Salespeople (Snum);

--удаление индеккса
DROP INDEX dbo.Salespeople.IDX_Salespeople_Sname;
DROP INDEX dbo.Salespeople.IDX_Salespeople_Snum;

--удаление таблицы
DROP TABLE dbo.Salespeople;

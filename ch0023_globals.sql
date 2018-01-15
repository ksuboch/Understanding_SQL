USE UnderstandingSQL;

--создание синонима для таблицы
CREATE SYNONYM Clients FOR dbo.Customers;

--удаление синонима
DROP SYNONYM Clients;

# Вопросы
### 1. Какое из этих представлений - модифицируемое ?
```sql
CREATE VIEW Dailyorders
    AS SELECT DISTINCT cnum, snum, onum, odate
    FROM Orders;

CREATE VIEW Custotals
    AS SELECT cname, SUM (amt)
    FROM Orders, Customers
    WHERE Orders.cnum = customer.cnum
    GROUP BY cname;

CREATE VIEW Thirdorders
    AS SELECT *
    FROM Dailyorders
    WHERE odate = 10/03/1990;

CREATE VIEW Nullcities
    AS SELECT snum, sname, city
    FROM Salespeople
    WHERE city IS NULL
        OR sname BETWEEN 'A' AND 'MZ';
```
1, 3 и 4 - модифицируемые представления
***
### 2. Создайте представление таблицы Продавцов с именем Commissions (Комиссионные). Это представление должно включать только пол comm и snum. С помощью этого представления, можно будет вводить или изменять комиссионные, но только для значений между .10 и .20.
```sql
CREATE VIEW Comissions
    AS SELECT Snum, Comm
    WHERE Comm BETWEEN .10 AND .20
    WITH CHECK OPTIONS;
GO
```
***
### 3. Некоторые SQL реализации имеют встроенную константу представляющую текущую дату, иногда называемую " CURDATE ". Слово CURDATE может следовательно использоваться в операторе SQL, и заменяться текущей датой, когда его значение станет доступным с помощью таких команд как SELECT или INSERT. Мы будем использовать представление таблицы Порядков с именем Entryorders для вставки строк в таблицу Порядков. Создайте таблицу порядков, так чтобы CURDATE автоматически вставлялась в поле odate если не указано другого значения. Затем создайте представление Entryorders, так чтобы значения не могли быть указаны.
```sql
CREATE TABLE Orders
    (onum  integer NOT NULL PRIMARY KEY,
     amt   decimal,
     odate date DEFAULT VALUE = CURDATE,
     snum  integer,
     cnum  integer);
GO

CREATE VIEW Entryorders
    AS SELECT onum, amt, snum, cnum
    FROM Orders;
GO
```

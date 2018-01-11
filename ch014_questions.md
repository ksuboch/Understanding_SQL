# Вопросы
### 1. Создайте объединение из двух запросов которое показало бы имена, города, и рейтинги всех заказчиков. Те из них которые имеют поле `rating = 200` и более, должны кроме того иметь слова - `High`, а остальные должны иметь слова `Low`.
```sql
SELECT Cnum, Cname, Rating, 'High'
    FROM dbo.Customers
    WHERE Rating >= 200

UNION

SELECT Cnum, Cname, Rating, 'Low'
    FROM dbo.Customers
    WHERE Rating < 200;
```
***
### 2. Напишите команду которая бы вывела имена и номера каждого продавца и каждого заказчика которые имеют больше чем один текущий заказ. Результат представьте в алфавитном порядке.
```sql
SELECT Cnum, Cname
    FROM dbo.Customers cs
    WHERE 1 <
        (SELECT COUNT(*)
            FROM dbo.Orders od
            WHERE cs.Cnum = od.Cnum)

UNION

SELECT Snum, Sname
    FROM dbo.Sellers cs
    WHERE 1 <
        (SELECT COUNT(*)
            FROM dbo.Orders od
            WHERE cs.Snum = od.Snum)

ORDER BY 2;
```
***
### 3. Сформируйте объединение из трех запросов. Первый выбирает поля `snum` всех продавцов в `San Jose`; второй, поля `cnum` всех заказчиков в `San Jose`; и третий поля `onum` всех заказов на 3 Октября. Сохраните дубликаты между последними двумя запросами, но устраните любую избыточность вывода между каждым из их и самым первым.
```sql
SELECT Snum
    FROM dbo.Sellers
    WHERE City = 'San Jose'

UNION

(SELECT Cnum
    FROM dbo.Customers
    WHERE City = 'San Jose'

UNION ALL

SELECT Onum
    FROM dbo.Orders
    WHERE Odate = '03/10/1990');
```

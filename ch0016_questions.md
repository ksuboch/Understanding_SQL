# Вопросы
### 1. Предположите, что имеется таблица называемая Multicust, с такими же именами столбцов что и таблица Продавцов. Напишите команду, которая бы вставила всех продавцов (из таблицы Продавцов)имеющих более чем одного заказчика в эту таблицу.
```sql
INSERT INTO Multicust
    SELECT *
        FROM dbo.Sellers
        WHERE 1 <
            (SELECT COUNT(*)
                FROM dbo.Customers
                WHERE dbo.Customers.Snum = dbo.Sellers.Snum);
```
***
### 2. Напишите команду которая бы удаляла всех заказчиков не имеющих текущих заказов.
```sql
DELETE FROM dbo.Customers cs
    WHERE NOT EXISTS
        (SELECT *
            FROM dbo.Orders od
            WHERE sl.Cnum = od.Cnum);
```
***
### 3. Напишите команду которая бы увеличила на двадцать процентов комиссионные всех продавцов имеющих заказы более чем на $3,000.
```sql
UPDATE dbo.Sellers sl
    SET Comm = Comm * 1.2
    WHERE 3000 <
        (SELECT SUM(Amt)
            FROM dbo.Orders od
            WHERE od.Snum = sl.Snum)
    AND Comm < 1;
```

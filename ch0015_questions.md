# Вопросы
### 1. Напишите команду которая бы поместила следующие значения, в их нижеуказанном порядке, в таблицу `Sellers`:
```sql
city - 'San Jose',
name - 'Bianco',
comm - NULL,
cnum - 1100.
```
```sql
INSERT INTO dbo.Sellers (City, Sname, Comm, Snum)
    VALUES ('San Jose', 'Bianco', NULL, 1100);
```
### 2. Напишите команду которая бы удалила все заказы заказчика `Clemens` из таблицы `Orders`.
```sql
DELETE FROM dbo.Orders
    WHERE Cnum =
    (SELECT Cnum
        FROM dbo.Customers
        WHERE Cname = 'Clemens');
```
***
### 3. Напишите команду которая бы увеличила оценку всех заказчиков в `Rome` на `100`.
```sql
UPDATE dbo.Customers
    SET Rating = Rating + 100
    WHERE City = 'Rome';
```
***
### 4. Продавец `Serres` оставил компанию. Переназначьте его заказчиков продавцу `Motika`.
```sql
UPDATE dbo.Customers
    SET Snum =
    (SELECT Snum
        FROM dbo.Sellers
        WHERE Sname = 'Motika')
    WHERE Snum =
    (SELECT Snum
        FROM dbo.Sellers
        WHERE Sname = 'Serres');
```

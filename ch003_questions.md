# Вопросы
### 1. Напишите команду `SELECT` которая бы вывела номер заказа, сумму, и дату для всех строк из таблицы `Orders`.
```sql
SELECT
    Onum,
    Amt
FROM
    dbo.Orders;
```
***
### 2. Напишите запрос который вывел бы все строки из таблицы `Customers` для которых номер продавца `= 1001`.
```sql
SELECT
    *
FROM
    dbo.Customers
WHERE
    Snum = 1001;
```
***
### 3. Напишите запрос который вывел бы таблицу продавцов со столбцами в следующем порядке: `city, sname, snum, comm`.
```sql
SELECT
    city,
    sname,
    snum,
    comm
FROM
    dbo.Sellers;
```
***
### 4. Напишите команду `SELECT` которая вывела бы `Rating`, сопровождаемую именем каждого заказчика в `San Jose`.
```sql
SELECT
    Rating,
    Cname
FROM
    dbo.Customers
WHERE
    City = 'San Jose';
```
***
### 5. Напишите запрос который вывел бы значения `Snum` всех продавцов из таблицы `Orders` по порядку и без повторений.
```sql
SELECT DISTINCT
    Snum
FROM
    dbo.Orders
ORDER BY
    Snum;
```

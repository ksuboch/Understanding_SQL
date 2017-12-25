# Вопросы
### 1. Напишите запрос который бы вывел список номеров заказов сопровождающихся именем заказчика который создавал эти заказы.
```sql
SELECT
    Onum,
    Cname
FROM
    dbo.Customers,
    dbo.Orders
WHERE
    dbo.Customers.Cnum = dbo.Orders.Cnum;
```
***
### 2. Напишите запрос который бы выдавал имена продавца и заказчика для каждого заказа после его номера.
```sql
SELECT
    Onum,
    Sname,
    Cname
FROM
    dbo.Customers,
    dbo.Orders,
    dbo.Sellers
WHERE
    dbo.Customers.Cnum = dbo.Orders.Cnum
    AND dbo.Sellers.Snum = dbo.Orders.Snum;
```
***
### 3. Напишите запрос который бы выводил всех заказчиков обслуживаемых продавцом с комиссионными выше 12% . Выведите им заказчика, им продавца, и ставку комиссионных продавца.
```sql
SELECT
    Cname,
    Sname,
    Comm
FROM
    dbo.Customers,
    dbo.Sellers
WHERE
    dbo.Customers.Snum = dbo.Sellers.Snum
    AND dbo.Sellers.Comm > .12;
```
***
### 4. Напишите запрос который вычислил бы сумму комиссионных продавца для каждого заказа заказчика с рейтингом выше 100.
```sql
SELECT
    Onum,
    Amt * Comm
FROM
    dbo.Customers,
    dbo.Orders,
    dbo.Sellers
WHERE
    dbo.Orders.Cnum = dbo.Customers.Cnum
    AND dbo.Orders.Snum = dbo.Sellers.Snum
    AND dbo.Customers.Rating > 100;
```

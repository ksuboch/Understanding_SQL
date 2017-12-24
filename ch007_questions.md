# Вопросы
### 1. Предположим что каждый продавец имеет 12% комиссионных. Напишите запрос к таблице заказов который мог бы вывести номер заказа, номер продавца, и сумму комиссионных продавца для этого заказа. 
```sql
SELECT
    Onum,
    Snum,
    .12 * Amt
FROM
    dbo.Orders;
```
***
### 2. Напишите запрос к таблице Заказчиков который мог бы найти высшую оценку в каждом городе. Вывод должен быть в такой форме: `For the city (city), the highest rating is: (rating)`
```sql
SELECT
    'For the city (',
    City,
    '), the highest rating is: (',
    MAX(Rating),
    ')'
FROM
    dbo.Customers
GROUP BY City;
```
***
### 3. Напишите запрос который выводил бы список заказчиков в нисходящем порядке поля `Rating`. Вывод поля `Rating` должен сопровождаться именем заказчика и его номером.
```sql
SELECT
    Rating,
    Cname,
    Cnum
FROM
    dbo.Customers
ORDER BY
    Rating DESC;
```
***
### 4. Напишите запрос который бы выводил сумму заказов на каждый день в порядке убывания. 
```sql
SELECT
    Odate,
    SUM(Amt)
FROM
    dbo.Orders
GROUP BY
    Odate
ORDER BY 2 DESC;
```
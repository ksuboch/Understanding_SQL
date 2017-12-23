# Вопросы
### 1. Напишите запрос который может дать вам все порядки со значениями суммы выше чем $1,000. 
```sql
SELECT
    *
FROM
    dbo.Orders
WHERE
    Amt > 1000;
```
***
### 2. Напишите запрос который может выдать вам поля `Sname` и `City` для всех продавцов в Лондоне с комиссионными выше .10.
```sql
SELECT
    Sname,
    City
FROM
    dbo.Sellers
WHERE
    City = 'London' 
    AND Comm > .10;
```
***
### 3. Напишите запрос к таблице `Customers` чей вывод может включить всех заказчиков с оценкой =< 100, если они не находятся в Риме.
```sql
SELECT
    *
FROM
    dbo.Customers
WHERE
    Rating <= 100 AND NOT City = 'Rome';
```
***
### 4. Что может быть выведено в результате следующего запроса ?
```sql
SELECT
    *
FROM
    dbo.Orders
WHERE
    (Amt < 1000 OR
    NOT(Odate = '03/10/1990'
    AND Cnum > 2003));
```
Заказы стоимостью менее 1000 и заказы сделанные не 03/10/1990 или клиентами с номером не более 2003.
***
### 5. Что может быть выведено в результате следующего запроса ?
```sql
SELECT
    *
FROM
    dbo.Orders
WHERE
    NOT((Odate = '03/10/1990' OR Snum > 1006)
    AND Amt >= 1500);
```
Заказы стоимостью мене 1500 и заказы не от 03/10/1990 с номером продавца не более 1006.
***
### 6. Как можно проще переписать такой запрос ?
```sql
SELECT
    Snum,
    Sname,
    City,
    Comm
FROM
    dbo.Sellers
WHERE
    (Comm > .12
    OR Comm < .14);
```

```sql
SELECT
    Snum,
    Sname,
    City,
    Comm
FROM
    dbo.Sellers;
```
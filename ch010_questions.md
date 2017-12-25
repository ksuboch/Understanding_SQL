# Вопросы
### 1. Напишите запрос, который бы использовал подзапрос для получения всех заказов для заказчика с именем `Cisneros`. Предположим, что вы не знаете номера этого заказчика, указываемого в поле `Cnum`.
```sql
SELECT *
FROM dbo.Orders
WHERE Cnum =
    (SELECT Cnum
    FROM dbo.Customers
    WHERE Cname = 'Cisneros');
```
***
### 2. Напишите запрос который вывел бы имена и рейтинги всех заказчиков суммы заказов которых выше средней.
```sql
SELECT
    Cname,
    Rating
FROM dbo.Customers
WHERE Cnum IN
    (SELECT DISTINCT Cnum
    FROM dbo.Orders
    WHERE Amt >
        (SELECT AVG(Amt) FROM dbo.Orders));
```
***
### 3. Напишите запрос который бы выбрал общую сумму всех заказов для каждого продавца, у которого эта обща сумма больше чем сумма наибольшего заказа в таблице.
```sql
SELECT
    Snum,
    SUM(Amt)
FROM
    dbo.Orders
GROUP BY
    Snum
HAVING
    SUM(Amt) > (SELECT MAX(Amt) FROM dbo.Orders);
```

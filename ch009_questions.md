# Вопросы
### 1. Напишите запрос который бы вывел все пары продавцов живущих в одном и том же городе. Исключите комбинации продавцов с ними же, а также дубликаты строк выводимых в обратным порядке.
```sql
SELECT
    a.City,
    a.Sname,
    b.Sname
FROM
    dbo.Sellers a,
    dbo.Sellers b
WHERE
    a.City = b.City
    AND a.Snum < b.Snum;
```
***
### 2. Напишите запрос который вывел бы все пары заказов по данным заказчикам, именам этих заказчиков, и исключал дубликаты из вывода, как в предыдущем вопросе.
```sql
SELECT
    c.Cname,
    o_1.Onum,
    o_2.Onum
FROM
    dbo.Customers c,
    dbo.Orders o_1,
    dbo.Orders o_2
WHERE
    o_1.Cnum = o_2.Cnum
    AND o_1.Onum < o_2.Onum
    AND o_1.Cnum = c.Cnum;
```
***
### 3. Напишите запрос который вывел бы имена(`Cname`) и города(`City`) всех заказчиков с такой же оценкой(`Rating`) как у `Hoffman`. Напишите запрос использующий поле `Cnum` `Hoffman` а не его оценку, так чтобы оно могло быть использовано если его оценка вдруг изменится.
```sql
SELECT
    cust_1.Cname,
    cust_2.Cname,
    cust_1.Rating
FROM
    dbo.Customers cust_1,
    dbo.Customers cust_2
WHERE
    cust_1.Rating = cust_2.Rating
    AND cust_1.Cnum <> cust_2.Cnum
    AND cust_2.Cname = 'Hoffman';
```

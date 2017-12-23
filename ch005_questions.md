# Вопросы
### 1. Напишите два запроса которые могли бы вывести все заказы на 3 или 4 Октября 1990
```sql
SELECT
    *
FROM
    dbo.Orders
WHERE
    Odate IN ('03/10/1990', '04/10/1990');

SELECT
    *
FROM
    dbo.Orders
WHERE
    Odate BETWEEN '03/10/1990' AND '04/10/1990';
```
***
### 2. Напишите запрос который выберет всех заказчиков обслуживаемых продавцами `Peel` или `Motika`. ( Подсказка: из наших типовых таблиц, поле snum связывает вторую таблицу с первой ) 
```sql
SELECT
    *
FROM
    dbo.Customers
WHERE
    Snum IN (
        SELECT
            Snum
        FROM
            dbo.Sellers
        WHERE
            Sname IN ('Peel', 'Motika')
    );
```
***
### 3. Напишите запрос, который может вывести всех заказчиков чьи имена начинаются с буквы попадающей в диапазон от `A` до `G`. 
```sql
SELECT
    *
FROM
    dbo.Customers
WHERE
    Cname LIKE '[A-G]%';
```
***
### 4. Напишите запрос который выберет всех покупателей чьи имена начинаются с буквы `C`. 
```sql
SELECT
    *
FROM
    dbo.Customers
WHERE
    Cname LIKE 'C%';
```
***
### 5. Напишите запрос который выберет все заказы имеющие нулевые значения или `NULL` в поле `Amt`(сумма).
```sql
SELECT
    *
FROM
    dbo.Orders
WHERE
    Amt = 0 OR Amt IS NULL;
```
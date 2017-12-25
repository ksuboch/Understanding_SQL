# Вопросы
### 1. Напишите команду SELECT использующую соотнесенный подзапрос, которая выберет имена и номера всех заказчиков с максимальными для их городов оценками.
```sql
SELECT
    Cname,
    Cnum
FROM
    dbo.Customers a
WHERE
    Rating =
        (SELECT
            MAX(Rating)
        FROM
            dbo.Customers b
        WHERE
            b.City = a.City);
```
***
### 2. Напишите два запроса которые выберут всех продавцов ( по их имени и номеру ) которые в своих городах имеют заказчиков которых они не обслуживают. Один запрос - с использованием объединения и один - с соотнесенным подзапросом. Которое из решений будет более изящным?
```sql
SELECT
    Snum,
    Sname
FROM
    dbo.Sellers s
WHERE
    0 <
        (SELECT COUNT(*)
        FROM dbo.Customers c
        WHERE c.City = s.City
            AND c.Snum <> s.Snum);

SELECT DISTINCT
    s.Snum,
    s.Sname
FROM
    dbo.Customers c,
    dbo.Sellers s
WHERE
    c.City = s.City
    AND c.Snum <> s.Snum;
```

# Вопросы
### 1. Напишите запрос который бы использовал оператор `EXISTS` для извлечения всех продавцов которые имеют заказчиков с оценкой `300`.
```sql
SELECT *
FROM dbo.Sellers slr
WHERE EXISTS
    (SELECT *
    FROM dbo.Customers cst
    WHERE cst.Snum = slr.Snum
        AND cst.Rating = 300);
```
***
### 2. Как бы вы решили предыдущую проблему используя объединение?
```sql
SELECT
    slr.Snum,
    slr.Sname,
    slr.City,
    slr.Comm
FROM dbo.Sellers slr,
     dbo.Customers cst
WHERE
    slr.Snum = cst.Snum
    AND cst.Rating = 300;
```
***
### 3. Напишите запрос использующий оператор `EXISTS` который выберет всех продавцов с заказчиками размещенными в их городах которые ими не обслуживаются.
```sql
SELECT
    slr.Snum,
    slr.Sname,
    slr.City,
    slr.Comm
FROM dbo.Sellers slr,
     dbo.Customers cst
WHERE
    slr.Snum = cst.Snum
    AND cst.Rating = 300;
```
***
### 4. Напишите запрос который извлекал бы из таблицы `Customers` каждого заказчика назначенного к продавцу который в данный момент имеет по крайней мере еще одного заказчика (кроме заказчика которого вы выберете) с заказами в таблице `Orders`.
```sql
SELECT *
FROM dbo.Customers cst
WHERE EXISTS
    (SELECT *
    FROM dbo.Sellers slr
    WHERE cst.Snum = slr.Snum
        AND 1 <=
            (SELECT COUNT(*)
            FROM dbo.Orders ord
            WHERE ord.Snum = slr.Snum
                AND ord.Cnum <> cst.Cnum));
```

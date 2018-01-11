# Вопросы
### 1. Напишите запрос который бы выбирал всех заказчиков чьи оценки равны или больше чем любая оценка заказчика `Serres`.
```sql
SELECT *
    FROM dbo.Customers
    WHERE Rating >= ALL
    (SELECT Rating
        FROM dbo.Customers
        WHERE Snum = 1002);
```
***
### 3. Напишите запрос использующий `ANY` или `ALL`, который бы находил всех продавцов которые не имеют никаких заказчиков размещенных в их городе.
```sql
SELECT *
    FROM dbo.Sellers otr
    WHERE City <> ALL
    (SELECT City
        FROM dbo.Customers inr
        WHERE inr.Snum = otr.Snum);
```
***
### 4. Напишите запрос который бы выбирал все заказы с суммой больше чем любая сумма для заказчиков в городе `London`.
```sql
SELECT *
    FROM dbo.Orders
    WHERE Amt > ALL
    (SELECT Amt
        FROM dbo.Orders odr, dbo.Customers cst
        WHERE odr.Cnum = cst.Cnum
            AND cst.City = 'London');
```
***
### 5. Напишите предыдущий запрос с использованием `MAX`.
```sql
SELECT *
    FROM dbo.Orders
    WHERE Amt >
    (SELECT MAX(Amt)
        FROM dbo.Orders odr, dbo.Customers cst
        WHERE odr.Cnum = cst.Cnum
            AND cst.City = 'London');
```

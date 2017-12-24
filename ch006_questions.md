# Вопросы
### 1. Напишите запрос который сосчитал бы все суммы заказов на 3 Октября. 
```sql
SELECT SUM(Amt)
FROM dbo.Orders
WHERE Odate = '03/10/1990';
```
***
### 2. Напишите запрос который сосчитал бы число различных не-`NULL` значений поля `City` в таблице `Customers`.
```sql
SELECT COUNT(DISTINCT City)
FROM dbo.Customers;
```
***
### 3. Напишите запрос который выбрал бы наименьшую сумму для каждого заказчика. 
```sql
SELECT Cnum, MIN(Amt)
FROM dbo.Orders
GROUP BY Cnum;
```
***
### 4. Напишите запрос который бы выбирал заказчиков в алфавитном порядке, чьи имена начинаются с буквы `G`.
```sql
SELECT Cname
FROM dbo.Customers
WHERE Cname LIKE 'G%'
ORDER BY Cname;
```
***
### 5. Напишите запрос который выбрал бы наибольшие комиссионные в каждом городе. 
```sql
SELECT City, MAX(Comm)
FROM dbo.Sellers
GROUP BY City;
```
***
### 6. Напишите запрос который сосчитал бы число заказчиков регистрирующих каждый день свои заказы. (Если продавец имел более одного порядка в данный день, он должен учитываться только один раз).
```sql
SELECT COUNT(DISTINCT Cnum), Odate
FROM dbo.Orders
GROUP BY Odate;
```
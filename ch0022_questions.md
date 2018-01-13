# Вопросы
### 1. Передайте Janet право на изменение оценки заказчика.
```sql
CREATE VIEW Jview
    AS SELECT Rating
    FROM dbo.Customers;
GO

GRANT UPDATE Jview TO Janet;
```
***
### 2. Передайте Stephan право передавать другим пользователям право делать запросы в таблице `Orders`.
```sql
GRANT SELECT dbo.Orders TO Stephan WITH GRANT OPTION;
```
***
### 3. Отнимите привилегию INSERT в таблице Продавцов у Claire и у всех пользователей которым она была предоставлена.
```sql
REVOKE INSERT dbo.Sellers FROM Claire;
```
***
### 4. Передайте Jerry право вставлять или модифицировать таблицу Заказчиков с сохранением его возможности оценивать значения в диапазоне от 100 до 500.
```sql
CREATE VIEW Jview
    AS SELECT *
    FROM dbo.Customers
        WHERE Rating BETWEEN 100 AND 500;
GO

GRANT INSERT, UPDATE ON Jview TO Jerry;
```
***
### 5. Разрешите Janet делать запросы к таблице заказчиков, но ограничьте видимые ему значения заказчиками с минимальным рейтингом.
```sql
CREATE VIEW Mincust
    AS SELECT *
    FROM dbo.Customers
        WHERE Rating =
            (SELECT MIN(Rating) FROM dbo.Customers);

GRANT SELECT ON Mincust TO Janet;
```

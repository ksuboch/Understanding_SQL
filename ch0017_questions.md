# Вопросы
### 1. Напишите предложение `CREATE TABLE` которое бы создало таблицу `Customers`.
```sql
CREATE TABLE dbo.Customers (
	Cnum   INT,
	Cname  VARCHAR(25),
	City   VARCHAR(25),
	Rating INT,
	Snum   INT
);
```
***
### 2. Напишите команду которая бы давала возможность пользователю быстро извлекать заказы сгруппированные по датам из таблицы `Orders`.
```sql
CREATE INDEX IDX_Orders_Odate ON dbo.Orders (Odate);
```
***
### 3. Если таблица `Orders` уже создана, как Вы можете заставить поле `onum` быть уникальным (если допустить что все текущие значения уникальны)?
```sql
CREATE UNIQUE INDEX IDX_Orders_Onum ON Orders (Onum);
```
***
### 4. Создайте индекс который бы разрешал каждому продавцу быстро отыскивать его заказы сгруппированные по датам.
```sql
CREATE INDEX IDX_Orders_Snum_Odate ON dbo.Orders (Snum, Odate);
```
***
### 5. Предположим, что каждый продавец имеет только одного заказчика с данной оценкой создайте индекс для быстрого извлечения этих данных.
```sql
CREATE INDEX IDX_Customers_Snum_Rating ON dbo.Customers (Snum, Rating);
```

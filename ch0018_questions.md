# Вопросы
### 1. Создайте таблицу `Orders` так чтобы все значения пол onum, а также все комбинации полей `Cnum` и `Snum` отличались друг от друга, и так что бы значения `NULL` исключались из поля даты.
```sql
CREATE TABLE dbo.Orders (
	Onum  INT  NOT NULL PRIMARY KEY,
	Amt   DECIMAL(12, 2),
	Odate DATE NOT NULL,
	Cnum  INT  NOT NULL,
	Snum  INT  NOT NULL
    UNIQUE(Cnum, Snum));
```
***
### 2. Создайте таблицу `Salesman` так чтобы комиссионные, по умолчанию, составляли 10%, не разрешались значения `NULL`, чтобы поле `Snum` являлось первичным ключом, и чтобы все имена были в алфавитном порядке между A и M включительно(учитывая, что все имена будут напечатаны в верхнем регистре).
```sql
CREATE TABLE dbo.Salesman (
    Snum  INT NOT NULL PRIMARY KEY,
    Sname VARCHAR(25) CHECK (Sname BETWEEN 'A' AND 'M') ,
    City  VARCHAR(25),
    Comm  DECIMAL(4, 2) NOT NULL DEFAULT .1);
```
***
### 3. Создайте таблицу `Orders`, будучи уверенными в том что поле `Onum` больше чем поле `Cnum`, а `Cnum` больше чем `Snum`. Запрещены значения `NULL` в любом из этих трех полей.
```sql
CREATE TABLE dbo.Orders (
	Onum  INT NOT NULL CHECK (Onum > Cnum),
	Amt   DECIMAL(12, 2),
	Odate DATE,
	Cnum  INT NOT NULL CHECK (Cnum > Snum),
	Snum  INT NOT NULL);
```

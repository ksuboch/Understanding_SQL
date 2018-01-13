# Вопросы.
### 1. Создайте таблицу с именем Cityorders. Она должна содержать такие же пол onum, amt, и snum что и таблица Порядков, и такие же пол cnum и city что и таблица Заказчиков, так что порядок каждого заказчика будет вводиться в эту таблицу вместе с его городом. Поле оnum будет первичным ключом Cityorders. Все пол в Cityorders должны иметь ограничения при сравнении с таблицами Заказчиков и Порядков. Допускается, что родительские ключи в этих таблицах уже имеют соответствующие ограничения.
```sql
CREATE TABLE Cityorders
    (onum  integer NOT NULL PRIMARY KEY,
     amt   decimal,
     cnum  integer,
     snum  integer,
     city  char (15),
     FOREIGN KEY (onum, amt, snum)
         REFERENCES Orders (onum, amt, snum),
     FOREIGN KEY (cnum, city)
         REFERENCES Customers (cnum, city));
```
***
### 2. Усложним проблему. Переопределите таблицу Порядков следующим образом: добавьте новый столбец с именем prev, который будет идентифицирован для каждого порядка, поле onum предыдущего порядка для этого текущего заказчика. Выполните это с использованием внешнего ключа ссылающегося на саму таблицу Порядков. Внешний ключ должен ссылаться также на поле cnum заказчика, обеспечивающего определенную предписанную связь между текущим порядком и ссылаемым.
```sql
CREATE TABLE Orders
    (onum  integer NOT NULL,
     amt   decimal,
     odate date,
     cnum  integer NOT NULL,
     snum  integer,
     prev  integer,
     UNIQUE (cnum, onum),
     FOREIGN KEY (cnum, prev) REFERENCES Orders (cnum,onum));
```

# Database Administration - Task7

##Part 1
***
___Exercise 1.___ _Download MySQL server for your OS on VM._
***
___Exercise 2.___ _Install MySQL server on VM._

![MySQL_status](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m6/task6/screenshots_for_task6/001_mysql_status.jpg)
***
___Exercise 3.___ _Select a subject area and describe the database schema, (minimum 3 tables)._
***
___Exercise 4.___ _Create a database on the server through the console._

![Created_Database_and_tables](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m6/task6/screenshots_for_task6/002_database_tables.jpg)
***
___Exercise 5.___ _Fill in tables._

```
mysql> CREATE TABLE Ukraine (
    -> id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> City CHAR(100) NOT NULL,
    -> Year INT NOT NULL,
    -> Population INT NOT NULL
    -> );
mysql> INSERT INTO Ukraine (City,Year,Population) VALUES("Kharkiv","1654","1419000");
mysql> INSERT INTO Ukraine (City,Year,Population) VALUES("Kyiv","930","2884000");
mysql> INSERT INTO Ukraine (City,Year,Population) VALUES("Lviv","1256","721301");
mysql>
mysql>
mysql> CREATE TABLE Poland (
    -> id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> City CHAR(100) NOT NULL,
    -> Year INT NOT NULL,
    -> Population INT NOT NULL
    -> );
mysql> INSERT INTO Poland (City,Year,Population) VALUES("Warsaw","1200","1765000");
mysql> INSERT INTO Poland (City,Year,Population) VALUES("Krakow","1257","766783");
mysql> INSERT INTO Poland (City,Year,Population) VALUES("Lodz","1423","696708");
...
...
...
```
***
___Exercise 6.___ _Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY._

```
mysql> select * from Ukraine where Year < 1000;
+----+------+------+------------+
| id | City | Year | Population |
+----+------+------+------------+
|  2 | Kyiv |  930 |    2884000 |
+----+------+------+------------+
1 row in set (0.00 sec)

mysql>
mysql>
mysql> select City from Ukraine group by City;
+---------+
| City    |
+---------+
| Kharkiv |
| Kyiv    |
| Lviv    |
+---------+
3 rows in set (0.00 sec)

mysql>
mysql>
mysql> select * from Ukraine order by Year;
+----+---------+------+------------+
| id | City    | Year | Population |
+----+---------+------+------------+
|  2 | Kyiv    |  930 |    2884000 |
|  3 | Lviv    | 1256 |     721301 |
|  1 | Kharkiv | 1654 |    1419000 |
+----+---------+------+------------+
3 rows in set (0.00 sec)

mysql>
```
***
___Exercise 7.___ _Execute other different SQL queries DDL, DML, DCL._

DDL команды:
```
mysql> CREATE DATABASE books;
mysql> DROP database books;
mysql> ALTER TABLE Ukraine ADD COLUMN Square INT NULL AFTER Population;
mysql> ALTER TABLE Ukraine DROP COLUMN Square;
mysql> truncate table mytable;
```
DML команды:
```
mysql> INSERT INTO Ukraine (City, Year, Population) VALUES ('Odessa', 1794, 993120);
mysql> select * from Ukraine;
+----+---------+------+------------+
| id | City    | Year | Population |
+----+---------+------+------------+
|  1 | Kharkiv | 1654 |    1419000 |
|  2 | Kyiv    |  930 |    2884000 |
|  3 | Lviv    | 1256 |     721301 |
|  4 | Odessa  | 1794 |     993120 |
+----+---------+------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> UPDATE Ukraine set Population = Population + 10 where City = 'Kyiv';
mysql> select * from Ukraine;
+----+---------+------+------------+
| id | City    | Year | Population |
+----+---------+------+------------+
|  1 | Kharkiv | 1654 |    1419000 |
|  2 | Kyiv    |  930 |    2884010 |
|  3 | Lviv    | 1256 |     721301 |
|  4 | Odessa  | 1794 |     993120 |
+----+---------+------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> DELETE from Ukraine where City = 'Odessa';
Query OK, 1 row affected (0.00 sec)

mysql> select * from Ukraine;
+----+---------+------+------------+
| id | City    | Year | Population |
+----+---------+------+------------+
|  1 | Kharkiv | 1654 |    1419000 |
|  2 | Kyiv    |  930 |    2884010 |
|  3 | Lviv    | 1256 |     721301 |
+----+---------+------+------------+
3 rows in set (0.00 sec)

mysql>
```
DCL команды:
```
mysql> grant select on countries.Ukraine to 'slava'@'localhost';
mysql> show grants for 'slava'@'localhost';
+-------------------------------------------+
| Grants for slava@localhost                |
+-------------------------------------------+
| GRANT USAGE ON *.* TO `slava`@`localhost` |
+-------------------------------------------+
1 row in set (0.00 sec)

mysql>
mysql> grant select on countries.Ukraine to 'slava'@'localhost';
mysql> show grants for 'slava'@'localhost';
+--------------------------------------------------------------+
| Grants for slava@localhost                                   |
+--------------------------------------------------------------+
| GRANT USAGE ON *.* TO `slava`@`localhost`                    |
| GRANT SELECT ON `countries`.`Ukraine` TO `slava`@`localhost` |
+--------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql>
mysql> revoke select on countries.Ukraine from 'slava'@'localhost';
mysql> show grants for 'slava'@'localhost';
+-------------------------------------------+
| Grants for slava@localhost                |
+-------------------------------------------+
| GRANT USAGE ON *.* TO `slava`@`localhost` |
+-------------------------------------------+
1 row in set (0.00 sec)

mysql>
mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> drop user 'slava'@'localhost';
```
***
___Exercise 8.___ _Create a database of new users with different privileges. Connect to the
database as a new user and verify that the privileges allow or deny certain
actions._

```
mysql> CREATE USER 'slava'@'localhost' IDENTIFIED BY 'parol';
mysql> show grants for 'slava'@'localhost';
+-------------------------------------------+
| Grants for slava@localhost                |
+-------------------------------------------+
| GRANT USAGE ON *.* TO `slava`@`localhost` |
+-------------------------------------------+
1 row in set (0.00 sec)

mysql>
mysql> GRANT SELECT ON countries.Ukraine to 'slava'@'localhost';
mysql> show grants for 'slava'@'localhost';
+--------------------------------------------------------------+
| Grants for slava@localhost                                   |
+--------------------------------------------------------------+
| GRANT USAGE ON *.* TO `slava`@`localhost`                    |
| GRANT SELECT ON `countries`.`Ukraine` TO `slava`@`localhost` |
+--------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> exit
slava@ubnvm1:~$ sudo mysql -u slava -p
Enter password:
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| countries          |
| information_schema |
+--------------------+
2 rows in set (0.00 sec)

mysql> use countries;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_countries |
+---------------------+
| Ukraine             |
+---------------------+
1 row in set (0.00 sec)

mysql> select * from Ukraine;
+----+---------+------+------------+
| id | City    | Year | Population |
+----+---------+------+------------+
|  1 | Kharkiv | 1654 |    1419000 |
|  2 | Kyiv    |  930 |    2884010 |
|  3 | Lviv    | 1256 |     721301 |
+----+---------+------+------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Ukraine (City, Year, Population) VALUES ('Odessa', 1794, 993120);
ERROR 1142 (42000): INSERT command denied to user 'slava'@'localhost' for table 'Ukraine'
mysql> exit
slava@ubnvm1:~$ sudo mysql -u root
mysql> create user 'test'@'localhost' identified by 'password';
Query OK, 0 rows affected (0.02 sec)

mysql> exist
slava@ubnvm1:~$ sudo mysql -u test -p
Enter password:
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
+--------------------+
1 row in set (0.04 sec)
mysql> exist
slava@ubnvm1:~$ sudo mysql -u root -p
mysql> select User from mysql.user;
+------------------+
| User             |
+------------------+
| debian-sys-maint |
| mysql.infoschema |
| mysql.session    |
| mysql.sys        |
| root             |
| slava            |
| test             |
+------------------+
7 rows in set (0.00 sec)
```
***
___Exercise 9.___ _Make a selection from the main table DB MySQL._

```
slava@ubnvm1:~$ sudo mysql -u root
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select Host, Db, User, Select_priv, Show_view_priv from db;
+-----------+--------------------+---------------+-------------+----------------+
| Host      | Db                 | User          | Select_priv | Show_view_priv |
+-----------+--------------------+---------------+-------------+----------------+
| localhost | performance_schema | mysql.session | Y           | N              |
| localhost | sys                | mysql.sys     | N           | N              |
+-----------+--------------------+---------------+-------------+----------------+
2 rows in set (0.00 sec)

mysql>
```

##Part 2
***
___Exercise 10.___ _Make backup of your database._

```
slava@ubnvm1:~$ sudo mysqldump -u root -p countries >countries01.sql
Enter password:
slava@ubnvm1:~$
```
***
___Exercise 11.___ _Delete the table and/or part of the data in the table._

```
slava@ubnvm1:~$ sudo mysql -u root
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| books              |
| countries          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> drop database countries;
Query OK, 4 rows affected (0.05 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| books              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)
```
***
___Exercise 12.___ _Restore your database._
```
mysql> create database countries;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| books              |
| countries          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use countries;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> exit
Bye
slava@ubnvm1:~$ sudo mysql -u root -p countries <countries01.sql
Enter password:
slava@ubnvm1:~$ sudo mysql -u root
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| books              |
| countries          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use countries;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------------+
| Tables_in_countries |
+---------------------+
| Germany             |
| Poland              |
| Ukraine             |
| United_Kingdom      |
+---------------------+
4 rows in set (0.00 sec)

mysql> select * from Germany;
+----+---------+------+------------+
| id | City    | Year | Population |
+----+---------+------+------------+
|  1 | Berlin  | 1237 |    3664088 |
|  2 | Hamburg | 1189 |    1852478 |
|  3 | Munich  | 1158 |    1488202 |
+----+---------+------+------------+
3 rows in set (0.00 sec)

mysql>
```
***
___Exercise 13.___ _Transfer your local database to RDS AWS._

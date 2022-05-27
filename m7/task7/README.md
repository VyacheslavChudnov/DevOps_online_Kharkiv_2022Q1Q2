# Database Administration - Task7

## Part 1
***
___Exercise 1.___ _Download MySQL server for your OS on VM._

For the Ubuntu virtual machine run the command:
```
$ sudo apt-get install mysql-server
```
***
___Exercise 2.___ _Install MySQL server on VM._

![MySQL_status](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m7/task7/screenshots_for_task7/001_mysql_status.jpg)
***
___Exercise 3.___ _Select a subject area and describe the database schema, (minimum 3 tables)._

Choose theme "Countries". Three countries with three cities each.
***
___Exercise 4.___ _Create a database on the server through the console._

![Created_Database_and_tables](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m7/task7/screenshots_for_task7/002_database_tables.jpg)
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

## Part 2
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

Creating RDS AWS, connection and transfer local database to RDS AWS:

![AWS_RDS](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m7/task7/screenshots_for_task7/003_create_awsrds.jpg)

Connection to RDS AWS and creating empty database **countries**:
```
slava@ubnvm1:~$ mysql -u main -p -h mysql-db.cvjgafuhick4.eu-central-1.rds.amazonaws.com
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22
Server version: 8.0.28 Source distribution

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| slava              |
| sys                |
+--------------------+
5 rows in set (0.08 sec)

mysql> create database countries;
Query OK, 1 row affected (0.23 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| countries          |
| information_schema |
| mysql              |
| performance_schema |
| slava              |
| sys                |
+--------------------+
6 rows in set (0.05 sec)

mysql> use countries;
Database changed
mysql> show tables;
Empty set (0.04 sec)

mysql> exit
Bye
```
Transfer your local database to RDS AWS:
```
slava@ubnvm1:~$ sudo mysql -u main -p -h mysql-db.cvjgafuhick4.eu-central-1.rds.amazonaws.com countries <countries01.sql
Enter password:
```
***
___Exercise 14.___ _Connect to your database._

```
slava@ubnvm1:~$ mysql -u main -p -h mysql-db.cvjgafuhick4.eu-central-1.rds.amazonaws.com
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 26
Server version: 8.0.28 Source distribution

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| countries          |
| information_schema |
| mysql              |
| performance_schema |
| slava              |
| sys                |
+--------------------+
6 rows in set (0.28 sec)

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
4 rows in set (0.05 sec)
```
***
___Exercise 15.___ _Execute SELECT operator similar step 6._

```
mysql> select * from Ukraine;
+----+---------+------+------------+
| id | City    | Year | Population |
+----+---------+------+------------+
|  1 | Kharkiv | 1654 |    1419000 |
|  2 | Kyiv    |  930 |    2884010 |
|  3 | Lviv    | 1256 |     721301 |
+----+---------+------+------------+
3 rows in set (0.06 sec)

mysql> exit
Bye
```
***
___Exercise 16.___ _Create the dump of your database._

```
slava@ubnvm1:~$ mysqldump -u main -p -h mysql-db.cvjgafuhick4.eu-central-1.rds.amazonaws.com countries >countries_awsrds.sql
Enter password:
Warning: A partial dump from a server that has GTIDs will by default include the GTIDs of all transactions, even those that changed
suppressed parts of the database. If you don't want to restore GTIDs, pass --set-gtid-purged=OFF. To make a complete dump, pass --all-databases --triggers --routines --events.
slava@ubnvm1:~$ mysqldump -u main -p -h mysql-db.cvjgafuhick4.eu-central-1.rds.amazonaws.com --all-databases  >all_awsrds.sql
Enter password:
Warning: A partial dump from a server that has GTIDs will by default include the GTIDs of all transactions, even those that changed 
suppressed parts of the database. If you don't want to restore GTIDs, pass --set-gtid-purged=OFF. To make a complete dump, pass --all-databases --triggers --routines --events.
slava@ubnvm1:~$
```
***
## Part 3

___MongoDB___

Install MongoDB on Ubuntu https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

Verify that MongoDB has started successfully:
```
slava@ubnvm1:~$ sudo systemctl status mongod
● mongod.service - MongoDB Database Server
Loaded: loaded (/lib/systemd/system/mongod.service; disabled; vendor preset: enabled)
Active: active (running) since Sat 2022-05-14 15:23:19 EEST; 1min 57s ago
Docs: https://docs.mongodb.org/manual
Main PID: 7089 (mongod)
Memory: 108.6M
CPU: 3.506s
CGroup: /system.slice/mongod.service
└─7089 /usr/bin/mongod --config /etc/mongod.conf

May 14 15:23:19 ubnvm1 systemd[1]: Started MongoDB Database Server.
slava@ubnvm1:~$
```
___Exercise 17.___ _Create a database. Use the use command to connect to a new database (If it
doesn't exist, Mongo will create it when you write to it)._

```
> show databases;
admin   0.000GB
config  0.000GB
local   0.000GB
> use test;
switched to db test
>
```
***
___Exercise 18.___ _Create a collection. Use db.createCollection to create a collection.
I'll leave the subject up to you. Run show dbs and show collections to view your database and collections._

```
> db.createCollection("users");
{ "ok" : 1 }
> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB
test    0.000GB
> show collections;
users
>
```
***
___Exercise 19.___ _Create some documents. Insert a couple of documents into your collection.
I'll leave the subject matter up to you, perhaps cars or hats._

```
> db.users.insertOne({name: "John", age: 30});
{
        "acknowledged" : true,
        "insertedId" : ObjectId("627fa9935f1ce26db42506de")
}
>
>
> db.users.insertOne({name: "Smith", age: 33});
{
        "acknowledged" : true,
        "insertedId" : ObjectId("627fa9be5f1ce26db42506df")
}
>
>
> db.users.insertOne({name: "Henry", age: 40});
{
        "acknowledged" : true,
        "insertedId" : ObjectId("627fa9f85f1ce26db42506e0")
}
>
```
***
___Exercise 20.___ _Use find() to list documents out._

```
> db.users.find();
{ "_id" : ObjectId("627fa9935f1ce26db42506de"), "name" : "John", "age" : 30 }
{ "_id" : ObjectId("627fa9be5f1ce26db42506df"), "name" : "Smith", "age" : 33 }
{ "_id" : ObjectId("627fa9f85f1ce26db42506e0"), "name" : "Henry", "age" : 40 }
>
```
***
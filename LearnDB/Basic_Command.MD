# SQL Basic Commands:

### Database Creation & Deletion

_Create Database:_ `CREATE DATABASE db_name` || `CREATE DATABASE IF NOT EXISTS db_name`</br>

_Drop Database:_ `DROP DATABASE db_name` || `DROP DATABASE IF NOT EXISTS db_name`</br>

_Show Databases:_ `SHOW DATABASES`

_Show Table:_ `SHOW TABLE`

### Table Creation

_Use Database:_ `USE db_name`</br>

_Table Creation:_

```
CREATE TABLE Persons (
  PersonID int PRIMARY KEY,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255),
  Address varchar(255),
  City varchar(255)
);
```

_Select table:_ `SELECT * FROM table_name`

_Insert Into Table:_

```
INSERT INTO Persons (PersonID, LastName, FirstName, Address, City)
VALUES (1, "Jhon", "Dohe", "6 Street", "UK");
```

### SQL Data Types

![screenshot](./assets/data-types.png)

_Signed Datatype (+ve, -ve):_ -128 to 128

_Unsigned Datatype (+ve):_ 0 to 255

_DDL - Data Definition Language:_ `CREATE, DROP, ALTER, TRUNCATE, COMMENT, RENAME`

_DQL - Data Query Language:_ `SELECT, FROM, WHERE, GROUP BY, HAVING, DISTINCT, ORDER BY, LIMIT`

_DML - Data Manipulation Language:_ `INSERT, UPDATE, DELETE`

_DCL - Data Control Language:_ `GRANT, REVOKE`

_TCL - Transaction Control Language:_ `BEGIN TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT`

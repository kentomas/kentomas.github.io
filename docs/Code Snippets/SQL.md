# SQL

## And

```sql
SELECT * FROM Customers
WHERE Country='Germany' AND CustomerID=1;
```

## Average

- NULL values are ignored.

```sql
SELECT AVG(Price)
FROM Products;
```

## BETWEEN

The following SQL statement selects all orders with an OrderDate between '01-July-1996' and '31-July-1996':

```sql
SELECT * FROM Orders
WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;
```

```sql
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';
```

## Count

```sql
SELECT COUNT(ProductID)
FROM Products;
```

## Delete

```sql
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
```

```sql
-- The following SQL statement deletes all rows in the "Customers" table, without deleting the table:
DELETE FROM Customers;
```

## Distinct

Retreive unique rows.

This query will retrieve all unique values in the column_name column from the table_name table.

```sql
SELECT DISTINCT column_name
FROM table_name;
```

## IN

```sql
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
```

```sql
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);
```

## JOIN

![innter-join.png](https://www.w3schools.com/sql/img_innerjoin.gif)
![left-join.png](https://www.w3schools.com/sql/img_leftjoin.gif)
![right-join.png](https://www.w3schools.com/sql/img_rightjoin.gif)
![full-join.png](https://www.w3schools.com/sql/img_fulljoin.gif)

### Inner Join

```sql
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
```

### Left Join

```sql
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
```

### Right Join

```sql
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
```

### Full Join

```sql
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
```

## LIKE

The following SQL statement selects all customers with a CustomerName that have "or" in any position:

```sql
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';
```

```sql
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';
```

The following SQL statement selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length:

```sql
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';
```

## Max

```sql
SELECT MAX(Price) AS LargestPrice
FROM Products;
```

## Min

```sql
SELECT MIN(Price) AS SmallestPrice
FROM Products;
```

## NOT

```sql
SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';
```

## NULL

```sql
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;
```

```sql
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;
```

## OR

```sql
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';
```

## SUM

```sql
SELECT SUM(Quantity)
FROM OrderDetails;
```

## TOP

```sql
SELECT TOP 3 * FROM Customers;
```

```sql
SELECT TOP 50 PERCENT * FROM Customers;
```

## Update

```sql
UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';
```

## Where

```sql
SELECT * FROM Customers
WHERE Country='Mexico';
```

```sql
SELECT * FROM Customers
WHERE CustomerID=1;
```

## References

- <https://www.w3schools.com/sql/default.asp>

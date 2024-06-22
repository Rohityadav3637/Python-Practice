--SQL subqueries 

--Definition:
--A subquery is a query nested inside another query such as SELECT, INSERT, UPDATE, or DELETE. It can also be nested inside another subquery.


1. Single-row Subquery:
Definition: Returns only one row from the inner query.
Syntax:
```sql
SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE column_name OPERATOR
   (SELECT column_name [, column_name ]
   FROM table1 [, table2 ]
   [WHERE])
```

2. Multiple-row Subquery:
Definition: Returns multiple rows from the inner query.
Syntax:
```sql
SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE column_name OPERATOR
   (SELECT column_name [, column_name ]
   FROM table1 [, table2 ]
   [WHERE])
```

3. Correlated Subquery:
Definition: References columns from the outer query.
Syntax:
```sql
SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE column_name OPERATOR
   (SELECT column_name [, column_name ]
   FROM table1 [, table2 ]
   WHERE table1.column = table2.column)
```

4. Nested Subquery:
Definition: A subquery within another subquery.
Syntax:
```sql
SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE column_name OPERATOR
   (SELECT column_name
   FROM table1 [, table2 ]
   WHERE column_name OPERATOR
      (SELECT column_name
      FROM table1 [, table2 ]
      WHERE condition))
```

5. Subquery in SELECT clause:
Definition: Used to return a single value in the SELECT statement.
Syntax:
```sql
SELECT column_name,
   (SELECT column_name
   FROM table_name
   WHERE condition) AS alias
FROM table_name
```

6. Subquery with IN:
Definition: Checks if a value matches any value in a list of results.
Syntax:
```sql
SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE column_name IN
   (SELECT column_name
   FROM table_name
   WHERE condition)
```

7. Subquery with EXISTS:
Definition: Checks for the existence of rows that satisfy a subquery.
Syntax:
```sql
SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE EXISTS
   (SELECT column_name
   FROM table_name
   WHERE condition)
```

8. Subquery in FROM clause:
Definition: Uses a subquery as a derived table.
Syntax:
```sql
SELECT column_name [, column_name ]
FROM (SELECT column_name
      FROM table_name
      WHERE condition) AS derived_table_name
WHERE condition
```


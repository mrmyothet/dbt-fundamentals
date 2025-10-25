# Section 1: SQL Basics

## What is SQL?
SQL (Structured Query Language) is a language used to access, manipulate, and analyze data stored in relational databases.

### SELECT
Retrieves specific columns of data from a table.

### FROM
Specifies the table(s) you’re querying data from.

### WHERE
Filters rows based on specific conditions.

### Comparison Operators (`=`, `!=`, `<`, `>`, `LIKE`)
Used in `WHERE` clauses to compare values. For example, `LIKE` helps match patterns in text.

### Logical Operators (`AND`, `OR`, `NOT`)
Combine multiple conditions in a `WHERE` clause for more precise filtering.

### NULLs
Represent missing or unknown values. `IS NULL` and `IS NOT NULL` help check for these.

### ORDER BY
Sorts the results of your query in ascending or descending order based on one or more columns.

---

# Section 2: Transformations

### Aggregates (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
Perform calculations across multiple rows to summarize data.

### Data Types and Casting
Every column has a data type (like integer, string, or date). Casting lets you convert between types using functions like `CAST()` or `::`.

### GROUP BY
Groups rows that have the same values in specified columns so you can apply aggregate functions to each group.

### CASE WHEN
Adds conditional logic to your queries, similar to if-else statements. Useful for creating new columns or categories based on existing data.

---

# Section 3: Joins

### INNER JOIN
Returns only the rows where there is a match in both tables.

### LEFT JOIN
Returns all rows from the left table and the matching rows from the right table. Rows in the left table without matches will still appear, with `NULL`s for the right-side columns.

### RIGHT JOIN
The opposite of a left join. Returns all rows from the right table and matching rows from the left.

### FULL OUTER JOIN
Returns all rows from both tables, with `NULL`s where there are no matches.
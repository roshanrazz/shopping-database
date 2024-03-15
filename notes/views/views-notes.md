# Views

## View:

**View** is a virtual table that is dynamically generated based on the result of a SELECT query. Unlike a regular table, a view does not store data itself; instead, it is a saved query that can be treated like a table in subsequent queries. Views can be useful for simplifying complex queries, encapsulating business logic, and providing a layer of abstraction over the underlying data. Views does not take storage in disk as of table. Views are the result of a stored query.

Example:
    ```CREATE VIEW
       products_view
       AS
       SELECT product_name, price, stock_quantity
       FROM
       products
       WHERE
       stock_quantity > 0;
    ```

## Advantages:

1. **Simplified Querying**: Views allow you to encapsulate complex SQL queries into a single virtual table. This simplifies the querying process, as you can now query the view instead of writing the complex query each time.

2. **Data Abstraction**: Views provide a layer of abstraction over the underlying tables. This means you can hide the complexity of the database schema from users by presenting a simplified view of the data.

3. **Security**: Views can be used to restrict access to certain columns or rows of a table. By creating views with specific column selections or filtering conditions, you can control what data users are allowed to access.

4. **Performance Optimization**: Views can improve performance by precomputing and caching the results of complex queries. Instead of recalculating the result set every time the view is queried, MySQL can retrieve the cached results, reducing query execution time.

5. **Consistency and Maintainability**: Views provide a way to define common data access patterns centrally. This promotes consistency in data retrieval logic across different parts of an application and simplifies maintenance, as changes to the underlying query can be made in one place.

## Types:

1. **Read-only views**: Read-only views are views that do not allow DML operations (INSERT, UPDATE, DELETE) to be performed directly on them. They are useful for providing a read-only perspective on the data and enforcing data access restrictions.

2. **Updatable views**: Updatable views allow you to perform DML operations (INSERT, UPDATE, DELETE) directly on the view itself, which in turn affects the underlying tables. Not all views are updatable; they must meet certain criteria, such as having a single base table and not containing certain constructs like subqueries or aggregate functions.Here are the general guidelines for creating an updatable view in MySQL:

    - **Single Table:** The view should be based on a single table. Views that are based on multiple tables, subqueries, or certain constructs like JOINs or GROUP BY clauses are typically not updatable.

    - **No Aggregations**: The view should not contain aggregate functions like SUM(), COUNT(), AVG(), etc. Aggregate functions imply a summary of multiple rows, making it ambiguous for MySQL to determine how to perform updates.

    - **No DISTINCT**: Avoid using the DISTINCT keyword in the view definition.

    - **No UNION**: Avoid using the UNION operator in the view definition.

    - **No Subqueries**: Avoid using subqueries in the view definition.

    - **No Derived Tables**: Avoid using derived tables (subqueries in the FROM clause) in the view definition.
# Database Optimization Techniques

1.  **Indexing**: Properly indexing tables can significantly improve query performance by allowing the database engine to quickly locate rows. However, over-indexing can lead to increased overhead during data modifications, so it's essential to strike a balance. Index can be clustered or non-clustered.
    > **Clustered index** is created automatically by primary key. It is like dictionary and no extra storage is used. Faster compared to non-clusterd index.

    > **Non-clustered index**: We can create non-clustered index according to our needs. It is like index page of books. It uses disk space and is slower compared to clustered index.
    
    > *Note*: Over indexing can degrade performance of database.


2.  **Query Optimization**: Writing efficient queries by avoiding unnecessary joins, using appropriate WHERE clauses, and limiting the amount of data retrieved improves query optimization. Use joins instead of sub queries also improves performance of database.
Always use *Limit* with query to avoid showing unnecessary huge data. *Select* only columns you need instead of *selecting all*.


3.  **Normalization and Denormalization**: Normalization is the process of organizing the data in a database to reduce redundancy and dependency. This not only saves storage space but also improves data integrity and reduces update anomalies. Normalization reduces redundancy in data by breaking it into smaller tables.

    While normalization is essential for data integrity, denormalization can be used strategically to improve query performance by reducing the need for joins and simplifying data retrieval in certain scenarios. Denormalization consolidates data for faster retrieval. The choice between them depends on the specific use case.


4.  **Partitioning**: Partition large tables into smaller tables, more manageable chunks based on certain criteria (e.g., we can use date ranges for splitting tables into smaller ones). This can improve query performance and make data maintenance tasks more efficient.


5.  **Hardware Optimization**: Make sure database server has sufficient resources likeCPU, memory, storage to handle the workload more efficiently. Also, consider using solid-state drives (SSDs) for faster data access.


6.  **Caching**: Implement caching mechanisms to store frequently accessed data in memory, reducing the need for repeated database queries. Caching is used by ORM framework also like Hibernate for Java. caching mechanism cache data temporarly which means if same query is hit again and again, then instead of hitting the database for data, it uses the cached data earlier which improves database performance.


7.  **Regular Maintenance**: Perform routine tasks such as index reorganization, database statistics updates, and data purging to keep the database running smoothly.


8.  **Database Sharding**: Distribute data across multiple servers (shards) based on a predefined rule. This horizontal partitioning strategy can improve scalability and performance for large-scale applications.


9.  **Query Analysis and Profiling**: Use database profiling tools to identify slow queries and bottlenecks, then optimize them accordingly. eg: in mysql
```
    SET profiling = 1;
    SELECT * FROM products WHERE price > 599 AND price < 1399;
    SHOW PROFILES;
    SHOW PROFILE FOR QUERY 30;
```


10. **Connection Pooling**: Reuse database connections instead of establishing a new connection for each request, which can reduce overhead and improve performance, especially in web applications. Reusing connections from the pool can significantly improve application performance, especially in scenarios with high concurrency or frequent database interactions. It helps reduce the time spent on connection establishment and teardown, leading to faster response times and better overall throughput. eg. in java jdbc

    ```jdbc:mysql://localhost:3306/mydatabase?autoReconnect=true&useSSL=false&maxPoolSize=20```

    In this example, maxPoolSize sets the maximum number of connections in the pool as 20.


11. **Vertical Scaling vs. Horizontal Scaling**: Vertical scaling involves increasing the resources of a single server, such as CPU, memory, or storage capacity, to handle increased loads. It is also called scaling up (adding more resources to the existing server).

    *Horizontal scaling* involves distributing the workload across multiple servers or nodes to improve scalability and fault tolerance. It is also called scaling out (adding more servers to distribute the workload). Both of these methods helps in optimization of database.

12. **Compression**: Implement data compression techniques to reduce storage requirements and improve I/O performance, especially for large datasets.


13. **Regular Backups and Disaster Recovery Planning**: Ensure that you have a robust backup strategy in place to protect against data loss and have a plan for recovering data in case of emergencies.


14. **Database Monitoring**: Monitor database performance metrics such as CPU usage, memory utilization, and disk I/O to proactively identify and address performance issues.

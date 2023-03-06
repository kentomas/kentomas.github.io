# Spring Repositories

## CRUD vs JPA Repository

In Java Spring, `JpaRepository` and `CrudRepository` are both interfaces that provide basic database operations like creating, reading, updating, and deleting (CRUD) entities.

However, `JpaRepository` extends `CrudRepository` and adds additional features like paging and sorting. So, you should use JpaRepository when you need these additional features, for example, when you have a large amount of data and you want to retrieve it in small chunks using pagination or sort the results.

Another reason to use `JpaRepository` is when you want to use query methods. `JpaRepository` provides a set of predefined query methods that you can use to retrieve entities based on specific criteria. If you need more complex queries, you can also define your own custom query methods.

In summary, you should use `JpaRepository` over `CrudRepository` when you need additional features like pagination, sorting, or query methods, or if you want to define your own custom query methods. If you only need the basic CRUD operations, then `CrudRepository` should suffice.

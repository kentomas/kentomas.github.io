# Spring Boot

## Model-View-Controller

In Java Spring Boot, a web application is typically structured using the Model-View-Controller (MVC) architecture pattern. Here are the differences between the main components of a Spring Boot web application:

- `Controller`:
    - A controller is responsible for `handling HTTP requests` and `returning an HTTP response`.
    - It typically maps a URL to a method and contains business logic related to handling the request.
    - Controllers are the entry point to your web application and interact with both services and views.
- `Service`:
    - A service is a layer that `contains` the `business logic` of your application.
    - It performs operations such as validation, data manipulation, and communication with other services or data sources.
    - The service layer is typically used to isolate the business logic from the controller and the persistence layer.
- `Repository`:
    - A repository is `responsible for accessing data` from a data source, such as a database, and returning it to the service layer.
    - The repository layer abstracts away the details of data access and provides a simple interface for the service layer to use.
- `Entity`:
    - An entity represents a `business object` in your application.
    - It typically maps to a database table and contains fields and methods that represent the data and behavior of the object.
    - Entities are used to represent data that is stored in the database.

In summary, the controller is responsible for handling HTTP requests and returning responses, the service contains the business logic, the repository is responsible for data access, and the entity represents a business object.

## Entity

In Java Spring Boot, an entity is a class that represents a persistent object or a table in a database. Entities are typically used in object-relational mapping (ORM) frameworks like Hibernate to map the database tables to Java classes.

In Spring Boot, entities are typically defined as Java classes annotated with the @Entity annotation, which indicates that the class is a persistent entity. The class typically contains fields that map to columns in the database table, as well as getter and setter methods for accessing and modifying the data.

For example, if you have a `users` table in your database, you could define a User entity class that maps to that table. Here's an example:

```java
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private String email;
    
    // getter and setter methods
}
```

In this example:

- The `@Entity` annotation indicates that this class is a persistent entity.
- The `@Table` annotation specifies the name of the database table that this entity maps to.
- The `@Id` annotation indicates that the id field is the primary key for this entity.
- The `@GeneratedValue` annotation specifies that the primary key should be generated automatically.
    - The `GenerationType.AUTO` `strategy` indicates that the persistence provider should automatically choose an appropriate strategy based on the underlying database.
    - When you use `GenerationType.AUTO`, the persistence provider (usually Hibernate) will choose a primary key generation strategy based on the database you are using.
        - If you are using `MySQL`, Hibernate will use the `IDENTITY` `strategy`, which relies on an auto-incrementing column to generate primary key values.
        - If you are using `PostgreSQL`, Hibernate will use the `SEQUENCE` `strategy`, which relies on a sequence to generate primary key values.
        - Using `GenerationType.AUTO` is convenient because it allows you to write database-independent code that will work with different databases.
- The `name` and `email` fields map to columns in the users table.

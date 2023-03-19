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

## Controllers

- Both `@Controller` and `@RestController` are used to indicate that a particular class is a controller in a Spring Boot application.
- However, the main difference between the two annotations is that `@RestController` is a convenience annotation that combines `@Controller` and `@ResponseBody`.
- This means that if you annotate a class with `@RestController`, all of its methods will return the response directly in the form of JSON, XML, or any other format that is specified by the HTTP request.
- On the other hand, if you use `@Controller`, you need to explicitly annotate the methods with `@ResponseBody` to return the response in the desired format.
- Therefore, if you are building an API that returns data in JSON or XML format, it is recommended to use @RestController. If you are building a more traditional web application that returns HTML views, you can use @Controller.

In summary, use `@RestController` for building APIs that return data, and `@Controller` for building web applications that return `views`.

## Scopes

In Spring, a scope defines the lifecycle of a bean, i.e., how long the bean will live and how many instances of that bean will be created. Spring provides several built-in scopes, each with its own characteristics and use cases. Here are the most commonly used scopes:

1. `Singleton`: This is the default scope in Spring. Only one instance of the bean is created and shared throughout the application. Use this scope when you want to share the same object across the application.
2. `Prototype`: A new instance of the bean is created every time it is requested. Use this scope when you want to create a new object for each request.
3. `Request`: A new instance of the bean is created for each HTTP request. Use this scope when you want to create a new object for each HTTP request.
4. `Session`: A new instance of the bean is created for each HTTP session. Use this scope when you want to create a new object for each user session.
5. `Global Session`: This scope is used in a `Portlet` context. A single instance of the bean is created for each `Portlet` application. Use this scope when you want to create a new object for each `Portlet` application.
6. `Application`: A single instance of the bean is created for each `ServletContext`. Use this scope when you want to create a single object for each `ServletContext`.
7. `WebSocket`: A single instance of the bean is created for each WebSocket connection. Use this scope when you want to create a single object for each WebSocket connection.

The choice of scope depends on the specific requirements of your application. For example, if you have a stateless service that can be shared across the application, you may use the Singleton scope. However, if you have a stateful service that requires a new instance for each request, you may use the Prototype scope. Similarly, if you have a web application and want to store user-specific data, you may use the Session scope.

### Singleton

```java
import org.springframework.stereotype.Component;

@Component // singleton scope is the default
public class SingletonBean {
  public SingletonBean() {
    System.out.println("Creating a new instance of SingletonBean");
  }
}
```

In this example, SingletonBean is annotated with @Component, which means that it has the singleton scope by default. When Spring starts up, it will create a single instance of SingletonBean and reuse that instance throughout the lifetime of the application.

### Prototype

```java
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class PrototypeBean {
  public PrototypeBean() {
    System.out.println("Creating a new instance of PrototypeBean");
  }
}
```

In this example, `PrototypeBean` is annotated with `@Scope("prototype")`, which means that a new instance of `PrototypeBean` will be created each time it is requested.

### Websocket Scope

```java
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

@Component
@Scope("websocket")
@EnableWebSocket
public class WebSocketBean extends TextWebSocketHandler implements WebSocketConfigurer {
  public WebSocketBean() {
    System.out.println("Creating a new instance of WebSocketBean");
  }

  @Override
  public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    registry.addHandler(this, "/my-websocket-endpoint").setAllowedOrigins("*");
  }

  @Override
  public void configureWebSocketTransport(ServletServerContainerFactoryBean container) {
    container.setMaxSessionIdleTimeout(30 * 1000); // 30 seconds
    container.setMaxTextMessageBufferSize(1024 * 1024); // 1 MB
  }
}
```

In this example, the `@Scope("websocket")` annotation is used to indicate that instances of this bean should have `WebSocket` scope. This means that a new instance of the `WebSocketBean` class will be created for each `WebSocket` session that connects to the server.

The `WebSocketBean` class also implements the `WebSocketConfigurer` interface, which allows it to register a `WebSocket` endpoint with the server. In this case, the `registerWebSocketHandlers()` method is used to register a `WebSocket` endpoint at `/my-websocket-endpoint` with the `TextWebSocketHandler` instance `(this)` as the handler for incoming WebSocket messages.

Finally, the `configureWebSocketTransport()` method is used to configure the `WebSocket` session `timeout` and message `buffer size` for the server. In this case, the `session timeout` is set to `30 seconds` and the message buffer size is set to `1 MB`. These settings will be applied to all WebSocket sessions that connect to the server.

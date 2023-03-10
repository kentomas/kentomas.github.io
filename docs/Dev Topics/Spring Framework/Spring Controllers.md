# Spring Controllers

## Determining URL Paths for Spring Controllers

The following sample codes highlight how to correct paths to controllers.

| Path                                | Result   |
| ----------------------------------- | -------- |
| `https://localhost:8080/api/users`  | ✅      |
| `https://localhost:8080/api/users/` | ❌      |

```java title="UserController.java" linenums="1" hl_lines="25"
package com.example.basicspringbootmysqlsample;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {

        this.userService = userService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }

    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
}

```

| Path                                | Result   |
| ----------------------------------- | -------- |
| `https://localhost:8080/api/users`  | ❌      |
| `https://localhost:8080/api/users/` | ✅      |

```java title="UserController.java" linenums="1" hl_lines="25"
package com.example.basicspringbootmysqlsample;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {

        this.userService = userService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }

    @GetMapping("/")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
}

```

### Sample UserController

In this example, we have a `UserController` that handles requests to `/users`. The controller uses a `UserService` instance to retrieve the list of users and a specific user by their ID.

- The `@RestController` annotation indicates that this class is a Spring MVC controller and that each of its methods will return a response body that can be serialized into JSON or XML. The `@RequestMapping` annotation specifies the base URL that this controller will handle.
- The `@Autowired` annotation injects an instance of the UserService into the controller.
- The `@GetMapping` annotation specifies that the `getUsers()` method should handle `GET` requests to the `/users` URL. This method simply returns a list of all users retrieved from the `UserService`.
- The `@GetMapping` annotation on the getUserById() method specifies that this method should handle GET requests to the `/users/{id}` URL, where `{id}` is a `path variable` that `represents` the `ID` `of` the `user` to retrieve. The method then calls the `getUserById()` method on the `UserService` to retrieve the user with the specified ID. The user is returned as the response body, and Spring MVC automatically serializes it into JSON or XML.

```java title="UserController.java" linenums="1" hl_lines="10 15"
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public List<User> getUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/{id}")
    public User getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }
}
```

- `http://localhost:8080/users` - This will return `getUsers()`.
- `http://localhost:8080/users/1` - This will return the user with `id` = `1`.
    - `http://localhost:8080/users/{id}` - The function `getUserById(..)` is expecting a value in the URI `path`.

## Dealing with Path Variables

- The order of the path variable declarations in the function definition matters in Spring MVC.
- When you define a function that maps to a URL with path variables, Spring MVC uses the order of the path variable declarations in the function definition to match the corresponding parts of the URL.

For example, suppose you have a URL pattern like `/users/{userId}/orders/{orderId}`, and you define a function to handle this URL with the following signature:

```java
@GetMapping("/users/{userId}/orders/{orderId}")
public String getOrderDetails(@PathVariable Long orderId, @PathVariable Long userId) {
    // ...
}
```

In this example, the order of the `@PathVariable` annotations in the function signature matters. The first `@PathVariable` annotation corresponds to the `{orderId}` part of the URL, and the second `@PathVariable` annotation corresponds to the `{userId}` part of the URL.

If you swap the order of the `@PathVariable` annotations in the function signature, like this:

```java
@GetMapping("/users/{userId}/orders/{orderId}")
public String getOrderDetails(@PathVariable Long userId, @PathVariable Long orderId) {
    // ...
}
```

Then Spring MVC will match the `{userId}` part of the URL to the `orderId` parameter, and the `{orderId}` part of the URL to the `userId` parameter.

Therefore, it's **important to declare the path variables in the correct order** in your function definition to ensure that Spring MVC can match them correctly to the corresponding parts of the URL.

## Dealing with Parameters

- Whether to use `@RequestParam` or `@PathVariable` depends on the specific use case and the design of your API.
- `@RequestParam` is typically used for optional query parameters or when the parameter values are relatively simple and can be easily extracted from the request URI. Query parameters are usually used to filter or sort data, and can be added to a URL as key-value pairs.
- On the other hand, `@PathVariable` is typically used for required parameters or when the parameter values are complex and cannot be easily extracted from the request URI. Path variables are usually used to identify a specific resource, such as a user or an item, in the URI.
- In general, it's a `good idea` to `use` `path variables` for `required parameters` that are `part of` the `resource identifier` `in` the `URI`, and use `query parameters` for `optional parameters` that `modify` the `behavior` `of` the `resource retrieval`.
- In summary, `@RequestParam` and @PathVariable are both useful annotations for handling parameters in a Spring MVC application. The choice of which one to use depends on the specific requirements of your application and the design of your API.

```java title="UserController.java"
@GetMapping("/users")
public User getUserById(@RequestParam(name = "id", required = false, defaultValue = "0") Long id) {
    if (id == 0) {
        throw new IllegalArgumentException("ID parameter is required");
    }
    return userService.getUserById(id);
}
```

Combination of endpoint using `PathVariables` and `Parameters`:

```java title="UserController.java"
@GetMapping("/users/{id}")
public User getUserById(@PathVariable Long id, @RequestParam(name = "name", required = false) String name) {
    if (name != null) {
        // search by name
        return userService.getUserByName(name);
    } else {
        // search by id
        return userService.getUserById(id);
    }
}
```

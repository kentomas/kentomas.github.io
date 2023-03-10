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

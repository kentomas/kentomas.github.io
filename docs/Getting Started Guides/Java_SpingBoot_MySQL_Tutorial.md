# Java SpringBoot MySQL Tutorial

**Source:** <https://spring.io/guides/gs/accessing-data-mysql/#scratch>

## Pre-requisites

1. MySQL Server is installed.
      1. Windows (x86, 32-bit), MSI Installer - v8.0.32 - <https://dev.mysql.com/downloads/installer/>
2. IntelliJ Community is installed.
      1. OpenJDK 19 is installed with this.

## Steps

### Initialize Java Spring Project

1. Go to: <https://start.spring.io/>
2. Use the following settings:
    1. `Project`: Maven
    2. `Language`: Java
    3. `Spring Boot`: 3.0.3
    4. `Project MetaData`
        1. `Group`: com.example
        2. `Artifact`: accessing-data-mysql
        3. `Name`: accessing-data-mysql
        4. `Description`: Demo project for Spring Boot
        5. `Package name`: com.example.accessing-data-mysql
        6. `Packaging`: Jar
        7. `Java`: 19
    5. `Dependencies`:
        1. Spring Web
        2. Spring Data JPA
        3. MySQL Driver
3. Click `Generate` button to download the `*.zip` file.
4. Extract all files from the zip.
    1. `G:\git\accessing-data-mysql`

### Create Database in MySQL

1. Open `MySQL Workbench`.
2. Open the MySQL Instance.
    1. `MySQL Connections` > `Local instance MySQL80` > `Open Connection`
3. Create a new Schema.
    1. `Navigator` > `Schemas` > Right-click > `Create Schema..`
    2. Fill in details:
        1. `Name`: db_example
4. Create new DB User
    1. `Navigator` > `Administration` > `Management` > `Users and Privileges`
    2. Click `Add Account`.
    3. Fill details:
        1. `Login Name`: springuser
        2. `Authentication Type`: Standard
        3. `Limit to Hosts Matching`: %
        4. `Password`: ###########
        5. Schema Privileges
            1. Click on `Add Entry` button.
                1. `Selected schema`: db_example
            2. Click on `Select "ALL"` button to grant this new user full privileges to selected schema.
            3. Click `Apply` button.
5. Copy Instance URL
    1. MySQL Workbench > Home > MySQL Connections > right-click > `Copy JDBC Connection String to Clipboard`.
        1. Sample copied connection: `jdbc:mysql://localhost:3306/?user=root`.

### Open Project in IntelliJ

1. Run `IntelliJ`
2. Open the extracted files.
    1. `G:\git\accessing-data-mysql`
3. Wait for Maven dependencies to be downloaded.

### Create Application

1. Create `User` class.
    1. This will be a Spring boot `Entity` class.
    2. A table will be created following the properties of this class.
2. Create `UserRepository` interface.
    1. This will extend the `CrudRepository` class.
    2. This will create a table called `user` with the column names matching the properties of the `User` class.
3. Create `UserController` class.
    1. This class will handle the HTTP Requests.
4. Update `application.properties` file with `db configuration` strings:
    1. spring.jpa.hibernate.ddl-auto=update
    2. spring.datasource.url=jdbc:mysql://localhost:3306/db_example
    3. spring.datasource.username=springuser
    4. spring.datasource.password=##########
    5. spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

### Build

1. Press `Ctrl` + `F9`.

### Run

1. Press `Shift` + `F10`.

## Sample Code

```java title="User.java" linenums="1" hl_lines="8 10-12"
package com.example.accessingdatamysql;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity // This tells hibernate to make a table out of this class
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;
    private String email;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
```

```java title="UserRepository.java" linenums="1" hl_lines="8"
package com.example.accessingdatamysql;

import org.springframework.data.repository.CrudRepository;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface UserRepository extends CrudRepository<User, Integer> {
}
```

```java title="UserController.java" linenums="1" hl_lines="7-8 15-16 19 32"
package com.example.accessingdatamysql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller // This means that this class is a Controller. As a controller it can handle HTTP requests.
@RequestMapping(path = "/demo") // This means the URLs start with "/demo" (after the Application path)
public class UserController {

    private final UserRepository userRepository;

    // We're using Dependency Injection.
    // userRepository will be instantiated by the Spring Framework.
    public MainController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping(path = "/add") // Map ONLY POST requests
    public @ResponseBody String addNewUser(@RequestParam String name, @RequestParam String email) {
        // @ResponseBody means that the returned String is the response, not a view name.
        // @ResponseParam means it is a parameter from the GET or POST request.

        User u = new User();
        u.setName(name);
        u.setEmail(email);

        userRepository.save(u);
        return "Saved";
    }

    @GetMapping(path = "/users")
    public @ResponseBody Iterable<User> Users() {
        // @ResponseBody means that the returned String is the response, not a view name.
        return userRepository.findAll(); // This returns a JSON or XML with the users
    }
}

```

```java title="application.properties" linenums="1"
spring.jpa.hibernate.ddl-auto=update
spring.datasource.url=jdbc:mysql://localhost:3306/db_example
spring.datasource.username=springuser
spring.datasource.password=##########
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
#spring.jpa.show-sql: true
```

## References

- <https://spring.io/guides/gs/accessing-data-mysql/#scratch>

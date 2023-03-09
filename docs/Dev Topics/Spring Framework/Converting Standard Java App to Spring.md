# Converting Standard Java App to Spring Boot Application

## Overview

Converting a standard Java Application to a Spring Boot Application using Maven.

## Steps

1. Update the dependencies file (`pom.xml`) in the Module.

    1. Add the parent tag.
    2. Add `spring-boot-starter-web` dependency.
    3. Add `spring-boot-starter-test` dependency.
    4. Add `spring-boot-maven-plugin` dependency plugin.

    ```xml title="pom.xml" linenums="1" hl_lines="7-12 25-34 37-44"
    <?xml version="1.0" encoding="UTF-8"?>
    <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
        <modelVersion>4.0.0</modelVersion>

        <parent>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-parent</artifactId>
            <version>3.0.4</version>
            <relativePath/>
        </parent>

        <groupId>org.example</groupId>
        <artifactId>JavaToSpringConversion</artifactId>
        <version>1.0-SNAPSHOT</version>

        <properties>
            <maven.compiler.source>19</maven.compiler.source>
            <maven.compiler.target>19</maven.compiler.target>
            <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        </properties>

        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-web</artifactId>
                <version>3.0.4</version>
            </dependency>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-test</artifactId>
                <version>3.0.4</version>
            </dependency>
        </dependencies>

        <build>
            <plugins>
                <plugin>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-maven-plugin</artifactId>
                </plugin>
            </plugins>
        </build>

    </project>
    ```

2. Update main application.

    1. Add `@SpringBootApplication` annotation to main class.
    2. Run application class as a `SpringApplication`.

    ```java title="Main.java" linenums="1" hl_lines="3-4 6 9"
    package org.example;

    import org.springframework.boot.SpringApplication;
    import org.springframework.boot.autoconfigure.SpringBootApplication;

    @SpringBootApplication
    public class Main {
        public static void main(String[] args) {
            SpringApplication.run(Main.class, args);
            System.out.println("Hello world!");
        }
    }
    ```

## Resources

- <https://www.youtube.com/watch?v=NzfC3okMfMo>

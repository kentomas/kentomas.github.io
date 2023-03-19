# Spring Beans

## Overview

In Spring Framework, `@Bean` is an annotation that is used to declare a method as a provider of a bean instance. When Spring's container initializes, it will call the `@Bean` method to obtain an instance of the bean, and then register that instance in the container. You can then use that bean in other parts of your application by injecting it into other objects using Spring's dependency injection.

Here's an example of using @Bean annotation in a Spring configuration class:

```java
@Configuration
public class AppConfig {

    @Bean
    public MyService myService() {
        return new MyServiceImpl();
    }
}
```

In the example above, the `@Bean` annotation is applied to the `myService()` method, indicating that it is a bean provider method. The method returns an instance of `MyServiceImpl`, which will be registered in the Spring container when the container is initialized.

You can then use this bean in other parts of your application by injecting it into other objects using Spring's dependency injection, like this:

```java
@Service
public class MyController {

    private final MyService myService;

    public MyController(MyService myService) {
        this.myService = myService;
    }

    // ...
}
```

In the example above, the `MyController` class is annotated with `@Service` to indicate that it is a Spring-managed service bean. The `MyService` dependency is injected into the `MyController` constructor using Spring's dependency injection, and Spring will provide an instance of `MyServiceImpl`, which was declared as a bean in the AppConfig class.

## Bean is a Singleton

Yes, using the `@Bean` annotation in Spring can be understood as creating `singleton` objects.

When you declare a method as a `@Bean` method, Spring will create a singleton bean by default. This means that, when the application context is created, Spring will create only one instance of the bean and store it in its container. Any subsequent requests for that bean will return the same instance.

For example, consider the following code:

```java
@Configuration
public class AppConfig {

    @Bean
    public MyService myService() {
        return new MyServiceImpl();
    }
}
```

In this code, the `myService()` method is annotated with `@Bean`. When the Spring container is initialized, it will create a single instance of `MyServiceImpl` and store it in its container. Any time that `MyService` is injected into another bean, Spring will provide the same instance that was created during initialization.

Suppose you have a `MyController` class that depends on the `MyService` bean created by the `myService()` method in the `AppConfig` class:

```java
@Service
public class MyController {

    private final MyService myService;

    public MyController(MyService myService) {
        this.myService = myService;
    }

    // ...
}
```

In this code, the `MyController` class is annotated with `@Service` to indicate that it's a Spring-managed bean. The `MyService` dependency is injected into the `MyController` constructor using Spring's dependency injection, and Spring will provide an instance of `MyServiceImpl`, which was declared as a bean in the `AppConfig` class.

Now, suppose you have another bean, MyOtherBean, that also depends on MyService:

```java
@Service
public class MyOtherBean {

    private final MyService myService;

    public MyOtherBean(MyService myService) {
        this.myService = myService;
    }

    // ...
}
```

In this code, `MyOtherBean` is also annotated with `@Service` and depends on `MyService`. When Spring initializes `MyOtherBean`, it will see that it depends on `MyService` and inject the same instance of `MyServiceImpl` that was created during initialization.

So, any time that `MyService` is injected into another bean, Spring will provide the same instance that was created during initialization. This ensures that all beans that depend on `MyService` are using the same instance and that changes to that instance are visible to all beans that use it.

So, yes, you can think of `@Bean` methods in Spring as creating singleton objects. However, it's important to note that Spring supports other bean scopes as well, such as prototype (which creates a new object every time it's injected) and request (which creates a new object for each HTTP request). By default, `@Bean` methods create singleton objects, but you can change the scope by specifying the scope attribute on the `@Bean` annotation.



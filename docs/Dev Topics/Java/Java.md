# Java

## JavaBean

In Java, a JavaBean is a Java class that follows a set of conventions defined by the JavaBeans specification. A JavaBean is a reusable software component that can be manipulated visually in a builder tool. JavaBeans are used to encapsulate many objects into a single object (the bean), which can then be passed around, stored, and manipulated as a single unit.

The JavaBeans specification defines several rules that a class must follow to be considered a JavaBean:

1. The class must have a public default constructor (i.e., a constructor with no arguments).
2. The class should implement the Serializable interface.
3. The class should provide getter and setter methods for all its properties.

Here's an example of a simple JavaBean:

```java
public class Person implements Serializable {
    private String name;
    private int age;

    public Person() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
```

To use a `JavaBean`, you can create an instance of the class and set its properties using the provided setter methods. For example:

```java
Person person = new Person();
person.setName("John Doe");
person.setAge(30);
```

You can also get the values of the properties using the provided getter methods:

```java
String name = person.getName();
int age = person.getAge();
```

`JavaBeans` are commonly used in graphical user interface (GUI) programming, such as in Java Swing or JavaFX, to represent various GUI components, such as buttons, labels, text fields, and so on. By using JavaBeans to encapsulate these GUI components, you can manipulate them visually in a builder tool and easily pass them around and manipulate them as a single unit in your Java code.

## Class Control Access

In Java, you can control access to classes, methods, and fields using access modifiers such as `public`, `private`, `protected`, and `default`.

To prevent a class in your library from being accessed by another application that uses your library, you can make the class `private` or `package-private` (also known as default access).

- A `private` class `can only be accessed within the same class` in which it is declared.
- A `package-private` class `can be accessed by other classes in the **same package**`, but not by classes in other packages.

Here's an example of how to make a class private:

```java title="Private Class"
// FILENAME: MyPublicClass.java
public class MyPublicClass {
    private class MyClass {
        // class code here
    }
}
```

And here's an example of how to make a class package-private:

```java title="Package-private Class"
// FILENAME: MyClass.java
class MyClass {
    // class code here
}
```

By default, a class that doesn't have any access modifier is `package-private`.

Note that making a class private or package-private can affect the usability of your library, as other classes in your library may need to access that class. In general, it's best to make only the parts of your library that you want to hide `private` or `package-private`, and make the rest `public` or `protected`.

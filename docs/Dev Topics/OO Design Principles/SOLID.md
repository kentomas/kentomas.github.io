# SOLID Principles

## Single Responsibility Principle

Single Responsibility Principle (SRP) - A class should have only one reason to change.

In this example:

- The `Circle` class only has one responsibility, which is to represent a circle and provide methods to `get` and `set` its radius and area.

=== "C++"

```cpp
class Circle {
public:
    void setRadius(double radius) { m_radius = radius; }
    double getRadius() const { return m_radius; }
    double getArea() const { return 3.14 * m_radius * m_radius; }

private:
    double m_radius;
};
```

## Open Closed Principle

Open-Closed Principle (OCP) - A class should be open for extension but closed for modification.

In this example:

- The `Shape` class acts as an interface and is open for extension through inheritance.
- The `Circle` and `Rectangle` classes `implement` the `area` method and are `closed for modification`, since they `do not modify` the `base class`.

=== "C++"

```cpp
class Shape {
public:
    virtual double area() const = 0;
};

class Circle : public Shape {
public:
    Circle(double radius) : m_radius(radius) {}
    double area() const override { return 3.14 * m_radius * m_radius; }

private:
    double m_radius;
};

class Rectangle : public Shape {
public:
    Rectangle(double width, double height) : m_width(width), m_height(height) {}
    double area() const override { return m_width * m_height; }

private:
    double m_width, m_height;
};

```

## Liskov Substitution Principle

Liskov Substitution Principle (LSP) - Subtypes must be substitutable for their base types.

In this example:

- The `Square` class is a `subtype` of the `Rectangle` class and is substitutable for it.
- Since a `Square` `is a type` of `Rectangle`, it should be `usable anywhere a Rectangle` is required, without causing any issues.

=== "C++"

```cpp
class Rectangle {
public:
    virtual void setWidth(double width) { m_width = width; }
    virtual void setHeight(double height) { m_height = height; }
    virtual double getWidth() const { return m_width; }
    virtual double getHeight() const { return m_height; }
    virtual double getArea() const { return m_width * m_height; }

protected:
    double m_width, m_height;
};

class Square : public Rectangle {
public:
    void setWidth(double width) override { m_width = m_height = width; }
    void setHeight(double height) override { m_width = m_height = height; }
};

```

## Interface Segmentation Principle

Interface Segregation Principle (ISP) - Clients should not be forced to depend on interfaces they don't use.

In this example:

- The `IWorker` interface is defined with a single `work()` method.
- The `Robot` class `implements` `IWorker` but `does not` `implement` `IEat`.
- The `Person` class implements both `IWorker` and `IEat`.
- By separating the `eat()` method into its own `interface` `IEat`, we avoid forcing the `Robot` class to implement an unnecessary method, which is a violation of the ISP.
- This makes the system more flexible and easier to maintain, since changes to the `Person` class won't affect the `Robot` class and vice versa.

=== "C++"

```cpp
class IWorker {
public:
    virtual void work() = 0;
};

class IEat {
public:
    virtual void eat() = 0;
};

class Robot : public IWorker {
public:
    void work() override { /* implementation */ }
};

class Person : public IWorker, public IEat {
public:
    void work() override { /* implementation */ }
    void eat() override { /* implementation */ }
};
```

## Dependency Inversion Principle

Dependency Inversion Principle (DIP) - High-level modules should not depend on low-level modules; both should depend on abstractions.

In this example:

- The `AreaCalculator` class depends on an abstraction (the `IShape` interface), rather than on concrete implementations (the `Circle` and `Rectangle` classes).
- This allows for the implementation of the `Circle` and `Rectangle` classes to `change independently`, `without affecting` the `AreaCalculator` class.
- This `principle helps` to `decouple` the `different components` of the system, making it more flexible and maintainable.

=== "C++"

```cpp
class IShape {
public:
    virtual double area() const = 0;
};

class Circle : public IShape {
public:
    Circle(double radius) : m_radius(radius) {}
    double area() const override { return 3.14 * m_radius * m_radius; }

private:
    double m_radius;
};

class Rectangle : public IShape {
public:
    Rectangle(double width, double height) : m_width(width), m_height(height) {}
    double area() const override { return m_width * m_height; }

private:
    double m_width, m_height;
};

class AreaCalculator {
public:
    AreaCalculator(const std::vector<IShape*>& shapes) : m_shapes(shapes) {}
    double totalArea() const {
        double area = 0;
        for (const auto shape : m_shapes) {
            area += shape->area();
        }
        return area;
    }

private:
    std::vector<IShape*> m_shapes;
};

```

## References

- <https://www.freecodecamp.org/news/solid-principles-explained-in-plain-english/>
